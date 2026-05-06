extends PanelContainer
class_name PcPart

@export var part_image : CompressedTexture2D
@export var part_name : String
@export var part_description : String
@export var part_price : String
@export var part_key_specs : String
@export var part_id : Globals.PART_TYPE

@onready var card_image : TextureRect = $Panel/VBoxContainer/Image
@onready var card_name : Label = $Panel/VBoxContainer/Name
@onready var card_description : RichTextLabel = $Panel/VBoxContainer/Description
@onready var card_price : Label = $Panel/VBoxContainer/Price
@onready var card_key_specs : RichTextLabel = $Panel/VBoxContainer/KeySpecs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func card_init() -> void:
	card_image.texture = part_image
	card_name.text = part_name
	card_description.text = part_description
	card_price.text = part_price
	card_key_specs.text = part_key_specs
		