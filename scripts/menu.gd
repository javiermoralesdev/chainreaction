extends CanvasLayer

func _on_play_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.select_scene)


func _on_quit_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.settings_scene)


func _on_hover() -> void:
	pass
