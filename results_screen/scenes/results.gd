extends Control

@onready var cpu_cores_msg : RichTextLabel = $PanelContainer/MarginContainer/VBoxContainer/CpuContainer/HBoxContainer/CpuCoresExplanation
@onready var gpu_vram_msg : RichTextLabel = $PanelContainer/MarginContainer/VBoxContainer/GpuContainer/HBoxContainer/GpuVramExplanation
@onready var ram_size_msg : RichTextLabel = $PanelContainer/MarginContainer/VBoxContainer/RamContainer/HBoxContainer/RamSizeExplanation

func _ready() -> void:
    OrderHandler.perform_checks()
    cpu_cores_msg.text = OrderHandler.cpu_cores_msg
    gpu_vram_msg.text = OrderHandler.gpu_vram_msg
    ram_size_msg.text = OrderHandler.ram_size_msg