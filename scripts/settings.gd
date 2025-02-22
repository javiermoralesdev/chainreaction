extends CanvasLayer

func _ready() -> void:
	$VBoxContainer/MusicSlider.value = Global.settings_data.music_vol
	$VBoxContainer/SoundSlider.value = Global.settings_data.sounds_vol
	$VBoxContainer/FullscreenCheckBox.button_pressed = Global.settings_data.fullscreen
	if OS.get_name() == "Android" or OS.get_name() == "Web":
		$VBoxContainer/FullscreenCheckBox.queue_free()

func _change_music(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	Global.update_music_vol(value)
	

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_back_button_pressed()

func _on_back_button_pressed() -> void:
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.menu_scene)
	


func _on_back_button_mouse_entered() -> void:
	if OS.get_name() == "Android":
		return
	$HoverPlayer.play()


func _effects_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(2, db)
	Global.update_sound_vol(value)


func _switch_fs(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)
	Global.update_fullscreen(toggled_on)
