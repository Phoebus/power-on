class_name Cart
extends Panel

signal on_item_removed(data : PartGeneralData)
signal on_item_added(data : PartGeneralData) # Signal that is called after a panel has been clicked and has been added

@onready var popup : PopupPanel = $PopupPanel
@onready var part_list : VBoxContainer = $PopupPanel/ScrollContainer/PartListContainer

var in_cart_part_row : PackedScene = load("res://shop_menu/scenes/in_cart_part_row.tscn")
var selected_parts : Array[PartGeneralData]

func _ready() -> void:
	Globals.part_panel_clicked.connect(add_part)

func add_part(part_data : PartGeneralData) -> void:
	if not selected_parts.has(part_data):
		selected_parts.append(part_data)
		var new_item : CartPartRow = in_cart_part_row.instantiate().with_data(part_data)
		part_list.add_child(new_item)
		new_item.on_item_removal.connect(on_item_removal)	

		on_item_added.emit(part_data)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			popup.show()

func on_item_removal(part_data : PartGeneralData) -> void:
	selected_parts.erase(part_data)
	on_item_removed.emit(part_data)
