import Foundation
class AiPlayer: Player{
   func return_move(ttt_alg: ITTTAlgorithm, difficulty: IDifficulty, board: IBoard, current_board: Array<String>) -> Int {
        let move = difficulty.return_move(board: board, ttt_alg: ttt_alg, ai_player: self.player, current_board: current_board)
        return move
    }
}
