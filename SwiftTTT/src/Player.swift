import Foundation
class Player {
    var player: String
    init(player: String) {
        self.player = player
    }
    func return_move(user_input: IUserInput, board: Array<String>) -> Int {
        let move = user_input.get_move(board: board)
        return move
    }
}
