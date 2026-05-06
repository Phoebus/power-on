extends Panel

# Category name will be used to identify which pc parts to fetch and display and clicked.
@export var category_name : String
@export var category_image : Texture2D

@onready var texture_rect : TextureRect = $category_image

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = category_image


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass