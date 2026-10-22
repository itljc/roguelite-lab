extends Node2D

var total_pickups: int = 0
var pickup_count := 0
var elapsed_time: float = 0.0
var is_finished: bool = false

@onready var count_label: Label = $HUD/CountLabel
@onready var finish_label: Label = $HUD/FinishLabel
@onready var restart_button: Button = $HUD/RestartButton
@onready var player: CharacterBody2D = $Player
@onready var time_label: Label = $HUD/TimeLabel

func _ready() -> void:
	total_pickups = get_tree().get_nodes_in_group("pickups").size()
	for pickup in get_tree().get_nodes_in_group("pickups"):
		if not pickup.is_connected("collected", _on_pickup_collected):
			pickup.connect("collected", _on_pickup_collected)
	count_label.text = "拾取：%d / %d" % [pickup_count, total_pickups]

func _process(delta: float) -> void:
	if is_finished:
		return
	elapsed_time += delta
	time_label.text = "用时：%.2f 秒" % elapsed_time	
	
func _on_pickup_collected() -> void:
	pickup_count += 1
	count_label.text = "拾取：%d / %d" % [pickup_count, total_pickups]
	if total_pickups > 0 and pickup_count >= total_pickups:
		is_finished = true
		finish_label.show()
		restart_button.show()
		player.set_physics_process(false)
		player.velocity = Vector2.ZERO


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
