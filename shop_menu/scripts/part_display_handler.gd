extends GridContainer

var display_mode : Globals.PART_TYPE

@onready var all_parts : Array[Node] = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_display_mode(Globals.PART_TYPE.CPU)

	# Connect signals.
	Globals.category_panel_clicked.connect(on_category_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func switch_display_mode(new_mode : Globals.PART_TYPE) -> void:
	
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

func on_category_changed(new_type : Globals.PART_TYPE) -> void:
	switch_display_mode(new_type)	
			
		
