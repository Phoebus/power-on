extends Control

@onready var cpu_cores : RichTextLabel = %CpuCoresExplanation
@onready var cpu_specialization : RichTextLabel = %CpuSpecializationExplanation
@onready var gpu_vram : RichTextLabel = %GpuVramExplanation
@onready var gpu_speed : RichTextLabel = %GpuSpeedExplanation
@onready var ram_size : RichTextLabel = %RamSizeExplanation
@onready var ram_generation : RichTextLabel = %RamGenerationExplanation
@onready var ram_speed : RichTextLabel = %RamSpeedExplanation
@onready var psu_supply : RichTextLabel = %PsuPowerSupplyExplanation
@onready var psu_certification : RichTextLabel = %PsuCertificationExplanation
@onready var stor_size : RichTextLabel = %StorageSizeExplanation
@onready var stor_type : RichTextLabel = %StorageTypeExplanation

@onready var retry_btn : Button = $RetryButton
@onready var continue_btn : Button = $ContinueButton

func _ready() -> void:

	var results : OrderResults = OrderHandler.perform_checks()
	assign_msg(results)

	retry_btn.disabled = results.score_passed
	
	if results.score_passed:
		Globals.save_data["Level" + str(OrderHandler.current_order.unlocks.id)] = true
		Globals.save_game()
	
func assign_msg(results : OrderResults) -> void:
	cpu_cores.text = results.cpu_cores_msg
	cpu_specialization.text = results.cpu_specialization_msg
	gpu_vram.text = results.gpu_vram_msg
	gpu_speed.text = results.gpu_speed_msg
	ram_generation.text = results.ram_generation_msg
	ram_size.text = results.ram_size_msg
	ram_speed.text = results.ram_speed_msg
	psu_supply.text = results.psu_power_supply_msg
	psu_certification.text = results.psu_certification_msg
	stor_size.text = results.storage_size_msg
	stor_type.text = results.storage_type_msg

func _on_retry_button_pressed() -> void:
	SceneSwitcher.retry_mission()

func _on_continue_button_pressed() -> void:
	#SceneSwitcher.to_mission_select()
	get_tree().quit()
