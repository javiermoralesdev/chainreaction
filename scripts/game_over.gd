extends CanvasLayer

func _on_retry_button_pressed() -> void:
	%ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.game_scene)

func appear():
	$GameOverScreen/GameOverText.text = tr("menu_win").format({"player": Global.player1.name if (get_parent() as Game).player1_won else Global.player2.name})
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($GameOverScreen, "position", Vector2(0, 0), 1)

func _on_main_menu_button_pressed() -> void:
	%ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.menu_scene)
