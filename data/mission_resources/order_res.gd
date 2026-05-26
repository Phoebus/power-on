class_name OrderBasic
extends Resource

@export var description : String
@export var budget : int

@export_subgroup("CPU")
@export var cpu_cores : int
@export var cpu_integrated_graphs : bool
@export var cpu_specialization : Globals.CPU_SPECIALIZATION

@export_subgroup("GPU")
@export var gpu_vram : int
@export_range(1,5) var gpu_performance_tier : int # 1-5

@export_subgroup("RAM")
@export var ram_capacity : int
@export var ram_generation : Globals.RAM_GENERATION
@export_range(1,5) var ram_speed : int

@export_subgroup("STORAGE")
@export var storage_capacity : int 
@export var storage_type : Globals.STORAGE_TYPE

@export_subgroup("PSU")
@export var psu_watt : int
@export var psu_certification : Globals.PSU_CERTIFICATION

@export_category("ERROR MESSAGES")
@export_subgroup("CPU ERRORS")
@export var cpu_cores_fail_msg : String
@export var cpu_specialization_fail_msg : String
@export_subgroup("GPU ERRORS")
@export var gpu_vram_fail_msg : String
@export var gpu_performance_tier_fail_msg : String
@export_subgroup("RAM ERRORS")
@export var ram_capacity_fail_msg : String
@export var ram_generation_fail_msg : String
@export var ram_speed_fail_msg : String
@export_subgroup("STORAGE ERRORS")
@export var storage_type_fail_msg : String
@export var storage_capacity_fail_msg : String
@export_subgroup("PSU ERRORS")
@export var psu_power_supply_fail_msg : String
@export var psu_certification_fail_msg : String