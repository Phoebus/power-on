extends Button

@onready var reminder_label : RichTextLabel = $PopupPanel/MarginContainer/OrderReminder
@onready var popup : PopupPanel = $PopupPanel

func _ready() -> void:
    popup.hide()
    reminder_label.text = OrderHandler.current_order.reminder_description

func _on_pressed() -> void:
    popup.show()
