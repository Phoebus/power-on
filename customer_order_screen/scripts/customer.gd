class_name Customer
extends Control

signal take_order()

@export var flip_portrait : bool = false

var portrait : Texture2D = OrderHandler.current_order.customer_rect

const SLIDE_DURATION : float = 0.35
const SKEW : float = 80.0
const BORDER_WIDTH : float = 5.0
const PORTRAIT_PADDING : float = SKEW / 2.0 + BORDER_WIDTH

var _appeared : bool = false

func _draw() -> void:
	var w : float = size.x
	var h : float = size.y
	var poly := PackedVector2Array([
		Vector2(SKEW, 0.0),
		Vector2(w, 0.0),
		Vector2(w - SKEW, h),
		Vector2(0.0, h)
	])
	draw_polygon(poly, PackedColorArray([Color.WHITE]))
	if portrait:
		var pw : float = w - PORTRAIT_PADDING * 2.0
		var ph : float = h - BORDER_WIDTH * 2.0
		if flip_portrait:
			draw_set_transform(Vector2(PORTRAIT_PADDING * 2.0 + pw, 0.0), 0.0, Vector2(-1.0, 1.0))
		draw_texture_rect(portrait, Rect2(PORTRAIT_PADDING, BORDER_WIDTH, pw, ph), false)
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	draw_polyline(PackedVector2Array([poly[0], poly[1], poly[2], poly[3], poly[0]]), Color.BLACK, BORDER_WIDTH)

func _ready() -> void:
	MusicManager.fade_out_music()
	MusicManager.play_sfx(MusicManager.PHONE_RING_PATH)
	visible = false

func _exit_tree() -> void:
	MusicManager.stop_sfx()
	MusicManager.resume_music()

func appear() -> void:
	if _appeared:
		return
	_appeared = true
	MusicManager.stop_sfx()
	MusicManager.play_sfx(MusicManager.SWOOP_SFX_PATH)
	visible = true
	await get_tree().process_frame
	var target_x : float = position.x
	position.x = target_x - size.x
	var tween : Tween = create_tween()
	tween.tween_property(self, "position:x", target_x, SLIDE_DURATION).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_callback(func():
		MusicManager.play_sfx_fade_in(MusicManager.CALL_SFX_PATH)
		take_order.emit()
	)
