extends Control

var maxhealth = 100.0
var health = 50.0

var player
var fish

func _ready():
	await get_tree().create_timer(0.1).timeout
	player = get_tree().get_first_node_in_group("Player")
	fish = get_tree().get_first_node_in_group("Fish")

func _physics_process(delta):
	if player:
		if player.current_health > 0:
			$PlayerBar.scale.x = player.current_health / player.max_health
		else:
			$PlayerBar.scale.x = 0
	if fish:
		if fish.current_health > 0:
			$FishBar.scale.x = -fish.current_health / fish.max_health
		else:
			$FishBar.scale.x = 0
