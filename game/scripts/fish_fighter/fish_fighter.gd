extends CharacterBody2D
class_name Fish

@onready var idle = $StateManager/Idle
@onready var move = $StateManager/Move

@onready var states = $StateManager
@onready var animator = $Animator

var speed = 5000
var movement_direction : float

var gravity = 1000

func _ready():
	states.init(self)

func _physics_process(delta):
	states.physics_update(delta)
	move_and_slide()

func apply_movement(delta):
	velocity.x = movement_direction * speed * delta

func apply_gravity(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 1
