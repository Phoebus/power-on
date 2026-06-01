extends Control

func _ready() -> void:
	pass

func _on_play_pressed() -> void:
	SceneSwitcher.to_mission_select()

func _on_quit_pressed() -> void:
	get_tree().quit()
