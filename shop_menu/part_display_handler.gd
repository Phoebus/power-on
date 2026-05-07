extends GridContainer

enum DISPLAY_MODES {CPU, GPU, RAM}
var display_mode : DISPLAY_MODES 

@onready var all_parts : Array[Node] = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_display_mode(DISPLAY_MODES.CPU)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func switch_display_mode(new_mode : DISPLAY_MODES) -> void:
	
	# Iterate through all the children of this node and make visible only the ones
	# that their type is the same as the display mode.
	
	for part in all_parts:
		if part is not PcPart:
			continue
		if part.data.type == new_mode:
			part.visible = true
		else :
			part.visible = false

	display_mode = new_mode	
			
			
		
