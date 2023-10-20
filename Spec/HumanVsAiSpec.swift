import Foundation
class HumanVsAiSpec {
    var game_mode: HumanVsAi
    let unit_tests = TestAssertions()
    let suppress_std = SuppressStdinStdout()
    let ttt_alg = MinMax()
    let user_input = TerminalInput()
    var game_results = ""
    let display = TerminalDisplay()
    let game_board = ThreebyThree()
    let diff = Unbeatable()
    init() {
        let human_player = "X"
        let human_controller = Player(player: human_player)
        let ai_player = GameMaster.switch_player(player: human_player)
        let ai_controller = AiPlayer(player: ai_player)
        game_mode = HumanVsAi(current_board: game_board.board,human_player: human_controller, ai_player: ai_controller, display: display, game_board: game_board, user_input: user_input, ttt_alg: ttt_alg, difficulty: diff, start_player: "X")
        game_results = suppress_std.capture {
            suppress_std.redirect_stdin(to: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]) {
                game_mode.play_game()
            }
        }
    }
    func test_play_game_starts_empty() {
        let init_board =  "  |   |   \n---------\n  |   |   \n---------\n  |   |   \n"
        unit_tests.assertEquals(expected: true, actual: game_results.contains(init_board), message: " displays empty board")
    }
    func test_play_game_first_move() {
        let first_move =  "X |   |   \n---------\n  |   |   \n---------\n  |   |   \n"
        unit_tests.assertEquals(expected: true, actual: game_results.contains(first_move), message: " displays first player makes move ")
    }
    func test_play_game_displays_turn_messages() {
        let ai_message =  "The AI is choosing a move...\n\n"
        let human_message = "Please enter a move 1-9\n\n"
        unit_tests.assertEquals(expected: true, actual: game_results.contains(ai_message), message: " displays ai turn message ")
        unit_tests.assertEquals(expected: true, actual: game_results.contains(human_message), message: " displays human turn message ")
    }
    func test_play_game_ai_makes_move() {
        let ai_move = "X |   |   \n---------\n  | O |   \n---------\n  |   |   \n"
        unit_tests.assertEquals(expected: true, actual: game_results.contains(ai_move), message: " ai makes move ")
    }
    func test_play_game_human_makes_invalid_move() {
        let invalid_move = "This move is INVALID please try again\n\n"
        unit_tests.assertEquals(expected: true, actual: game_results.contains(invalid_move), message: " human makes invalid move")
    }
    func test_play_game_winner() {
        let winner = "Player O has won the game!\n"
        let winning_board_display = "X | X | O \n---------\nX | O |   \n---------\nO |   |   \n"
        let winning_board = ["X", "X", "O", "X", "O", " ", "O", " ", " "]
        unit_tests.assertEquals(expected: true, actual: game_results.contains(winner), message: " winner declared")
        unit_tests.assertEquals(expected: true, actual: game_results.contains(winning_board_display), message: " display winning board")
        unit_tests.assertEquals(expected: winning_board, actual: game_mode.current_board, message: " game board in winning state")
    }
}
