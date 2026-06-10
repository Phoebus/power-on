extends Button

func _on_pressed() -> void:
	MusicManager.play_sfx(MusicManager.BACK_BUTTON_SFX_PATH)
	SceneSwitcher.to_mission_select()
