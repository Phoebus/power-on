extends Node

const order_screen : PackedScene = preload("res://customer_order_screen/scenes/order_screen.tscn")
const shop_screen : PackedScene = preload("res://shop_menu/scenes/shop_menu.tscn")
const results_screen : PackedScene = preload("res://results_screen/scenes/results.tscn")

func to_shop(order_details : OrderBasic) -> void:
	OrderHandler.current_order = order_details
	call_deferred("switch_scene_deferred", shop_screen)

func to_order() -> void:
	OrderHandler.clear_mission_data(null)
	call_deferred("switch_scene_deferred", order_screen)

func to_results() -> void:
	call_deferred("switch_scene_deferred", results_screen)

func switch_scene_deferred(new_scene : PackedScene) -> void:
	get_tree().change_scene_to_packed(new_scene)