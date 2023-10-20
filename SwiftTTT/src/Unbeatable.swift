import Foundation
class Unbeatable: IDifficulty {
    func return_move(board: IBoard, ttt_alg: ITTTAlgorithm, ai_player: String, current_board: Array<String>) -> Int {
        return ttt_alg.ai_move(board: board, ai_player: ai_player, current_board: current_board)
    }
}
