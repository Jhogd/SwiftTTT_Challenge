import Foundation
class TerminalDisplay: IDisplayType {
    func display_board(board: Array<String>, size: Int) {
        let row_seperator = String(repeating: "-", count: board.count)
           for (index, cell) in board.enumerated() {
            print(cell, terminator: " ")
            if (index + 1) % size == 0 {
                print()
                if index < board.count - 1 {
                    print(row_seperator)
                }
            } else {
                print("|", terminator: " ")
            }
        }
    }
    func winning_message(winner: String) {
        if winner == "C" {
            print("The game has ended in a draw")
        }
        else {
            print("Player \(winner) has won the game!")
        }
    }
    func starting_message() {
        print("Welcome to Tic Tac Toe!\n")
    }
    func choose_player_message() {
        print("Please enter an X or O\n")
    }
    func human_turn_message() {
        print("Please enter a move 1-9\n")
    }
    func ai_turn_message() {
        print("The AI is choosing a move...\n")
    }
    static func invalid_move_message() {
        print("This move is INVALID please try again\n")
    }
    static func invalid_player_message() {
        print("This is not a player option... try again\n")
    }
}
