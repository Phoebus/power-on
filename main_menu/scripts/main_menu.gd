extends Control

func _ready() -> void:
	MusicManager.set_filter(true)

func _on_play_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	SceneSwitcher.to_mission_select()

func _on_quit_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	get_tree().quit()
