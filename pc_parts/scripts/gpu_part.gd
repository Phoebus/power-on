class_name GpuPart
extends Control

@export var data : GpuSpecs

@onready var card : Control = $PartCard

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)

func _on_gui_input(event: InputEvent) -> void:	
	print("sdgdgdfgd")

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			Globals.emit_part_panel_clicked_signal(data)
