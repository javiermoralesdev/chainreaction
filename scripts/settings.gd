extends CanvasLayer

func _change_music(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)
	Global.update_music_vol(value)


func _on_back_button_pressed() -> void:
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.menu_scene)
	


func _on_back_button_mouse_entered() -> void:
	$HoverPlayer.play()


func _effects_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)
	Global.update_sound_vol(value)


func _switch_fs(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)
	Global.update_fullscreen(toggled_on)
