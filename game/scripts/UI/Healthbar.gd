extends Control

var maxhealth = 100.0
var health = 50.0

var player
var fish

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	fish = get_tree().get_first_node_in_group("Fish")

func _physics_process(delta):
	$PlayerBar.scale.x = player.current_health / player.max_health
	$FishBar.scale.x = -fish.current_health / fish.max_health
