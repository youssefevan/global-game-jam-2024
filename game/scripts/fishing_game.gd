extends Node2D

@onready var fishscene = preload("res://scenes/fish_bait.tscn")

func _ready():
	$Timer.start()

func _on_timer_timeout():
	var fish = fishscene.instantiate()
	get_tree().get_root().add_child(fish)
	fish.global_position = $Spawnpoint.global_position

func _on_area_2d_area_entered(area):
	print("yeah")
	area.caught()
