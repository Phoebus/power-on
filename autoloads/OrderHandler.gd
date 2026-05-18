extends Node

var current_order : OrderBasic
var player_build : Array[PartGeneralData]
var player_cpus : Array[CpuSpecs]
var player_gpus : Array[GpuSpecs]

const BUDGET_ERROR : String = "You have exceeded the given budget!"
const SINGLE_PART_ERROR : String = "You can only have 1 of each type of item!"

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

func strict_checks() -> Dictionary:
	if not check_single_items():
		return {"passed" : false, "error" : SINGLE_PART_ERROR}
	elif not check_budget():
		return {"passed" : false, "error" : BUDGET_ERROR}
	
	return {"passed" : true, "error" : ""}

func check_budget() -> bool:
	var sum : int = 0

	for item in player_build:
		sum += item.price 
	
	if sum > current_order.budget:
		return false
	else:
		return true

func check_single_items() -> bool:
	if player_cpus.size() > 1 or player_gpus.size() > 1:
		return false
	else:
		return true
