class_name CartPartRow
extends HBoxContainer

signal remove_item(data : PcPartResource)

var part_data : PcPartResource

@onready var data_label : Label = $Label

func with_data(data : PcPartResource) -> CartPartRow:
	part_data = data
	return self

func _ready() -> void:
	data_label.text = part_data.name
	pass

func _on_button_pressed() -> void:
	remove_item.emit(part_data)
	queue_free()
