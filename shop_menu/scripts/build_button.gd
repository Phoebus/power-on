extends Button

@onready var popup : PopupPanel = $PopupPanel
@onready var error_label : RichTextLabel = $PopupPanel/MarginContainer/ErrorMessage

var results_screen : PackedScene = preload("res://results_screen/scenes/results.tscn")

func _ready() -> void:
	popup.hide()

func _on_pressed() -> void:
	var check_result : Dictionary = OrderHandler.strict_checks()

	if check_result["passed"]:
		call_deferred("switch_scene_deferred", results_screen)
	else:
		popup.show()
		error_label.text = check_result["error"]

func switch_scene_deferred(new_scene : PackedScene) -> void:
	get_tree().change_scene_to_packed(new_scene)

