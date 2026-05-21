extends PartGeneralData

@export var capacity : int
@export var generation : Globals.RAM_GENERATION
@export_range(1, 5) var speed : int

var type : Globals.PART_TYPE = Globals.PART_TYPE.RAM