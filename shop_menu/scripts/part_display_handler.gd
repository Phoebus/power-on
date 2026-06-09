extends GridContainer

@onready var all_parts : Array[Node] = get_children()

var display_mode : Globals.PART_TYPE = Globals.PART_TYPE.NONE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.set_filter(false)
	switch_display_mode(Globals.PART_TYPE.CPU)

	# Connect signals.
	Globals.category_panel_clicked.connect(switch_display_mode)

func switch_display_mode(new_mode : Globals.PART_TYPE) -> void:
	
	# Iterate through all the children of this node and make visible only the ones
	# that their type is the same as the display mode.
	
	if display_mode == new_mode:
		return

	for part in all_parts:
		if part.data.type == new_mode:
			part.visible = true
		else :
			part.visible = false

	display_mode = new_mode		
			
		
