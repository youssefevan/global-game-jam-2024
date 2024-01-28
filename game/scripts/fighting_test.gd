extends Node2D

@onready var fish = preload("res://scenes/fighting/fish_fighter.tscn")
@onready var big_fish = preload("res://scenes/fighting/big_fish_fighter.tscn")

func _ready():
	if Global.fish_type == 0:
		var f = fish.instantiate()
		add_child(f)
		f.global_position = $SpawnPosition.global_position
	else:
		var f = big_fish.instantiate()
		add_child(f)
		f.global_position = $SpawnPosition.global_position
