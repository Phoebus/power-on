extends Button

@onready var popup : PopupPanel = $PopupPanel
@onready var error_label : RichTextLabel = $PopupPanel/MarginContainer/ErrorMessage

func _ready() -> void:
	popup.hide()

func _on_pressed() -> void:
	var check_result : Dictionary = OrderHandler.strict_checks()

	if check_result["passed"]:
		pass
		# Go to next screen?
	else:
		popup.show()
		error_label.text = check_result["error"]

