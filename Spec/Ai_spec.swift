import Foundation
class AiSpec {
    let unit_test = TestAssertions()
    let ttt_alg = MinMax()
    let diff = Unbeatable()
    let board_handler = ThreebyThree()
    func test_chooses_to_win_x() {
        let ai_handler = AiPlayer(player: "X")
        let first_board = ["X", "O", "O", "X", "O", "X", " ", "X", "O"]
        let second_board = ["X", "O", " ", "X", "O", "X", " ", " ", " "]
        let third_board = ["X", "O", "O", "X", " ", " ", " ", " ", " "]
        let best_move_1 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: first_board)
        let best_move_2 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: second_board)
        let best_move_3 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: third_board)
        unit_test.assertEquals(expected: 6, actual: best_move_1, message: " has to take pos 6")
        unit_test.assertEquals(expected: 6, actual: best_move_2, message: " favors win over draw")
        unit_test.assertEquals(expected: 6, actual: best_move_3, message: " still needs to take pos 6")
        }
    func test_chooses_fast_win_x() {
        let ai_handler = AiPlayer(player: "X")
        let board = ["X", "O", "O", " ", " ", "O", " ", "X", "X"]
        let best_move = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: board)
        unit_test.assertEquals(expected: 4, actual: best_move, message: " chooses the faster win 4 comes before 6")
    }
    func test_chooses_to_draw_when_no_win_x() {
        let ai_handler = AiPlayer(player: "X")
        let first_board = ["O", "X", "X", "O", " ", " ", " ", " ", " "]
        let second_board = ["X", "O", "X", "X", "O", "O", "O", " ", "X"]
        let third_board = [ "O", "X", "O", " ", " ", " ", " ", " ", " "]
        let best_move_1 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: first_board)
        let best_move_2 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: second_board)
        let best_move_3 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: third_board)
        unit_test.assertEquals(expected: 6, actual: best_move_1, message: " has to take pos 6 to block win")
        unit_test.assertEquals(expected: 7, actual: best_move_2, message: " plays for draw blocks O")
        unit_test.assertEquals(expected: 4, actual: best_move_3, message: " blocks middle to prevent O win")
    }
    func test_chooses_to_win_o() {
        let ai_handler = AiPlayer(player: "O")
        let first_board = ["O", "X", "X", "O", "X", "O", " ", "O", "X"]
        let second_board = ["O", "X", " ", "O", "X", "O", " ", " ", " "]
        let third_board = ["O", "X", "X", "O", " ", " ", " ", " ", " "]
        let best_move_1 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: first_board)
        let best_move_2 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: second_board)
        let best_move_3 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: third_board)
        unit_test.assertEquals(expected: 6, actual: best_move_1, message: " has to take pos 6")
        unit_test.assertEquals(expected: 6, actual: best_move_2, message: " favors win over draw")
        unit_test.assertEquals(expected: 6, actual: best_move_3, message: " still needs to take pos 6")
        }
    func test_chooses_fast_win_o() {
        let ai_handler = AiPlayer(player: "O")
        let board = ["O", "X", "X", " ", " ", "X", " ", "O", "O"]
        let best_move = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: board)
        unit_test.assertEquals(expected: 4, actual: best_move, message: " chooses the faster win 4 comes before 6")
    }
    func test_chooses_to_draw_when_no_win_o() {
        let ai_handler = AiPlayer(player: "O")
        let first_board = ["X", "O", "O", "X", " ", " ", " ", " ", " "]
        let second_board = ["O", "X", "O", "O", "X", "X", "X", " ", "O"]
        let third_board = [ "X", "O", "X", " ", " ", " ", " ", " ", " "]
        let best_move_1 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: first_board)
        let best_move_2 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: second_board)
        let best_move_3 = ai_handler.return_move(ttt_alg: ttt_alg, difficulty: diff, board: board_handler, current_board: third_board)
        unit_test.assertEquals(expected: 6, actual: best_move_1, message: " has to take pos 6 to block win")
        unit_test.assertEquals(expected: 7, actual: best_move_2, message: " plays for draw blocks O")
        unit_test.assertEquals(expected: 4, actual: best_move_3, message: " blocks middle to prevent O win")
    }
}
