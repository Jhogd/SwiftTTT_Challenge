import Foundation
class MinMax: ITTTAlgorithm {
    func ai_move(board: IBoard, ai_player: String, current_board: Array<String>) -> Int {
        var bestScore = -Int.max
        var best_move = -1
        var new_board = current_board
        for (idx, move) in current_board.enumerated() {
            if move == " " {
                new_board[idx] = ai_player
                let score = min_max(board: board, current_board: new_board, depth: 1, is_maxing: false, ai_player: ai_player)
                new_board[idx] = " "
                if score > bestScore {
                    bestScore = score
                    best_move = idx
                }
            }
        }
        return best_move
    }
    func min_max(board: IBoard, current_board: Array<String>, depth: Int, is_maxing: Bool, ai_player: String) -> Int  {
        if UniversalBoard.game_is_over(board: board, current_board: current_board) {
            let winner =  UniversalBoard.maybe_return_winner(board: board, current_board: current_board)
            switch winner {
            case ai_player:
                return 10/depth
            case GameMaster.switch_player(player: ai_player):
                return -10/depth
            case "C":
                return 0
            default:
                return 0
            }
        }
        let new_depth = depth + 1
        if is_maxing {
            var bestScore = -Int.max
            var new_board = current_board
            for (idx, move) in current_board.enumerated() {
                if move == " " {
                    new_board = GameMaster.place_move(move: idx, board: new_board, player: ai_player)
                    let score = min_max(board: board, current_board: new_board, depth: new_depth, is_maxing: false, ai_player: ai_player)
                    new_board[idx] = " "
                    bestScore = max(bestScore, score)
                }
            }
            return bestScore
        }
        else {
            var bestScore = Int.max
            var new_board = current_board
            for (idx, move) in current_board.enumerated() {
                if move == " " {
                    new_board[idx] = GameMaster.switch_player(player: ai_player)
                    let score = min_max(board: board, current_board: new_board, depth: new_depth, is_maxing: true, ai_player: ai_player)
                    new_board[idx] = " "
                    bestScore = min(bestScore, score)
                }
            }
            return bestScore
        }
    }
}
