extends Node

var current_order : OrderBasic
var player_build : Array[PartGeneralData]
var player_cpu : Array[CpuSpecs]
var player_gpu : Array[GpuSpecs]
var player_ram : Array[RamSpecs]
var player_psu : Array[PsuSpecs]
var player_storage : Array[StorageSpecs]

var cpu_cores_msg : String = ""
var gpu_vram_msg : String = ""
var ram_size_msg : String = ""

const BUDGET_ERROR : String = "You have exceeded the given budget!"
const SINGLE_PART_ERROR : String = "You can only have 1 of each type of item!"
const NOT_ALL_PARTS_SELECTED : String = "You haven't selected 1 of each type of item!"

func add_part_to_arrays(part_data : PartGeneralData) -> void:
	player_build.append(part_data)

	if part_data is CpuSpecs:
		player_cpu.append(part_data)
	elif part_data is GpuSpecs:
		player_gpu.append(part_data)
	elif part_data is RamSpecs:
		player_ram.append(part_data)
	elif part_data is PsuSpecs:
		player_psu.append(part_data)
	elif part_data is StorageSpecs:
		player_storage.append(part_data)

func remove_part_from_arrays(part_data : PartGeneralData) -> void:
	player_build.erase(part_data)

	if part_data is CpuSpecs:
		player_cpu.erase(part_data)
	elif part_data is GpuSpecs:
		player_gpu.erase(part_data)
	elif part_data is RamSpecs:
		player_ram.erase(part_data)
	elif part_data is PsuSpecs:
		player_psu.erase(part_data)
	elif part_data is StorageSpecs:
		player_storage.erase(part_data)

func strict_checks() -> Dictionary:
	if not check_single_items():
		return {"passed" : false, "error" : SINGLE_PART_ERROR}
	elif not check_budget():
		return {"passed" : false, "error" : BUDGET_ERROR}
	elif not check_at_least_one():
		return {"passed" : false, "error" : NOT_ALL_PARTS_SELECTED}
	
	return {"passed" : true, "error" : ""}

func check_at_least_one() -> bool:
	if player_cpu.is_empty() or player_gpu.is_empty() or player_ram.is_empty() or player_psu.is_empty() or player_storage.is_empty():
		return false
	return true

func check_budget() -> bool:
	var sum : int = 0

	for item in player_build:
		sum += item.price 
	
	if sum > current_order.budget:
		return false
	else:
		return true

func check_single_items() -> bool:
	if player_cpu.size() > 1 or player_gpu.size() > 1 or player_ram.size() > 1 or player_psu.size() > 1 or player_storage.size() > 1:
		return false
	else:
		return true

func perform_checks() -> void:
	if player_cpu.get(0).cores < current_order.cpu_cores:
		cpu_cores_msg = current_order.cpu_cores_fail_msg
	else:
		cpu_cores_msg = "Passed!"
	
	if player_gpu.get(0).vram < current_order.gpu_vram:
		gpu_vram_msg = current_order.gpu_vram_fail_msg
	else:
		gpu_vram_msg = "Passed!"
	
	# TODO Add more checks for all the parts.
