extends PanelContainer

@export var part_image : CompressedTexture2D
@export var part_name : String
@export var part_description : String
@export var part_price : String
@export var part_key_specs : String

@onready var card_image : TextureRect = $Panel/VBoxContainer/Image
@onready var card_name : Label = $Panel/VBoxContainer/Name
@onready var card_description : RichTextLabel = $Panel/VBoxContainer/Description
@onready var card_price : Label = $Panel/VBoxContainer/Price
@onready var card_key_specs : RichTextLabel = $Panel/VBoxContainer/KeySpecs

var order_index : int = self.z_index

# Animation Data
var property : String = "scale"
var from : Vector2 = self.scale
var to : Vector2 = self.scale + Vector2(0.1, 0.1)
var duration : float = 0.15

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

func _on_mouse_entered() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, property, to, duration).set_trans(Tween.TRANS_SINE)
	self.z_index += 1
	pass

func _on_mouse_exited() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, property, from, duration).set_trans(Tween.TRANS_SINE)
	self.z_index = order_index
	pass
		