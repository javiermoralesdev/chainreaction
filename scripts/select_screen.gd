extends CanvasLayer


func _process(_delta: float) -> void:
	$Player1.texture = Global.pieces[Global.player1_piece]
	$Player2.texture = Global.pieces[Global.player2_piece]
	$Player1.modulate = Global.player1_color
	$Player2.modulate = Global.player2_color

func _p1_color_changed(color: Color) -> void:
	Global.player1_color = color


func _on_p2_color_changed(color: Color) -> void:
	Global.player2_color = color
	


func _on_play_button_pressed() -> void:
	if Global.player1_color == Global.player2_color and Global.player1_piece == Global.player2_piece:
		$WarningScreen.appear()
		return
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)
