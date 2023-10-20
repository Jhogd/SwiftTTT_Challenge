import Foundation
protocol IDisplayType {
    func display_board(board: Array<String>, size: Int)
    func winning_message(winner: String)
    func starting_message()
    func human_turn_message()
    func ai_turn_message()
    func choose_player_message()
    static func invalid_move_message()
}
