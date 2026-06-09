extends RichTextLabel

@onready var cart_icon : Cart = $"../cart_panel"

var money : float = 0.0

func _ready() -> void:
   cart_icon.on_item_added.connect(on_item_added) 
   cart_icon.on_item_removed.connect(on_item_removed)

   text = "Συνολο : \n0.0"

func on_item_added(part_data : PartGeneralData) -> void:
    money += part_data.price
    text = "Συνολο : \n" + str(money)

func on_item_removed(part_data : PartGeneralData) -> void:
    money -= part_data.price
    text = "Συνολο : \n" + str(money)