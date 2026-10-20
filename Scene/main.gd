extends Node2D

var pickup_count := 0
var elapsed_time: float = 0.0
var is_finished: bool = false

@onready var count_label: Label = $HUD/CountLabel
@onready var finish_label: Label = $HUD/FinishLabel
@onready var restart_button: Button = $HUD/RestartButton
@onready var player: CharacterBody2D = $Player
@onready var time_label: Label = $HUD/TimeLabel

func _ready() -> void:
	count_label.text = "拾取：" + str(pickup_count)

func _process(delta: float) -> void:
	if is_finished:
		return
	elapsed_time += delta
	time_label.text = "用时：%.2f 秒" % elapsed_time	
	
func _on_pickup_collected() -> void:
	pickup_count += 1
	count_label.text = "拾取：" + str(pickup_count)
	if pickup_count >= 3:
		is_finished = true
		finish_label.show()
		restart_button.show()
		player.set_physics_process(false)
		player.velocity = Vector2.ZERO


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
