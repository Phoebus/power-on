extends Node

enum PART_TYPE {CPU, GPU, RAM}

signal category_panel_clicked(type : PART_TYPE)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func emit_category_clicked_signal(type : PART_TYPE) -> void:
	category_panel_clicked.emit(type)
