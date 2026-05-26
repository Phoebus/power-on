extends Node

var current_order : OrderBasic
var player_build : Array[PartGeneralData]
var player_cpu : Array[CpuSpecs]
var player_gpu : Array[GpuSpecs]
var player_ram : Array[RamSpecs]
var player_psu : Array[PsuSpecs]
var player_storage : Array[StorageSpecs]

var cpu_cores_msg : String = ""
var cpu_specialization_msg : String = ""
var gpu_vram_msg : String = ""
var gpu_speed_msg : String = ""
var ram_capacity_msg : String = ""
var ram_generation_msg : String = ""
var ram_speed_msg : String = ""
var psu_power_supply_msg : String = ""
var psu_certification_msg : String = ""
var storage_capacity_msg : String = ""
var storage_type_msg = ""

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

func check_enough_power() -> bool:
	var power_sum = 0

	for part in player_build:
		power_sum += part.power_draw

	if player_psu.get(0).power_supply <= power_sum:
		return false

	return true 

func perform_checks() -> void:
	
	# This method can create all the error messages and return them instead of storing them as fields of the class.
	# I should do this at some point.
	
	# CPU
	if player_cpu.get(0).cores < current_order.cpu_cores:
		cpu_cores_msg = current_order.cpu_cores_fail_msg
	else:
		cpu_cores_msg = "Passed!"
	
	if player_cpu.get(0).specialization != current_order.cpu_specialization:
		cpu_specialization_msg = current_order.cpu_specialization_fail_msg
	else:
		cpu_specialization_msg = "Passed!"

	# GPU
	if player_gpu.get(0).vram < current_order.gpu_vram:
		gpu_vram_msg = current_order.gpu_vram_fail_msg
	else:
		gpu_vram_msg = "Passed!"
	
	if player_gpu.get(0).performance_tier < current_order.gpu_performance_tier:
		gpu_speed_msg = current_order.gpu_performance_tier_fail_msg
	else:
		gpu_speed_msg = "Passed!"
	
	# RAM
	if player_ram.get(0).capacity < current_order.ram_capacity:
		ram_capacity_msg = current_order.ram_capacity_fail_msg
	else:
		ram_capacity_msg = "Passed!"
	
	if player_ram.get(0).generation == Globals.RAM_GENERATION.DDR4 and current_order.ram_generation == Globals.RAM_GENERATION.DDR5:
		ram_generation_msg = current_order.ram_generation_fail_msg
	else:
		ram_generation_msg = "Passed!"
	
	if player_ram.get(0).speed < current_order.ram_speed:
		ram_speed_msg = current_order.ram_speed_fail_msg
	else:
		ram_speed_msg = "Passed!"
	
	# PSU
	if not check_enough_power():
		psu_power_supply_msg = current_order.psu_power_supply_fail_msg
	else:
		psu_power_supply_msg = "Passed!"
	
	if player_psu.get(0).certification < current_order.psu_certification:
		psu_certification_msg = current_order.psu_certification_fail_msg
	else:
		psu_certification_msg = "Passed!"
	
	# Storage
	if player_storage.get(0).capacity < current_order.storage_capacity:
		storage_capacity_msg = current_order.storage_capacity_fail_msg
	else:
		storage_capacity_msg = "Passed!"
	
	if player_storage.get(0).type == Globals.STORAGE_TYPE.HDD and (current_order.storage_type == Globals.STORAGE_TYPE.SSD or current_order.storage_type == Globals.STORAGE_TYPE.SSD_NVME):
		storage_type_msg = current_order.storage_type_fail_msg
	else:
		storage_type_msg = "Passed!" 
