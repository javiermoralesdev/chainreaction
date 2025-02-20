extends CanvasLayer


func _process(_delta: float) -> void:
	$Player1.texture = Global.pieces[Global.player1.piece]
	$Player2.texture = Global.pieces[Global.player2.piece]
	$Player1.modulate = Global.player1.color
	$Player2.modulate = Global.player1.color

func _p1_color_changed(color: Color) -> void:
	Global.player1.color = color


func _on_p2_color_changed(color: Color) -> void:
	Global.player1.color = color
	


func _on_play_button_pressed() -> void:
	if Global.player1.color == Global.player2.color and Global.player1.piece == Global.player2.piece:
		$WarningScreen.appear("warn_select")
		return
	if $Player1Name.text == "" or $Player2Name.text == "":
		$WarningScreen.appear("warn_name")
		return
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)
