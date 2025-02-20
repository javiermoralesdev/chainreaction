extends CanvasLayer

func _on_hover():
	$HoverPlayer.play()

func _go_back():
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(Global.menu_scene)
