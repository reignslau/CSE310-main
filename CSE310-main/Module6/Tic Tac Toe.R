# Function to initialize the game board
initialize_board <- function() {
  board <- matrix(rep(" ", 9), nrow = 3, byrow = TRUE)
  return(board)
}

# Function to print the game board
print_board <- function(board) {
  cat("\n")
  for (row in 1:3) {
    cat(" ", board[row, 1], " | ", board[row, 2], " | ", board[row, 3], " \n")
    if (row < 3) {
      cat("---+---+---\n")
    }
  }
  cat("\n")
}

# Function to check if the game board is full
is_board_full <- function(board) {
  return(all(board != " "))
}

# Function to check if a player has won
check_winner <- function(board, player) {
  # Check rows
  if (any(apply(board, 1, function(row) all(row == player)))) {
    return(TRUE)
  }
  
  # Check columns
  if (any(apply(board, 2, function(col) all(col == player)))) {
    return(TRUE)
  }
  
  # Check diagonals
  if (all(board[c(1, 5, 9)] == player) || all(board[c(3, 5, 7)] == player)) {
    return(TRUE)
  }
  
  return(FALSE)
}

# Function to get a valid move from the player
get_move <- function(board, player) {
  while (TRUE) {
    cat("Player ", player, ", enter your move (1-9): ")
    move <- as.integer(readline())
    if (!is.na(move) && move %in% 1:9 && board[move] == " ") {
      return(move)
    } else {
      cat("Invalid move. Please try again.\n")
    }
  }
}

# Function to play the tic-tac-toe game
play_tic_tac_toe <- function() {
  cat("Welcome to Tic-Tac-Toe!\n")
  
  board <- initialize_board()
  print_board(board)
  
  players <- c("X", "O")
  current_player <- 1
  
  while (TRUE) {
    player <- players[current_player]
    move <- get_move(board, player)
    
    row <- (move - 1) %/% 3 + 1
    col <- (move - 1) %% 3 + 1
    
    board[row, col] <- player
    print_board(board)
    
    if (check_winner(board, player)) {
      cat("Player ", player, " wins!\n")
      break
    }
    
    if (is_board_full(board)) {
      cat("It's a draw!\n")
      break
    }
    
    current_player <- 3 - current_player  # Switch players (1 -> 2 or 2 -> 1)
  }
}

# Start the game
play_tic_tac_toe()