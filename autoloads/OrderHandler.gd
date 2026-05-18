extends Node

var current_order : OrderBasic
var player_build : Array[PartGeneralData]
var player_cpus : Array[CpuSpecs]
var player_gpus : Array[GpuSpecs]

func add_part_to_arrays(part_data : PartGeneralData) -> void:
	player_build.append(part_data)

	if part_data is CpuSpecs:
		player_cpus.append(part_data)
	elif part_data is GpuSpecs:
		player_gpus.append(part_data)

func remove_part_from_arrays(part_data : PartGeneralData) -> void:
	player_build.erase(part_data)

	if part_data is CpuSpecs:
		player_cpus.erase(part_data)
	elif part_data is GpuSpecs:
		player_gpus.erase(part_data)