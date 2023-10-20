import Foundation
class ThreebyThree: UniversalBoard, IBoard {
    var board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    let size = 3
    func check_win(board: Array<String>, player: String) -> Bool {
        let rows = [[board[0], board[1], board[2]], [board[3], board[4], board[5]], [board[6], board[7], board[8]]]
        let cols = [[board[0], board[3], board[6]], [board[1], board[4], board[7]], [board[2], board[5], board[8]]]
        let diags = [[board[0], board[4], board[8]], [board[2], board[4], board[6]]]
        let row_winners = rows.map { check_combo_win(board_combo: $0, player: player)}
        let col_winners = cols.map { check_combo_win(board_combo: $0 , player: player)}
        let diag_winners = diags.map { check_combo_win(board_combo: $0 , player: player)}
       return row_winners.contains(true) || col_winners.contains(true) || diag_winners.contains(true)
        }
    }
