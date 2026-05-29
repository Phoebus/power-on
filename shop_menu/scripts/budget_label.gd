extends RichTextLabel

func _ready() -> void:
	text = "Διαθεσιμο Ποσο : \n" + str(OrderHandler.current_order.budget)
