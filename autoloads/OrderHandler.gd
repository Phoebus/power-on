extends Node

enum RESULT_TYPE {CPU_CORES, CPU_SPECIAL, GPU_VRAM, GPU_SPEED, RAM_SIZE, RAM_GEN, RAM_SPEED, PSU_SUPP, PSU_CERT, STOR_SIZE, STOR_TYPE}

var current_order : OrderBasic
var player_build : Array[PartGeneralData]
var player_cpu : Array[CpuSpecs]
var player_gpu : Array[GpuSpecs]
var player_ram : Array[RamSpecs]
var player_psu : Array[PsuSpecs]
var player_storage : Array[StorageSpecs]

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
		return {"passed" : false, "error" : "You can only have 1 of each type of item!"}
	elif not check_budget():
		return {"passed" : false, "error" : "You have exceeded the given budget!"}
	elif not check_at_least_one():
		return {"passed" : false, "error" : "You haven't selected 1 of each type of item!"}
	
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

func perform_checks() -> Dictionary[RESULT_TYPE, String]:
	
	# This method can create all the error messages and return them instead of storing them as fields of the class.
	# I should do this at some point.

	var results : Dictionary[RESULT_TYPE, String]

	# CPU
	if player_cpu.get(0).cores < current_order.cpu_cores:
		results[RESULT_TYPE.CPU_CORES] = current_order.cpu_cores_fail_msg
	else:
		results[RESULT_TYPE.CPU_CORES] = "Passed!"
	
	# TODO Better detection needed.
	if player_cpu.get(0).specialization != current_order.cpu_specialization:
		results[RESULT_TYPE.CPU_SPECIAL] = current_order.cpu_specialization_fail_msg
	else:
		results[RESULT_TYPE.CPU_SPECIAL] = "Passed!"

	# GPU
	if player_gpu.get(0).vram < current_order.gpu_vram:
		results[RESULT_TYPE.GPU_VRAM] = current_order.gpu_vram_fail_msg
	else:
		results[RESULT_TYPE.GPU_VRAM] = "Passed!"
	
	if player_gpu.get(0).performance_tier < current_order.gpu_speed:
		results[RESULT_TYPE.GPU_SPEED] = current_order.gpu_speed_fail_msg
	else:
		results[RESULT_TYPE.GPU_SPEED] = "Passed!"
	
	# RAM
	if player_ram.get(0).capacity < current_order.ram_size:
		results[RESULT_TYPE.RAM_SIZE] = current_order.ram_size_fail_msg
	else:
		results[RESULT_TYPE.RAM_SIZE] = "Passed!"
	
	if player_ram.get(0).generation == Globals.RAM_GENERATION.DDR4 and current_order.ram_generation == Globals.RAM_GENERATION.DDR5:
		results[RESULT_TYPE.RAM_GEN] = current_order.ram_generation_fail_msg
	else:
		results[RESULT_TYPE.RAM_GEN] = "Passed!"
	
	if player_ram.get(0).speed < current_order.ram_speed:
		results[RESULT_TYPE.RAM_SPEED] = current_order.ram_speed_fail_msg
	else:
		results[RESULT_TYPE.RAM_SPEED] = "Passed!"
	
	# PSU
	if not check_enough_power():
		results[RESULT_TYPE.PSU_SUPP] = current_order.psu_power_supply_fail_msg
	else:
		results[RESULT_TYPE.PSU_SUPP] = "Passed!"
	
	if player_psu.get(0).certification < current_order.psu_certification:
		results[RESULT_TYPE.PSU_CERT] = current_order.psu_certification_fail_msg
	else:
		results[RESULT_TYPE.PSU_CERT] = "Passed!"
	
	# Storage
	if player_storage.get(0).capacity < current_order.storage_size:
		results[RESULT_TYPE.STOR_SIZE] = current_order.storage_size_fail_msg
	else:
		results[RESULT_TYPE.STOR_SIZE] = "Passed!"
	
	if player_storage.get(0).type == Globals.STORAGE_TYPE.HDD and (current_order.storage_type == Globals.STORAGE_TYPE.SSD or current_order.storage_type == Globals.STORAGE_TYPE.SSD_NVME):
		results[RESULT_TYPE.STOR_TYPE] = current_order.storage_type_fail_msg
	else:
		results[RESULT_TYPE.STOR_TYPE] = "Passed!" 
	
	return results