extends PopupPanel

func _on_yes_btn_pressed() -> void:
	get_tree().quit()

func _on_no_btn_pressed() -> void:
	self.hide()
