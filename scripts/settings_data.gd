extends Resource
class_name SettingsData

const SAVE_SETTINGS_PATH = "user://settings.tres"

@export var music_vol: float = 1
@export var sounds_vol: float = 1
@export var fullscreen: bool = false

func save():
	ResourceSaver.save(self, SAVE_SETTINGS_PATH)

static func load() -> SettingsData:
	if ResourceLoader.exists(SAVE_SETTINGS_PATH):
		return load(SAVE_SETTINGS_PATH)
	var data = SettingsData.new()
	return data
	
