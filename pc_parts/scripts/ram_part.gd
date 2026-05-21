class_name RamPart
extends PartBase

@export var data : RamSpecs

@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var power : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/PowerDraw
@onready var capacity : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Capacity
@onready var speed_tier : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/SpeedTier
@onready var generation : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Generation

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func popup_init() -> void:
	power.text = "[indent]Power Draw : " + str(data.power_draw) + "[/indent]"
	capacity.text = "[indent]Capacity : " + str(data.capacity) + "[/indent]"
	speed_tier.text = "[indent]Speed Tier : " + str(data.speed) + "[/indent]"
	generation.text = "[indent]Power Draw : " + str(data.generation) + "[/indent]"
	description.text = data.description

func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)
