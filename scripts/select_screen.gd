extends CanvasLayer

func _ready() -> void:
	Global.player1.piece = randi_range(0, 3)
	Global.player2.piece = randi_range(0, 3)
	Global.player1.color = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	Global.player2.color = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	$P1Buttons/P1Color.color = Global.player1.color
	$P2Buttons/P2Color.color = Global.player2.color

func _process(_delta: float) -> void:
	$Player1.texture = Global.pieces[Global.player1.piece]
	$Player2.texture = Global.pieces[Global.player2.piece]
	$Player1.modulate = Global.player1.color
	$Player2.modulate = Global.player2.color

func _p1_color_changed(color: Color) -> void:
	Global.player1.color = color


func _on_p2_color_changed(color: Color) -> void:
	Global.player2.color = color
	


func _on_play_button_pressed() -> void:
	if Global.player1.color == Global.player2.color and Global.player1.piece == Global.player2.piece:
		$WarningScreen.appear("warn_select")
		return
	if $Player1Name.text == "":
		Global.player1.name = "Player1"
	if $Player2Name.text == "":
		Global.player2.name = "Player2"
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.game_scene)


func _on_player_1_name_text_changed(new_text: String) -> void:
	Global.player1.name = new_text


func _on_player_2_name_text_changed(new_text: String) -> void:
	Global.player2.name = new_text


func _on_hover() -> void:
	if OS.get_name() == "Android":
		return
	$HoverPlayer.play()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_back_button_pressed()

func _on_back_button_pressed() -> void:
	%ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.menu_scene)
