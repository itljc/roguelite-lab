extends Node2D

var pickup_count := 0

@onready var count_label: Label = $HUD/CountLabel

func _ready() -> void:
	count_label.text = "拾取：" + str(pickup_count)
	
func _on_pickup_collected() -> void:
	pickup_count += 1
	count_label.text = "拾取：" + str(pickup_count)
