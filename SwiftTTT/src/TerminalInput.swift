import Foundation
class TerminalInput: IUserInput{
    func parse_move_input(input_string: String, board: Array<String>) -> Int {
        var input_number = 0
        let trimmed_string = input_string.trimmingCharacters(in: .whitespacesAndNewlines)
        if var number = Int(trimmed_string) {
            number = number - 1
            if GameMaster.valid_move(board: board, move: number) {
                input_number = number
            }
            else {
                TerminalDisplay.invalid_move_message()
                input_number =  get_move(board: board)
            }
        }
        else {
           TerminalDisplay.invalid_move_message()
           input_number =  get_move(board: board)
        }
        return input_number
    }
    func get_move(board: Array<String>) -> Int {
        var parsed_input = 0
        if let move_input = readLine() {
            let trimmed_input = move_input.trimmingCharacters(in: .whitespacesAndNewlines)
            parsed_input = parse_move_input(input_string: trimmed_input, board: board)
            return parsed_input
        }
        return parsed_input
    }
    func get_player() -> String {
        var player_choice = ""
        if let user_input = readLine() {
            let upper_cased = user_input.uppercased()
            let trimmed_input = upper_cased.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed_input == "X" || trimmed_input == "O" {
                player_choice = trimmed_input
            }
            else {
                TerminalDisplay.invalid_player_message()
                player_choice = get_player()
            }
        }
        return player_choice
    }
}
