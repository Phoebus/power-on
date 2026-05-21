class_name GpuSpecs
extends PartGeneralData

@export var vram : int
@export_range(1,5) var performance_tier : int # 1-5

var type : Globals.PART_TYPE = Globals.PART_TYPE.GPU
