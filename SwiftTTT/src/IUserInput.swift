import Foundation
protocol IUserInput {
    func get_move(board: Array<String>) -> Int
    func get_player() -> String
}
