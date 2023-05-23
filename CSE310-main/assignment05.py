
from datetime import datetime, timedelta
import time
import threading
import random


MAX_QUEUE_SIZE = 10
SLEEP_REDUCE_FACTOR = 50
CARS_TO_PRODUCE = 500




class Car():
    """ This is the Car class that will be created by the manufacturers """


    car_makes = ('Ford', 'Chevrolet', 'Dodge', 'Fiat', 'Volvo', 'Infiniti', 'Jeep', 'Subaru',
                 'Buick', 'Volkswagen', 'Chrysler', 'Smart', 'Nissan', 'Toyota', 'Lexus',
                 'Mitsubishi', 'Mazda', 'Hyundai', 'Kia', 'Acura', 'Honda')

    car_models = ('A1', 'M1', 'XOX', 'XL', 'XLS', 'XLE', 'Super', 'Tall', 'Flat', 'Middle', 'Round',
                  'A2', 'M1X', 'SE', 'SXE', 'MM', 'Charger', 'Grand', 'Viper', 'F150', 'Town', 'Ranger',
                  'G35', 'Titan', 'M5', 'GX', 'Sport', 'RX')

    car_years = [i for i in range(1990, datetime.now().year)]

    def __init__(self):

        self.model = random.choice(Car.car_models)
        self.make = random.choice(Car.car_makes)
        self.year = random.choice(Car.car_years)


        time.sleep(random.random() / (SLEEP_REDUCE_FACTOR))


        self.display()

    def display(self):
        print(f'{self.make} {self.model}, {self.year}')


class QueueTwoFiftyOne():
    """ This is the queue object to use for this assignment. Do not modify!! """

    def __init__(self):
        self.items = []
        self.max_size = 0

    def get_max_size(self):
        return self.max_size

    def put(self, item):
        self.items.append(item)
        if len(self.items) > self.max_size:
            self.max_size = len(self.items)

    def get(self):
        return self.items.pop(0)


class Manufacturer(threading.Thread):
    """ This is a manufacturer.  It will create cars and place them on the car queue """

    def __init__(self, queue, sem_empty, sem_full):
        super(Manufacturer, self).__init__()
        self.cars_to_produce = random.randint(200, 300)  # Don't change
        self.queue = queue
        self.sem_empty = sem_empty
        self.sem_full = sem_full

    def run(self):

        for i in range(self.cars_to_produce):
            self.sem_full.acquire()
            car = Car()
            self.queue.put(car)
            self.sem_empty.release()
        self.sem_full.acquire()
        self.queue.put(None)
        self.sem_empty.release()
        print('<<<Manufacturer is done>>>')


class Dealership(threading.Thread):
    """ This is a dealer that receives cars """

    def __init__(self, sem_empty, sem_full, queue, stats, lock):
        super(Dealership, self).__init__()
        self.queue = queue
        self.sem_empty = sem_empty
        self.sem_full = sem_full
        self.lock = lock
        self.stats = stats

    def run(self):
        while True:

            self.sem_empty.acquire()
            with self.lock:
                car = self.queue.get()
                if car is None:
                    break
                self.stats[self.queue.get_max_size()] += 1
            self.sem_full.release()

            time.sleep(random.random() / (SLEEP_REDUCE_FACTOR))
        print("<<<Dealership is done>>>")


def run_production(manufacturer_count, dealer_count):
    """ This function will do a production run with the number of
        manufacturers and dealerships passed in as arguments.
    """


    begin_time = time.perf_counter()

    sem_empty = threading.Semaphore(0)
    sem_full = threading.Semaphore(MAX_QUEUE_SIZE)

    queue = QueueTwoFiftyOne()

    lock = threading.Lock()

    manufacturer_barrier = threading.Barrier(manufacturer_count)
    dealership_barrier = threading.Barrier(dealer_count)


    dealer_stats = [0] * dealer_count


    manufacturers = []
    for _ in range(manufacturer_count):
        manufacturer = Manufacturer(queue, sem_empty, sem_full)
        manufacturers.append(manufacturer)


    dealerships = []
    for _ in range(dealer_count):
        dealership = Dealership(sem_empty, sem_full, queue, dealer_stats, lock)
        dealerships.append(dealership)


 
    for dealership in dealerships:
        dealership.start()
    


    for manufacturer in manufacturers:
        manufacturer.start()


    for manufacturer in manufacturers:
        manufacturer.join()
    for dealership in dealerships:
        dealership.join()

    run_time = time.perf_counter() - begin_time


    manufacturer_stats = [manufacturer.cars_to_produce for manufacturer in manufacturers]
    return (run_time, queue.get_max_size(), dealer_stats, manufacturer_stats)


def main():
    """ Main function """


    runs = [(1, 1), (1, 2), (2, 1), (2, 2), (2, 5), (5, 2), (10, 10)]
    for manufacturers, dealerships in runs:
        run_time, max_queue_size, dealer_stats, manufacturer_stats = run_production(
            manufacturers, dealerships)

        print(f'Manufacturers       : {manufacturers}')
        print(f'Dealerships         : {dealerships}')
        print(f'Run Time            : {run_time:.2f} sec')
        print(f'Max queue size      : {max_queue_size}')
        print(f'Manufacturer Stats  : {manufacturer_stats}')
        print(f'Dealer Stats        : {dealer_stats}')
        print('')


        assert sum(dealer_stats) == sum(manufacturer_stats)


if __name__ == '__main__':
    main()
