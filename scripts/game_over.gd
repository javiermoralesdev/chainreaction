extends CanvasLayer

func _on_retry_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)

func appear():
	$GameOverScreen/GameOverText.text = tr("menu_win").format({"player": "1" if (get_parent() as Game).player1_won else "2"})
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($GameOverScreen, "position", Vector2(0, 0), 1)


func _on_main_menu_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.menu_scene)
