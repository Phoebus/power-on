extends GridContainer

enum DISPLAY_MODES {CPU, GPU, RAM}
var display_mode : DISPLAY_MODES 

@onready var all_parts : Array[Node] = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_display_mode(DISPLAY_MODES.GPU)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func switch_display_mode(new_mode : DISPLAY_MODES) -> void:
	for part in all_parts:
		if part is not PcPart:
			continue
		if part.part_id == new_mode:
			part.visible = true
		else :
			part.visible = false

	display_mode = new_mode	
			
			
		
