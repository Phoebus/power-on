class_name MissionButton
extends Button

@export var mission_order : OrderBasic

func _ready() -> void:
	pressed.connect(on_pressed)
	
	if mission_order == null:
		disabled = true
		return
	
	disabled = not Globals.check_mission_available(mission_order.id)
	#print("Button " + name + ", availability " + str(Globals.save_data.availability_list[mission_order.id]))

func on_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	Globals.emit_mission_button_clicked_signal(mission_order)
