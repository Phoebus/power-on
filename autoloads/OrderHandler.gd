extends Node

enum RESULT_TYPE {SCORE, CPU_CORES, CPU_SPECIAL, GPU_VRAM, GPU_SPEED, RAM_SIZE, RAM_GEN, RAM_SPEED, PSU_SUPP, PSU_CERT, STOR_SIZE, STOR_TYPE}

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
		return {"passed" : false, "error" : "Μπορεις να επιλεξεις μονο 1 απο καθε ειδος αντικειμενου!"}
	elif not check_budget():
		return {"passed" : false, "error" : "Εχεις ξεπερασει το διαθεσιμο ποσο!"}
	elif not check_at_least_one():
		return {"passed" : false, "error" : "Δεν εχεις επιλεξει 1 απο καθε ειδος αντικειμενου!"}
	
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

func perform_checks() -> OrderResults:
	
	# This method can create all the error messages and return them instead of storing them as fields of the class.
	# I should do this at some point.
	var	results : OrderResults = OrderResults.new()

	# CPU
	if player_cpu.get(0).cores < current_order.cpu_cores:
		results.cpu_cores_msg = current_order.cpu_cores_fail_msg
	else:
		results.cpu_cores_msg = "Passed!"
		results.score += 1
	
	# TODO Better detection needed.
	if (player_cpu.get(0).specialization != current_order.cpu_specialization) or (player_cpu.get(0).specialization == Globals.CPU_SPECIALIZATION.ALL):
		results.cpu_specialization_msg = current_order.cpu_specialization_fail_msg
	else:
		results.cpu_specialization_msg = "Passed!"
		results.score += 1

	# GPU
	if player_gpu.get(0).vram < current_order.gpu_vram:
		results.gpu_vram_msg = current_order.gpu_vram_fail_msg
	else:
		results.gpu_vram_msg = "Passed!"
		results.score += 1
	
	if player_gpu.get(0).performance_tier < current_order.gpu_speed:
		results.gpu_speed_msg = current_order.gpu_speed_fail_msg
	else:
		results.gpu_speed_msg = "Passed!"
		results.score += 1
	
	# RAM
	if player_ram.get(0).capacity < current_order.ram_size:
		results.ram_size_msg = current_order.ram_size_fail_msg
	else:
		results.ram_size_msg = "Passed!"
		results.score += 1
	
	if player_ram.get(0).generation == Globals.RAM_GENERATION.DDR4 and current_order.ram_generation == Globals.RAM_GENERATION.DDR5:
		results.ram_generation_msg = current_order.ram_generation_fail_msg
	else:
		results.ram_generation_msg = "Passed!"
		results.score += 1
	
	if player_ram.get(0).speed < current_order.ram_speed:
		results.ram_speed_msg = current_order.ram_speed_fail_msg
	else:
		results.ram_speed_msg = "Passed!"
		results.score += 1
	
	# PSU
	if not check_enough_power():
		results.psu_power_supply_msg = current_order.psu_power_supply_fail_msg
	else:
		results.psu_power_supply_msg = "Passed!"
		results.score += 1
	
	if player_psu.get(0).certification < current_order.psu_certification:
		results.psu_certification_msg = current_order.psu_certification_fail_msg
	else:
		results.psu_certification_msg = "Passed!"
		results.score += 1
	
	# Storage
	if player_storage.get(0).capacity < current_order.storage_size:
		results.storage_size_msg = current_order.storage_size_fail_msg
	else:
		results.storage_size_msg = "Passed!"
		results.score += 1	
	
	if player_storage.get(0).type == Globals.STORAGE_TYPE.HDD and (current_order.storage_type == Globals.STORAGE_TYPE.SSD or current_order.storage_type == Globals.STORAGE_TYPE.SSD_NVME):
		results.storage_type_msg = current_order.storage_type_fail_msg
	else:
		results.storage_type_msg = "Passed!"
		results.score += 1 

	return results

func clear_mission_data(starting_state : OrderBasic) -> void:

	current_order = starting_state
	player_build = []
	player_cpu = []
	player_gpu = []
	player_psu = []
	player_ram = []
	player_storage = []