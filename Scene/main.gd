extends Node2D

var pickup_count := 0

@onready var count_label: Label = $HUD/CountLabel
@onready var finish_label: Label = $HUD/FinishLabel
@onready var restart_button: Button = $HUD/RestartButton

func _ready() -> void:
	count_label.text = "拾取：" + str(pickup_count)
	
func _on_pickup_collected() -> void:
	pickup_count += 1
	count_label.text = "拾取：" + str(pickup_count)
	if pickup_count >= 3:
		finish_label.show()
		restart_button.show()


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
