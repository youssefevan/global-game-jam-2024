extends CharacterBody2D


var speed = 300.0

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	
	position += Input.get_vector("left", "right", "up", "down") * speed
