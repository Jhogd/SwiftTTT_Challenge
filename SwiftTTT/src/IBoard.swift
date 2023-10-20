import Foundation
protocol IBoard {
    var board: Array<String> {get set}
    var size: Int {get}
    func check_win(board: Array<String>, player: String) -> Bool
}
