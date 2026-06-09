extends Node

const BUS_NAME : String = "Music"
const FILTER_EFFECT_INDEX : int = 0
const TRACK_PATH : String = "res://assets/audio/size12.ogg"
const DEFAULT_VOLUME_DB : float = -10.0
const FILTER_CUTOFF_MUFFLED : float = 600.0
const FILTER_CUTOFF_CLEAR : float = 20000.0
const FILTER_TWEEN_DURATION : float = 2.0

var player : AudioStreamPlayer
var _filter_tween : Tween

func _ready() -> void:
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load(TRACK_PATH)
	player.bus = BUS_NAME
	player.volume_db = DEFAULT_VOLUME_DB
	player.play()

func set_filter(enabled: bool) -> void:
	var bus_index : int = AudioServer.get_bus_index(BUS_NAME)
	var filter := AudioServer.get_bus_effect(bus_index, FILTER_EFFECT_INDEX) as AudioEffectLowPassFilter
	var target_hz : float = FILTER_CUTOFF_MUFFLED if enabled else FILTER_CUTOFF_CLEAR
	if _filter_tween:
		_filter_tween.kill()
	_filter_tween = create_tween()
	_filter_tween.tween_property(filter, "cutoff_hz", target_hz, FILTER_TWEEN_DURATION).set_trans(Tween.TRANS_SINE)

func set_volume(db: float) -> void:
	player.volume_db = db
