import Foundation
func main() {
    let difficulty = Unbeatable()
    let board_handler = ThreebyThree()
    let display = TerminalDisplay()
    let input_handler = TerminalInput()
    let human_player = input_handler.get_player()
    let human_controller = Player(player: human_player)
    let ai_player = GameMaster.switch_player(player: human_player)
    let ai_controller = AiPlayer(player: ai_player)
    let ttt_alg = MinMax()
    let game_mode = HumanVsAi(current_board: board_handler.board, human_player: human_controller, ai_player: ai_controller, display: display, game_board: board_handler, user_input: input_handler, ttt_alg: ttt_alg, difficulty: difficulty, start_player: "X")
    display.starting_message()
    display.choose_player_message()
    game_mode.play_game()
}
main()
