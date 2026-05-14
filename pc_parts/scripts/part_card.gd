extends Control

@onready var card_image : TextureRect = $CardContainer/VBoxContainer/Image
@onready var card_name : RichTextLabel = $CardContainer/VBoxContainer/Name
@onready var card_price_tag : RichTextLabel = $PriceTagContainer/Price

func card_init(image : CompressedTexture2D, part_name : String, price : int) -> void:
    card_image.texture = image
    card_name.text = part_name
    card_price_tag.text = str(price)