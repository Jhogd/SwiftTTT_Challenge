import Foundation
protocol ITTTAlgorithm {
    func ai_move(board: IBoard, ai_player: String, current_board: Array<String>) -> Int
}
