extends RichTextLabel

@onready var timer : Timer = $Timer

var ready_to_order : bool = false

func _ready() -> void:
	visible = false

func _on_timer_timeout() -> void:
	if ready_to_order:
		visible = not visible

func delete_self() -> void:
	timer.timeout.disconnect(_on_timer_timeout)
	queue_free()
