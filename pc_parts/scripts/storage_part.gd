class_name StoragePart
extends PartBase

@export var data : StorageSpecs

@onready var description : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Description
@onready var storage_type : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/StorageType
@onready var capacity : RichTextLabel = $PopupPanel/MarginContainer/VBoxContainer/Capacity

func _ready() -> void:
	card.card_init(data.image, data.name, data.price)
	popup_init()

func popup_init() -> void:
	description.text = data.description
	storage_type.text = "[indent]Storage Type : " + Globals.STORAGE_TYPE.keys()[data.storage_type] + "[/indent]"
	capacity.text = "[indent]Capacity : " + str(data.capacity) + "[/indent]"



func _on_button_pressed() -> void:
	Globals.emit_part_panel_clicked_signal(data)

