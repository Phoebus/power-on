extends RichTextLabel

# var budget : float = OrderHandler.current_order.budget
var budget : float = 1000.0

func _ready() -> void:
    text = "Budget : \n" + str(budget)
