extends RichTextLabel

func _ready() -> void:
    text = "Budget : \n" + str(OrderHandler.current_order.budget)
