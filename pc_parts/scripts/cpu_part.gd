class_name CpuPart
extends PartBase

@export var data : CpuSpecs

@onready var power : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PowerDraw
@onready var integraphics : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/IntegratedGraphics
@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()
	
func popup_init() -> void:
	power.text = "Power Draw : " + str(data.power_draw)
	integraphics.text = "Integrated Graphics : " + str(data.has_integrated_graphics)
	description.text = data.description

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
