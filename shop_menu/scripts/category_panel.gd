extends Panel

# Category name will be used to identify which pc parts to fetch and display and clicked.
@export var category_name : String
@export var category_image : Texture2D
@export var category_type : Globals.PART_TYPE

@onready var texture_rect : TextureRect = $CategoryImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = category_image

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:	
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			# Different category panels may be clicked but they all emit the same signal
			# with a different parameter, the type.
			Globals.emit_category_clicked_signal(category_type) 
