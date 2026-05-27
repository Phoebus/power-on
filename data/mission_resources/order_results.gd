class_name OrderResults
extends Resource

var cpu_cores_msg : String
var cpu_specialization_msg : String
var gpu_vram_msg : String
var gpu_speed_msg : String
var ram_size_msg : String
var ram_generation_msg : String
var ram_speed_msg : String
var storage_type_msg : String
var storage_size_msg : String
var psu_power_supply_msg : String
var psu_certification_msg : String

var score : int

# func _init(res_msg : Dictionary[OrderHandler.RESULT_TYPE, String], score_sum : int) -> void:
# 	score = score_sum

# 	cpu_cores_fail_msg = res_msg[OrderHandler.RESULT_TYPE.CPU_CORES]
# 	cpu_specialization_fail_msg = res_msg[OrderHandler.RESULT_TYPE.CPU_SPECIAL]
# 	gpu_speed_fail_msg = res_msg[OrderHandler.RESULT_TYPE.GPU_SPEED]
# 	gpu_vram_fail_msg = res_msg[OrderHandler.RESULT_TYPE.GPU_VRAM]
# 	ram_generation_fail_msg = res_msg[OrderHandler.RESULT_TYPE.RAM_GEN]
# 	ram_size_fail_msg = res_msg[OrderHandler.RESULT_TYPE.RAM_SIZE]
# 	ram_speed_fail_msg = res_msg[OrderHandler.RESULT_TYPE.RAM_SPEED]
# 	storage_size_fail_msg = res_msg[OrderHandler.RESULT_TYPE.STOR_SIZE]
# 	storage_type_fail_msg = res_msg[OrderHandler.RESULT_TYPE.STOR_TYPE]
# 	psu_certification_fail_msg = res_msg[OrderHandler.RESULT_TYPE.PSU_CERT]
# 	psu_power_supply_fail_msg = res_msg[OrderHandler.RESULT_TYPE.PSU_SUPP]
