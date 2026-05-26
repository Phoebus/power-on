extends Control

@onready var cpu_cores : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/CpuCont/HBox1/CpuCoresExplanation
@onready var cpu_specialization : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/CpuCont/HBox2/CpuSpecializationExplanation
@onready var gpu_vram : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/GpuCont/HBox1/GpuVramExplanation
@onready var gpu_speed : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/GpuCont/HBox2/GpuSpeedExplanation
@onready var ram_size : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/RamCont/HBox1/RamSizeExplanation
@onready var ram_generation : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/RamCont/HBox2/RamGenerationExplanation
@onready var ram_speed : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer/RamCont/HBox3/RamSpeedExplanation
@onready var psu_supply : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer2/PsuCont/HBox1/PsuPowerSupplyExplanation
@onready var psu_certification : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer2/PsuCont/HBox2/PsuCertificationExplanation
@onready var stor_size : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer2/StorCont/HBox1/StorageSizeExplanation
@onready var stor_type : RichTextLabel = $PanCont/BaseVBox/BaseHBox/VBoxContainer2/StorCont/HBox2/StorageTypeExplanation

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
