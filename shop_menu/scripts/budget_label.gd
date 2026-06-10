extends RichTextLabel

@onready var cart_icon : Cart = $"../cart_panel"
@onready var money_spent : RichTextLabel = $"../MoneySpent"
var budget : float

func _ready() -> void:
	budget = OrderHandler.current_order.budget
	text = "Διαθέσιμο Ποσό :\n" + str(budget)

	cart_icon.on_item_added.connect(update_budget)
	cart_icon.on_item_removed.connect(update_budget)

func update_budget(_data: PartGeneralData) -> void:
	text = "Διαθέσιμο Ποσό :\n" + str(budget - money_spent.money)

