extends PopupPanel

func _on_yes_btn_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	get_tree().quit()

func _on_no_btn_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	self.hide()
