extends PanelContainer
class_name PcPart

@export var data : PcPartResource

@onready var card_image : TextureRect = $Panel/VBoxContainer/Image
@onready var card_name : Label = $Panel/VBoxContainer/Name
# @onready var card_description : RichTextLabel = $Panel/VBoxContainer/Description
#@onready var card_price : Label = $Panel/VBoxContainer/Price
@onready var card_key_specs : RichTextLabel = $Panel/VBoxContainer/KeySpecs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func card_init() -> void:
	card_image.texture = data.image
	card_name.text = data.name
	# card_description.text = data.description
	#card_price.text = str(data.price)
	
