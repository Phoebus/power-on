class_name GpuPart
extends PartBase

@export var data : GpuSpecs

@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var power : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PowerDraw

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func popup_init() -> void:
	power.text = "Power Draw : " + str(data.power_draw)
	description.text = data.description

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
