class_name Customer
extends TextureRect

signal take_order()

@export var order : OrderBasic

@onready var scale_on_hover : Node = $ScaleOnHoverAnimator
@onready var take_order_label : RichTextLabel = $TakeOrderLabel

var has_ordered : bool = false

func _ready() -> void:
	#enter_store_anim()
	take_order_label.ready_to_order = true
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and not has_ordered:
			take_order.emit()
			scale_on_hover.delete_self()
			take_order_label.delete_self()
			has_ordered = true

func enter_store_anim() -> void:
	var tween_h : Tween = get_tree().create_tween()
	tween_h.tween_property(self, "position", position - Vector2(300.0, 0.0), 1)