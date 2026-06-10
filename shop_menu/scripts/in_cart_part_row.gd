class_name CartPartRow
extends HBoxContainer

signal item_removal(data : PartGeneralData)

@onready var data_label : RichTextLabel = $ItemName

var part_data : PartGeneralData

func with_data(data : PartGeneralData) -> CartPartRow:
	part_data = data
	return self

func _ready() -> void:
	data_label.text = part_data.name
	pass

func _on_button_pressed() -> void:
	MusicManager.play_sfx(MusicManager.REMOVE_FROM_CART_SFX_PATH)
	item_removal.emit(part_data)
	queue_free()
