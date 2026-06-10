extends Control

signal phone_picked_up()

const VIBRATE_AMOUNT : float = 2.0
const VIBRATE_DURATION : float = 0.07

@onready var phone_icon : Label = $PhoneIcon

var _vibrate_tween : Tween

func _ready() -> void:
	await get_tree().process_frame
	_start_vibration()

func _start_vibration() -> void:
	var base_x : float = phone_icon.position.x
	_vibrate_tween = create_tween().set_loops()
	_vibrate_tween.tween_property(phone_icon, "position:x", base_x + VIBRATE_AMOUNT, VIBRATE_DURATION).set_trans(Tween.TRANS_SINE)
	_vibrate_tween.tween_property(phone_icon, "position:x", base_x - VIBRATE_AMOUNT, VIBRATE_DURATION * 2.0).set_trans(Tween.TRANS_SINE)
	_vibrate_tween.tween_property(phone_icon, "position:x", base_x, VIBRATE_DURATION).set_trans(Tween.TRANS_SINE)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if _vibrate_tween:
			_vibrate_tween.kill()
		phone_picked_up.emit()
		queue_free()
