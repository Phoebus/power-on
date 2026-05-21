extends Node

enum PART_TYPE {CPU, GPU, RAM, NONE, PSU, STORAGE}
enum CPU_SPECIALIZATION {NONE, GAMING, OFFICE}
enum RAM_GENERATION {DDR4, DDR5}
enum PSU_CERTIFICATION {PLUS, BRONZE, SILVER, GOLD, PLATINUM, TITANIUM, RUBY}
enum REQUIREMENT_TYPE {VIDEO_EDITING, GAMES, EVERYDAY}
enum STORAGE_TYPE {HDD, SSD, BOTH}

signal category_panel_clicked(type : PART_TYPE)
signal part_panel_clicked(data : PartGeneralData)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func emit_category_clicked_signal(type : PART_TYPE) -> void:
	category_panel_clicked.emit(type)

func emit_part_panel_clicked_signal(data : PartGeneralData) -> void:
	part_panel_clicked.emit(data)