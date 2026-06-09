class_name GpuPart
extends PartBase

@export var data : GpuSpecs

@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var power : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PowerDraw
@onready var vram : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Vram
@onready var perf_tier : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PerformanceTier

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func popup_init() -> void:
	power.text = "[indent]Power Draw : " + str(data.power_draw) + "[/indent]"
	vram.text = "[indent]Vram : " + str(data.vram) + "[/indent]"
	perf_tier.text = "[indent]Performance Tier : " + str(data.gpu_speed) + "[/indent]"
	description.text = data.description

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
