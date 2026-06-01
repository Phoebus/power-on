extends Node

enum PART_TYPE {CPU, GPU, RAM, NONE, PSU, STORAGE}
enum CPU_SPECIALIZATION {NONE, GAMING, OFFICE, ALL}
enum RAM_GENERATION {DDR4, DDR5}
enum PSU_CERTIFICATION {PLUS, BRONZE, SILVER, GOLD, PLATINUM, TITANIUM, RUBY}
enum STORAGE_TYPE {HDD, SSD, SSD_NVME}

signal category_panel_clicked(type : PART_TYPE)
signal part_panel_clicked(data : PartGeneralData)
signal mission_button_clicked(order : OrderBasic)

const SAVE_PATH : String = "user://save_data.save"
var save_data : Dictionary[String, bool] = {"Level1" : true, "Level2" : false, "Level3" : false, "Level4" : false, "Level5" : false}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Save before load " + str(save_data))
	load_game()
	print("Save after load " + str(save_data))

func save_game() -> void:
	var save_file : FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var json : String = JSON.stringify(save_data)
	save_file.store_line(json)

func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return # Error! We don't have a save to load.

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file : FileAccess = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data

	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		data = json.data
	
	for item in save_data:
		save_data[item] = data[item]

func emit_category_clicked_signal(type : PART_TYPE) -> void:
	category_panel_clicked.emit(type)

func emit_part_panel_clicked_signal(data : PartGeneralData) -> void:
	part_panel_clicked.emit(data)

func emit_mission_button_clicked_signal(order : OrderBasic) -> void:
	mission_button_clicked.emit(order)

func check_mission_available(id : String) -> bool:
	return save_data[id]
