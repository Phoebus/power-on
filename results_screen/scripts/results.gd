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

func _ready() -> void:

	var results : Dictionary[OrderHandler.RESULT_TYPE, String] = OrderHandler.perform_checks()
	assign_msg(results)
	
func assign_msg(results : Dictionary[OrderHandler.RESULT_TYPE, String]) -> void:
	cpu_cores.text = results[OrderHandler.RESULT_TYPE.CPU_CORES]
	cpu_specialization.text = results[OrderHandler.RESULT_TYPE.CPU_SPECIAL]
	gpu_vram.text = results[OrderHandler.RESULT_TYPE.GPU_VRAM]
	gpu_speed.text = results[OrderHandler.RESULT_TYPE.GPU_SPEED]
	ram_generation.text = results[OrderHandler.RESULT_TYPE.RAM_GEN]
	ram_size.text = results[OrderHandler.RESULT_TYPE.RAM_SIZE]
	ram_speed.text = results[OrderHandler.RESULT_TYPE.RAM_SPEED]
	psu_supply.text = results[OrderHandler.RESULT_TYPE.PSU_SUPP]
	psu_certification.text = results[OrderHandler.RESULT_TYPE.PSU_SUPP]
	stor_size.text = results[OrderHandler.RESULT_TYPE.STOR_SIZE]
	stor_type.text = results[OrderHandler.RESULT_TYPE.STOR_TYPE]
