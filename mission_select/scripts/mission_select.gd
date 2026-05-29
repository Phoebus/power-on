extends Control

func _on_mission_button_pressed(source:BaseButton) -> void:
	if source is MissionButton:
		SceneSwitcher.to_order(source.mission_order)
