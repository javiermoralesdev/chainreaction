extends CanvasLayer



func _on_retry_button_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.game_scene)
