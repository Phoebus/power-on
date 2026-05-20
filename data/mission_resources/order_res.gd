class_name OrderBasic
extends Resource

@export var description : String

@export var budget : int
@export var cpu_cores : int
@export var cpu_integrated_graphs : bool
@export var gpu_vram : int
@export var ram_size : int
@export var storage_type : Globals.STORAGE_TYPE

@export var cpu_cores_fail_message : String
@export var gpu_vram_fail_message : String
@export var ram_size_fail_message : String
@export var storage_type_fail_message : String

# TODO Add more error messages for all the possible errors.