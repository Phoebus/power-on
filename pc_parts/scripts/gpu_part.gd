class_name GpuPart
extends Control

@export var data : GpuSpecs

@onready var card : Control = $PartCard
@onready var popup : PopupPanel = $PopupPanel
@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var power : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PowerDraw

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func _on_gui_input(event: InputEvent) -> void:	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			popup.show()

func popup_init() -> void:
	power.text = "Power Draw : " + str(data.power_draw)
	description.text = data.description

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
