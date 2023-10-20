import Foundation
class GameMasterSpec {
    let unit_test = TestAssertions()
    let player_x = "X"
    let player_o = "O"
    let board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    func test_switch_player() {
        let x_to_o = GameMaster.switch_player(player: player_x)
        let o_to_x = GameMaster.switch_player(player: player_o)
        unit_test.assertEquals(expected: player_o, actual: x_to_o, message: " from X to O")
        unit_test.assertEquals(expected: player_x, actual: o_to_x, message: " from O to X")
    }
    func test_place_move_0() {
        let new_board = GameMaster.place_move(move: 0, board: board, player: player_x)
        let expected_board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
        unit_test.assertEquals(expected: expected_board , actual: new_board, message: " places at pos 0")
    }
    func test_place_move_4() {
        let new_board = GameMaster.place_move(move: 4, board: board, player: player_o)
        let expected_board = [" ", " ", " ", " ", "O", " ", " ", " ", " "]
        unit_test.assertEquals(expected: expected_board , actual: new_board, message: " places at pos 4")
    }
    func test_place_move_multiple() {
        var new_board = GameMaster.place_move(move: 8, board: board, player: player_x)
        new_board = GameMaster.place_move(move: 0, board: new_board, player: player_o)
        let expected_board = ["O", " ", " ", " ", " ", " ", " ", " ", "X"]
        unit_test.assertEquals(expected: expected_board , actual: new_board, message: " places at pos 0 and 8")
    }
    func test_valid_move() {
        let is_valid_0 = GameMaster.valid_move(board: board, move: 0)
        let not_valid_9 = GameMaster.valid_move(board: board, move: 9)
        let new_board = ["O", " ", "O", " ", " ", "X", " ", " ", "X"]
        let not_valid_0 = GameMaster.valid_move(board: new_board, move: 0)
        let not_valid_2 = GameMaster.valid_move(board: new_board, move: 2)
        let not_valid_5 = GameMaster.valid_move(board: new_board, move: 5)
        let is_valid_1  = GameMaster.valid_move(board: new_board, move: 1)
        unit_test.assertEquals(expected: false, actual: not_valid_9, message: " outside board range")
        unit_test.assertEquals(expected: true, actual:  is_valid_0, message: " any move in range is valid when empty")
        unit_test.assertEquals(expected: false, actual: not_valid_0, message: " Invalid, spot is taken")
        unit_test.assertEquals(expected: false, actual:  not_valid_2, message: " Invalid, spot is taken")
        unit_test.assertEquals(expected: false, actual:  not_valid_5, message: " Invalid, spot is taken")
        unit_test.assertEquals(expected: true, actual:  is_valid_1, message: " this spot is empty")
    }
}
