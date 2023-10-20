import Foundation
protocol IDifficulty {
    func return_move(board: IBoard, ttt_alg: ITTTAlgorithm, ai_player: String, current_board: Array<String>) -> Int
}
