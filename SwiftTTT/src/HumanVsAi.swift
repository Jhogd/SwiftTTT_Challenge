import Foundation
class HumanVsAi {
    var current_board: Array<String>
    var human_player: Player
    var ai_player:    AiPlayer
    var display:      IDisplayType
    var game_board:   IBoard
    var user_input:   IUserInput
    var ttt_alg:      ITTTAlgorithm
    var difficulty:   IDifficulty
    var start_player: String
    init(current_board: Array<String>, human_player: Player, ai_player: AiPlayer, display: IDisplayType, game_board: IBoard, user_input: IUserInput, ttt_alg: ITTTAlgorithm, difficulty: IDifficulty, start_player: String){
        self.current_board = current_board
        self.human_player  = human_player
        self.ai_player     = ai_player
        self.display       = display
        self.game_board    = game_board
        self.user_input    = user_input
        self.ttt_alg       = ttt_alg
        self.difficulty    = difficulty
        self.start_player  = start_player
    }
    func rotate_turn(current_player: String, current_board: Array<String>) -> Int {
        var move = 0
        if is_human_turn(current_player: current_player, ai_player: ai_player.player) {
            move = human_player.return_move(user_input: user_input, board: current_board)
        }
        else {
            move = ai_player.return_move(ttt_alg: ttt_alg, difficulty: difficulty, board: game_board, current_board: current_board)
        }
        return move
    }
    func is_human_turn(current_player: String, ai_player: String) -> Bool {
        if current_player != ai_player {
            return true
        }
        else {
            return false
        }
    }
    func switch_player_turn_message(current_player: String, ai_player: String, display: IDisplayType) {
        if is_human_turn(current_player: current_player, ai_player: ai_player) {
            display.human_turn_message()
        }
        else {
            display.ai_turn_message()
        }
    }
    func play_game() {
        var current_player = start_player
        while true {
            display.display_board(board: current_board, size: game_board.size)
            if UniversalBoard.game_is_over(board: game_board, current_board: current_board) {
              let winner = UniversalBoard.maybe_return_winner(board: game_board, current_board: current_board)
                display.winning_message(winner: winner)
                break
            }
            switch_player_turn_message(current_player: current_player, ai_player: ai_player.player, display: display)
            let move = rotate_turn(current_player: current_player, current_board: current_board)
            current_board = GameMaster.place_move(move: move, board: current_board, player: current_player)
            current_player = GameMaster.switch_player(player: current_player)
        }
    }
}
