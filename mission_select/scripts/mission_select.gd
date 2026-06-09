extends Control

func _ready() -> void:
	MusicManager.set_filter(true)
	Globals.mission_button_clicked.connect(on_mission_pressed)

func on_mission_pressed(order : OrderBasic) -> void:
	if Globals.check_mission_available(order.id):
		SceneSwitcher.to_order(order)
	else:
		print("Haven't unlocked!")
