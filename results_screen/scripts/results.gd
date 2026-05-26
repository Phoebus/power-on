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
	OrderHandler.perform_checks()
	assign_msg()
	
func assign_msg() -> void:
	cpu_cores.text = OrderHandler.cpu_cores_msg
	cpu_specialization.text = OrderHandler.cpu_specialization_msg
	gpu_vram.text = OrderHandler.gpu_vram_msg
	gpu_speed.text = OrderHandler.gpu_speed_msg
	ram_generation.text = OrderHandler.ram_generation_msg
	ram_size.text = OrderHandler.ram_capacity_msg
	ram_speed.text = OrderHandler.ram_speed_msg
	psu_supply.text = OrderHandler.psu_power_supply_msg
	psu_certification.text = OrderHandler.psu_certification_msg
	stor_size.text = OrderHandler.storage_capacity_msg
	stor_type.text = OrderHandler.storage_type_msg
