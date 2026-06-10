class_name PartBase
extends Control

@onready var popup : PopupPanel = $PopupPanel
@onready var card : Control = $PartCard

func _ready() -> void:
	gui_input.connect(_on_gui_input)
	popup.hide()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			MusicManager.play_sfx(MusicManager.CLICK_SFX_PATH)
			popup.show()

