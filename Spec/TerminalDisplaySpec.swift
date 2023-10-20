import Foundation
class TerminalDisplaySpec {
    let display = TerminalDisplay()
    let unit_test = TestAssertions()
    let suppress_std = SuppressStdinStdout()
    func test_display_empty() {
        var displayed_board = ""
        let empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        let expected_display = "  |   |   \n---------\n  |   |   \n---------\n  |   |   \n"
        displayed_board = suppress_std.capture {
            display.display_board(board: empty_board , size: 3)
        }
        unit_test.assertEquals(expected: expected_display, actual: displayed_board, message: " displays empty board")
    }
    func test_display_players() {
        var displayed_board = ""
        let empty_board = [" ", "X", " ", "O", "X", "O", " ", " ", " "]
        let expected_display = "  | X |   \n---------\nO | X | O \n---------\n  |   |   \n"
        displayed_board = suppress_std.capture {
            display.display_board(board: empty_board , size: 3)
        }
        unit_test.assertEquals(expected: expected_display, actual: displayed_board, message: " displays board with players")
    }
    func test_display_start_message() {
        var starting_message = ""
        let expected_message = "Welcome to Tic Tac Toe!\n\n"
        starting_message = suppress_std.capture {
            display.starting_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: starting_message, message: " game start message")
    }
    func test_display_winning_message_O() {
        var winning_message = ""
        let expected_message = "Player O has won the game!\n"
        winning_message = suppress_std.capture {
            display.winning_message(winner: "O")
        }
        unit_test.assertEquals(expected: expected_message, actual: winning_message, message: " O wins message")
    }
    func test_display_winning_message_X() {
        var winning_message = ""
        let expected_message = "Player X has won the game!\n"
        winning_message = suppress_std.capture {
            display.winning_message(winner: "X")
        }
        unit_test.assertEquals(expected: expected_message, actual: winning_message, message: " X wins message")
    }
    func test_display_winning_message_C() {
        var winning_message = ""
        let expected_message = "The game has ended in a draw\n"
        winning_message = suppress_std.capture {
            display.winning_message(winner: "C")
        }
        unit_test.assertEquals(expected: expected_message, actual: winning_message, message: " draw message")
    }
    func test_display_human_turn() {
        var human_message = ""
        let expected_message = "Please enter a move 1-9\n\n"
        human_message = suppress_std.capture {
            display.human_turn_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: human_message, message: " human turn message")
    }
    func test_display_ai_turn() {
        var ai_message = ""
        let expected_message = "The AI is choosing a move...\n\n"
        ai_message = suppress_std.capture {
            display.ai_turn_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: ai_message, message: " ai turn message")
    }
    func test_display_invalid_move() {
        var invalid_move = ""
        let expected_message = "This move is INVALID please try again\n\n"
        invalid_move = suppress_std.capture {
            TerminalDisplay.invalid_move_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: invalid_move, message: " Invalid move")
    }
    func test_display_invalid_player() {
        var invalid_player = ""
        let expected_message = "This is not a player option... try again\n\n"
        invalid_player = suppress_std.capture {
            TerminalDisplay.invalid_player_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: invalid_player, message: " Invalid player")
    }
    func test_display_choose_player() {
        var choose_player = ""
        let expected_message = "Please enter an X or O\n\n"
        choose_player = suppress_std.capture {
            display.choose_player_message()
        }
        unit_test.assertEquals(expected: expected_message, actual: choose_player, message: " Invalid player")
    }
}
