class_name PsuPart
extends PartBase

@export var data : PsuSpecs

@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var watt : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Watt
@onready var certification : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Certification

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func popup_init() -> void:
	description.text = data.description
	watt.text = "[indent]Power Supply : " + str(data.power_supply) + "[/indent]"
	certification.text = "[indent]Certification : " + Globals.PSU_CERTIFICATION.keys()[data.certification] + "[/indent]"

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
