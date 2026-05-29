extends PanelContainer

@export var scale_duration : float = 0.15

@onready var customer : Customer = $"../Customer"
@onready var order_description = $MarginContainer/VBoxContainer/OrderDescription
@onready var order_budget = $MarginContainer/VBoxContainer/OrderBudget
@onready var start_order_button = $MarginContainer/VBoxContainer/StartOrder

var order_data : OrderBasic

func _ready() -> void:
	visible = false
	scale = Vector2(0.0, 0.0)

	customer.take_order.connect(appear)
	order_data = customer.order
	order_description.text = order_data.description
	order_budget.text = "Διαθεσιμο Ποσο : " + str(order_data.budget)

func appear() -> void:
	visible = true
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), scale_duration).set_trans(Tween.TRANS_SINE)

func _on_start_order_pressed() -> void:
	SceneSwitcher.to_shop(order_data)
