extends Control

var maxhealth = 100.0
var health = 50.0

func _ready():
	Health()


func Health():
	$ColorRect2.scale.x = health / maxhealth
	print(health / maxhealth) 
