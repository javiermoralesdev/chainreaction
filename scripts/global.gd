extends Node

@onready var pieces = [
	preload("res://sprites/suit_clubs.png"),
	preload("res://sprites/suit_diamonds.png"),
	preload("res://sprites/suit_hearts.png"),
	preload("res://sprites/suit_spades.png")
]

@onready var game_scene = "res://scenes/game.tscn"
@onready var select_scene = "res://scenes/select.tscn"
@onready var menu_scene = "res://scenes/menu.tscn"
@onready var settings_scene = "res://scenes/settings.tscn"
@onready var credits_scene = "res://scenes/credits.tscn"
@onready var records_scene = "res://scenes/records.tscn"

var player1 = Player.new()
var player2 = Player.new()

var records: SaveGame
var settings_data: SettingsData

func _ready():
	DisplayServer.window_set_title(tr("title"))
	records = SaveGame.load_game()
	settings_data = SettingsData.load()
	AudioServer.set_bus_volume_db(1, linear_to_db(settings_data.music_vol))
	AudioServer.set_bus_volume_db(2, linear_to_db(settings_data.sounds_vol))
	DisplayServer.window_set_mode(
		DisplayServer.WINDOW_MODE_FULLSCREEN if 
		settings_data.fullscreen else 
		DisplayServer.WINDOW_MODE_WINDOWED
	)

func update_sound_vol(vol: float):
	settings_data.sounds_vol = vol
	settings_data.save()

func update_music_vol(vol: float):
	settings_data.music_vol = vol
	settings_data.save()

func update_fullscreen(fs: bool):
	settings_data.fullscreen = fs
	settings_data.save()

func update_records(r: Round):
	records.matches.append(r)
	records.save_game()
