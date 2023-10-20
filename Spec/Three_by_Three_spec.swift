import Foundation
class Three_by_Three_spec {
    let unit_test = TestAssertions()
    let board_handler = ThreebyThree()
    let blank_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    func test_init_board () {
        let board = board_handler.board
        unit_test.assertEquals(expected: blank_board, actual: board, message: " Init board")
        unit_test.assertEquals(expected: 3, actual: board_handler.size, message: " size 3")
    }
    func test_check_win_blank() {
        let is_win_blank = board_handler.check_win(board: blank_board, player: "X")
        unit_test.assertEquals(expected: false, actual: is_win_blank , message: " false when empty")
    }
    func test_check_win_rows() {
        let first_row_win = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
        let second_row_win = ["X", "X", "O", "O", "O", "O", " ", " ", " "]
        let third_row_win = ["O", "X", "X", " ", " ", " ", "X", "X", "X"]
        let is_win_row1_X = board_handler.check_win(board: first_row_win, player: "X")
        let is_win_row2_X = board_handler.check_win(board: second_row_win, player: "O")
        let is_win_row3_X = board_handler.check_win(board: third_row_win, player: "X")
        unit_test.assertEquals(expected: true, actual: is_win_row1_X , message: " win row1")
        unit_test.assertEquals(expected: true, actual: is_win_row2_X , message: " win row2")
        unit_test.assertEquals(expected: true, actual: is_win_row3_X , message: " win row3")
    }
    func test_check_win_cols() {
        let first_col_win = ["X", "O", "O", "X", " ", " ", "X", " ", " "]
        let second_col_win = ["O", "X", "O", "O", "X", "X", " ", "X", " "]
        let third_col_win = ["O", "X", "O", " ", " ", "O", "X", "X", "O"]
        let is_win_col1_X = board_handler.check_win(board: first_col_win, player: "X")
        let is_fail_col1_O = board_handler.check_win(board: first_col_win, player: "O")
        let is_win_col2_X = board_handler.check_win(board: second_col_win, player: "X")
        let is_win_col3_X = board_handler.check_win(board: third_col_win, player: "O")
        unit_test.assertEquals(expected: true, actual: is_win_col1_X , message: " win col1")
        unit_test.assertEquals(expected: false, actual: is_fail_col1_O , message: " not a win for O col1")
        unit_test.assertEquals(expected: true, actual: is_win_col2_X , message: " win col2")
        unit_test.assertEquals(expected: true, actual: is_win_col3_X , message: " win col3")
    }
    func test_check_win_diags() {
        let first_diag_win = ["X", "O", "O", "X", "X", " ", "O", " ", "X"]
        let first_diag_lose = ["X", "O", "O", "X", "O", " ", "O", " ", "X"]
        let second_diag_win = ["O", "X", "O", "X", "O", " ", "O", " ", "X"]
        let second_diag_lose = ["O", "X", "X", "X", "O", " ", "O", " ", "X"]
        let is_win_diag1_X = board_handler.check_win(board: first_diag_win, player: "X")
        let is_lose_diag1_X = board_handler.check_win(board: first_diag_lose, player: "X")
        let is_win_diag2_O = board_handler.check_win(board: second_diag_win, player: "O")
        let is_lose_diag2_O = board_handler.check_win(board: second_diag_lose, player: "O")
        unit_test.assertEquals(expected: true, actual: is_win_diag1_X , message: " win diag1")
        unit_test.assertEquals(expected: false, actual: is_lose_diag1_X , message: " not a win diag1")
        unit_test.assertEquals(expected: true, actual: is_win_diag2_O , message: " win diag2")
        unit_test.assertEquals(expected: false, actual: is_lose_diag2_O , message: " not a win diag2")
    }
}
