extends PanelContainer

@export var scale_duration : float = 0.15

@onready var order_description : RichTextLabel = $MarginContainer/VBoxContainer/OrderDescription
@onready var order_budget : RichTextLabel = $MarginContainer/VBoxContainer/OrderBudget

func _ready() -> void:
	MusicManager.set_filter(true)
	visible = false
	scale = Vector2.ZERO

	order_description.text = OrderHandler.current_order.description
	order_budget.text = "Διαθεσιμο Ποσο : " + str(OrderHandler.current_order.budget)

func appear() -> void:
	visible = true
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, scale_duration).set_trans(Tween.TRANS_SINE)

func _on_start_order_pressed() -> void:
	MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
	MusicManager.resume_music()
	MusicManager.set_filter(false)
	SceneSwitcher.to_shop(OrderHandler.current_order)
