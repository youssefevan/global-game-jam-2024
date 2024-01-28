extends Node2D

@onready var fish = preload("res://scenes/fighting/fish_fighter.tscn")
@onready var big_fish = preload("res://scenes/fighting/big_fish_fighter.tscn")

var player
var enemy

func _ready():
	var f
	if Global.fish_type == 0:
		f = fish.instantiate()
		add_child(f)
		f.global_position = $SpawnPosition.global_position
	else:
		f = big_fish.instantiate()
		add_child(f)
		f.global_position = $SpawnPosition.global_position
	
	player = $PlayerFight
	enemy = f

func _physics_process(delta):
	if enemy.current_health <= 0 and $GUI/Win.visible == false:
		$GUI/Win.visible = true
	if player.current_health <= 0 and $GUI/Death.visible == false:
		$GUI/Death.visible = true

func _on_death_visibility_changed():
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_win_visibility_changed():
	await get_tree().create_timer(3).timeout
	Global.fish_killed += 1
	Global.player_health = player.current_health + 50
	if Global.player_health > 200:
		Global.player_health = 200
	get_tree().change_scene_to_file("res://scenes/fight_screen.tscn")
