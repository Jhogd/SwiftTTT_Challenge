import Foundation
class TerminalInputSpec {
    let suppress_std = SuppressStdinStdout()
    let unit_test = TestAssertions()
    let user_input = TerminalInput()
    func test_get_move_empty_board() {
        let empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        suppress_std.redirect_stdin(to: ["1\n         "]) {
            let move = user_input.get_move(board: empty_board)
            unit_test.assertEquals(expected: 0, actual: move, message: " returns valid move even with white space")
        }
    }
    func test_get_move_spot_taken() {
        var move = 1000
        let empty_board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["1\n", "2\n"]) {
                move = user_input.get_move(board: empty_board)
            }
        }
        unit_test.assertEquals(expected: 1, actual: move, message: " first move is taken then accepts 2")
    }
    func test_get_move_is_not_a_number() {
        var move = 1000
        let empty_board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["4hfksdfdfd\n", "2\n"]) {
                move = user_input.get_move(board: empty_board)
            }
        }
        unit_test.assertEquals(expected: 1, actual: move, message: " first input not a number accepts second")
    }
    func test_get_move_is_not_whole() {
        var move = 1000
        let empty_board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["1/2\n", "2\n"]) {
                move = user_input.get_move(board: empty_board)
            }
        }
        unit_test.assertEquals(expected: 1, actual: move, message: " first input is a fraction accepts second")
    }
    func test_get_move_is_out_of_bounds() {
        var move = 1000
        let empty_board = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["11\n", "2\n"]) {
                move = user_input.get_move(board: empty_board)
            }
        }
        unit_test.assertEquals(expected: 1, actual: move, message: " first input is out of bounds accepts second")
    }
    func test_get_player_valid_choice_x() {
       var player_choice = ""
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["x"]) {
               player_choice  = user_input.get_player()
            }
        }
        unit_test.assertEquals(expected: "X", actual: player_choice, message: " accepts lowercase X")
    }
    func test_get_player_valid_choice_X() {
       var player_choice = ""
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["X"]) {
               player_choice  = user_input.get_player()
            }
        }
        unit_test.assertEquals(expected: "X", actual: player_choice, message: " accepts uppercase X")
    }
    func test_get_player_valid_choice_o() {
       var player_choice = ""
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["o"]) {
               player_choice  = user_input.get_player()
            }
        }
        unit_test.assertEquals(expected: "O", actual: player_choice, message: " accepts lower case o")
    }
    func test_get_player_valid_choice_O() {
       var player_choice = ""
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["O"]) {
               player_choice  = user_input.get_player()
            }
        }
        unit_test.assertEquals(expected: "O", actual: player_choice, message: " accepts upper case o")
    }
    func test_get_player_invalid_choices() {
       var player_choice = ""
        suppress_std.suppress_print {
            suppress_std.redirect_stdin(to: ["g", "c...", "1", "xcdfdfd", "odmkdemfme", "o"]) {
               player_choice  = user_input.get_player()
            }
        }
        unit_test.assertEquals(expected: "O", actual: player_choice, message: " accepts ONLY x or o")
    }
}
