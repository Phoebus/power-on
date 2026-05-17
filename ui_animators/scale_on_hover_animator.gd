extends Node

@export var target : Control

# Animation Data
var property : String = "scale"
var from : Vector2
@export var to : Vector2
@export var duration : float
var order_index : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	from = target.scale
	order_index = target.z_index

	target.mouse_entered.connect(on_parent_mouse_entered)
	target.mouse_exited.connect(on_parent_mouse_exited)

func on_parent_mouse_entered() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(target, property, to, duration).set_trans(Tween.TRANS_SINE)
	target.z_index += 1
	pass

func on_parent_mouse_exited() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(target, property, from, duration).set_trans(Tween.TRANS_SINE)
	target.z_index = order_index
	pass

func delete_self() -> void:
	on_parent_mouse_exited()
	queue_free()
