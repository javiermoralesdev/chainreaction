extends Resource
class_name SaveGame

const SAVE_GAME_PATH = "user://save.tres"

@export var matches: Array[Round]

func save_game():
	ResourceSaver.save(self, SAVE_GAME_PATH)

static func load_game() -> SaveGame:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return new()
