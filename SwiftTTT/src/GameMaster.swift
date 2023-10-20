import Foundation
class GameMaster {
   static func switch_player(player: String) -> String {
      return (player == "X") ? "O" : "X"
    }
    static func valid_move(board: Array<String>, move: Int) -> Bool {
         if board.indices.contains(move) && board[move] == " " {
             return true
         }
         return false
     }
   static func place_move(move: Int, board: Array<String>, player: String) -> Array<String> {
        var new_board = board
        new_board[move] = player
        return new_board
    }
}
