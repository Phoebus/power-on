extends Node

const BUS_NAME : String = "Music"
const FILTER_EFFECT_INDEX : int = 0
const TRACK_PATH : String = "res://assets/audio/size12.ogg"
const PHONE_RING_PATH : String = "res://assets/audio/phone_ring.ogg"
const CALL_SFX_PATH : String = "res://assets/audio/call_sfx.ogg"
const SWOOP_SFX_PATH : String = "res://assets/audio/swoop.ogg"
const DEFAULT_VOLUME_DB : float = -10.0
const FILTER_CUTOFF_MUFFLED : float = 600.0
const FILTER_CUTOFF_CLEAR : float = 20000.0
const FILTER_TWEEN_DURATION : float = 3.0

var player : AudioStreamPlayer
var sfx_player : AudioStreamPlayer
var _filter_tween : Tween
var _fade_tween : Tween
var _sfx_tween : Tween

func _ready() -> void:
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load(TRACK_PATH)
	player.bus = BUS_NAME
	player.volume_db = DEFAULT_VOLUME_DB
	player.play()

	sfx_player = AudioStreamPlayer.new()
	sfx_player.volume_db = DEFAULT_VOLUME_DB
	add_child(sfx_player)

func set_filter(enabled: bool) -> void:
	var bus_index : int = AudioServer.get_bus_index(BUS_NAME)
	assert(bus_index != -1, "Audio bus '%s' not found" % BUS_NAME)
	var filter := AudioServer.get_bus_effect(bus_index, FILTER_EFFECT_INDEX) as AudioEffectLowPassFilter
	assert(filter != null, "Bus effect at index %d is not an AudioEffectLowPassFilter" % FILTER_EFFECT_INDEX)
	var target_hz : float = FILTER_CUTOFF_MUFFLED if enabled else FILTER_CUTOFF_CLEAR
	if _filter_tween:
		_filter_tween.kill()
	_filter_tween = create_tween()
	_filter_tween.tween_property(filter, "cutoff_hz", target_hz, FILTER_TWEEN_DURATION).set_trans(Tween.TRANS_SINE)

func fade_out_music(duration: float = 1.5) -> void:
	if _fade_tween:
		_fade_tween.kill()
	_fade_tween = create_tween()
	_fade_tween.tween_property(player, "volume_db", -80.0, duration).set_trans(Tween.TRANS_SINE)
	_fade_tween.tween_callback(func(): player.stream_paused = true)

func resume_music() -> void:
	if _fade_tween:
		_fade_tween.kill()
	player.volume_db = DEFAULT_VOLUME_DB
	player.stream_paused = false

func play_sfx(path: String) -> void:
	var stream : AudioStream = load(path) as AudioStream
	if stream:
		if _sfx_tween:
			_sfx_tween.kill()
		sfx_player.volume_db = DEFAULT_VOLUME_DB
		sfx_player.stream = stream
		sfx_player.play()

func play_sfx_fade_in(path: String, duration: float = 1.0) -> void:
	var stream : AudioStream = load(path) as AudioStream
	if stream:
		if _sfx_tween:
			_sfx_tween.kill()
		sfx_player.volume_db = -80.0
		sfx_player.stream = stream
		sfx_player.play()
		_sfx_tween = create_tween()
		_sfx_tween.tween_property(sfx_player, "volume_db", DEFAULT_VOLUME_DB, duration).set_trans(Tween.TRANS_SINE)

func stop_sfx() -> void:
	if _sfx_tween:
		_sfx_tween.kill()
	sfx_player.stop()
