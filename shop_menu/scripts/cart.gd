class_name Cart
extends Panel

signal on_item_removed(data : PartGeneralData)
signal on_item_added(data : PartGeneralData) # Signal that is called after a panel has been clicked and has been added

@onready var popup : PopupPanel = $PopupPanel
@onready var part_list : VBoxContainer = $PopupPanel/MarginContainer/ScrollContainer/PartListContainer

var in_cart_part_row : PackedScene = preload("res://shop_menu/scenes/in_cart_part_row.tscn")

func _ready() -> void:
	Globals.part_panel_clicked.connect(add_part)
	popup.hide()

func add_part(part_data : PartGeneralData) -> void:
	if not OrderHandler.player_build.has(part_data):
		OrderHandler.add_part_to_arrays(part_data)
		
		var new_item : CartPartRow = in_cart_part_row.instantiate().with_data(part_data)
		part_list.add_child(new_item)
		new_item.item_removal.connect(on_item_removal)	
		on_item_added.emit(part_data.price)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			popup.show()

func on_item_removal(part_data : PartGeneralData) -> void:
	OrderHandler.remove_part_from_arrays(part_data)
	on_item_removed.emit(part_data.price)
