extends RichTextLabel

@onready var cart_icon : CartIcon = $"../cart_panel"

var money : float = 0.0

func _ready() -> void:
   cart_icon.item_added.connect(on_item_added) 
   cart_icon.item_removed.connect(on_item_removed)

   text = "Sum : 0.0"

func on_item_added(data : PcPartResource) -> void:
    money += data.price
    text = "Sum : " + str(money)

func on_item_removed(data : PcPartResource) -> void:
    money -= data.price
    text = "Sum : " + str(money)