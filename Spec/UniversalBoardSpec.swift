import Foundation
class UniversalBoardSpec {
    let unit_test = TestAssertions()
    func test_is_empty() {
        let empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        let not_empty_board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
        let is_not_empty = UniversalBoard.board_is_empty(board: not_empty_board)
        let is_empty = UniversalBoard.board_is_empty(board: empty_board)
        unit_test.assertEquals(expected: false, actual: is_not_empty , message: " Board is not empty")
        unit_test.assertEquals(expected: true, actual: is_empty , message: " Board is empty")
    }
    func test_is_full() {
        let empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        let partial_full =  [" ", "X", "O", "X", " ", " ", "O", " ", " "]
        let full_board = ["O", "X", "X", "X", "O", "O", "O", "X", "X"]
        let is_not_full = UniversalBoard.board_is_full(board: empty_board)
        let is_full = UniversalBoard.board_is_full(board: full_board)
        let is_partial = UniversalBoard.board_is_full(board: partial_full)
        unit_test.assertEquals(expected: false, actual: is_not_full , message: " Board is not full")
        unit_test.assertEquals(expected: true, actual: is_full , message: " Board is full")
        unit_test.assertEquals(expected: false, actual: is_partial , message: " Board is not completely full")
    }
    func return_winner_test() {
        let board_handler = ThreebyThree()
        let win_x_board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
        let win_o_board = ["O", "O", "O", " ", " ", " ", " ", " ", " "]
        let draw_board = ["O", "X", "X", "X", "O", "O", "O", "X", "X"]
        let return_x = UniversalBoard.maybe_return_winner(board: board_handler, current_board: win_x_board)
        let return_o = UniversalBoard.maybe_return_winner(board: board_handler, current_board: win_o_board)
        let return_c = UniversalBoard.maybe_return_winner(board: board_handler, current_board: draw_board)
        unit_test.assertEquals(expected: "X", actual: return_x, message: " returns X as winner")
        unit_test.assertEquals(expected: "O", actual: return_o, message: " returns O as winner")
        unit_test.assertEquals(expected: "C", actual: return_c, message: " returns C for draw")
    }
    func game_over_test() {
        let board_handler = ThreebyThree()
        let not_over_board = ["X", " ", "O", " ", "O", "X", " ", " ", " "]
        let win_x_board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
        let win_o_board = ["O", "O", "O", " ", " ", " ", " ", " ", " "]
        let win_o_board2 = ["O", "X", "O", "O", " ", " ", "O", " ", " "]
        let draw_board = ["O", "X", "X", "X", "O", "O", "O", "X", "X"]
        let not_over = UniversalBoard.game_is_over(board: board_handler, current_board: not_over_board)
        let game_over_x = UniversalBoard.game_is_over(board: board_handler, current_board: win_x_board)
        let game_over_o = UniversalBoard.game_is_over(board: board_handler, current_board: win_o_board)
        let game_over_draw = UniversalBoard.game_is_over(board: board_handler, current_board: draw_board)
        let game_over2_o = UniversalBoard.game_is_over(board: board_handler, current_board: win_o_board2)
        unit_test.assertEquals(expected: false, actual: not_over, message: " game is not over")
        unit_test.assertEquals(expected: true, actual: game_over_x, message: " game over X wins")
        unit_test.assertEquals(expected: true, actual: game_over_o, message: "  game over O wins")
        unit_test.assertEquals(expected: true, actual: game_over_draw, message: " game over draw")
        unit_test.assertEquals(expected: true, actual: game_over2_o, message: " game over O win again")
    }
}
