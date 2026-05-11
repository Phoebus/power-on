extends Panel

# Idk if this is correct but i am storing this here for now
var part_list_part_min_x : float = 700.0
var part_list_part_min_y : float = 70.0
var in_cart_part_row : PackedScene = load("res://shop_menu/in_cart_part_row.tscn")

var selected_parts : Array[PcPartResource]

@onready var popup : PopupPanel = $PopupPanel
@onready var part_list : VBoxContainer = $PopupPanel/ScrollContainer/PartListContainer

func _ready() -> void:
	Globals.part_panel_clicked.connect(add_part)

func add_part(part_data : PcPartResource) -> void:
	if not selected_parts.has(part_data):
		selected_parts.append(part_data)
		var new_item_row : CartPartRow = in_cart_part_row.instantiate().with_data(part_data)
		part_list.add_child(new_item_row)
		new_item_row.custom_minimum_size = Vector2(part_list_part_min_x, part_list_part_min_y)
		new_item_row.remove_item.connect(_on_item_removal)	

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			popup.show()

func _on_item_removal(part_data : PcPartResource) -> void:
	selected_parts.erase(part_data)