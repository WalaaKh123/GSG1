import 'dart:io';

void main() {
  List<String> board = List.generate(9, (i) => ' ');
  String currentPlayer = 'X';
  int moves = 0;

  void printBoard() {
    print("\n ${board[0]} | ${board[1]} | ${board[2]}");
    print("---+---+---");
    print(" ${board[3]} | ${board[4]} | ${board[5]}");
    print("---+---+---");
    print(" ${board[6]} | ${board[7]} | ${board[8]}\n");
  }

  bool checkWin(String p) {
    List<List<int>> wins = [
      [0,1,2],[3,4,5],[6,7,8], // rows
      [0,3,6],[1,4,7],[2,5,8], // columns
      [0,4,8],[2,4,6]          // diagonals
    ];
    return wins.any((line) => line.every((i) => board[i] == p));
  }

  while (true) {
    printBoard();
    stdout.write("Player $currentPlayer, enter (1-9): ");
    var input = stdin.readLineSync();
    int? pos = int.tryParse(input ?? '');
    if (pos == null || pos < 1 || pos > 9 || board[pos - 1] != ' ') {
      print("Invalid move. Try again.");
      continue;
    }
    board[pos - 1] = currentPlayer;
    moves++;

    if (checkWin(currentPlayer)) {
      printBoard();
      print("Player $currentPlayer wins!");
      break;
    } else if (moves == 9) {
      printBoard();
      print("It's a draw!");
      break;
    }

    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}
