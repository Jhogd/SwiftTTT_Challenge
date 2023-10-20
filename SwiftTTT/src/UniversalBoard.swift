import Foundation
class UniversalBoard {
    static func board_is_full(board: Array<String>) -> Bool {
        board.allSatisfy { $0 != " "}
    }
    static  func board_is_empty(board: Array<String>) -> Bool {
        board.allSatisfy { $0 == " "}
    }
    static func maybe_return_winner(board: IBoard, current_board: Array<String>) -> String {
        if board.check_win(board: current_board , player: "X") {
            return "X"
        }
        else if board.check_win(board: current_board , player: "O") {
            return "O"
        }
        
        else if board_is_full(board: current_board) {
            return "C"
        }
        return " "
    }
    static func game_is_over(board: IBoard, current_board: Array<String>) -> Bool {
        board.check_win(board: current_board, player: "X") ||
        board.check_win(board: current_board, player: "O") ||
        board_is_full(board: current_board)
    }
    func check_combo_win(board_combo: Array<String>, player: String) -> Bool{
        return board_combo.allSatisfy { $0 == player}
    }
}
