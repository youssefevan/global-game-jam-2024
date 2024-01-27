extends CharacterBody2D
class_name Fish

@onready var idle = $StateManager/Idle
@onready var flop = $StateManager/Flop

@onready var states = $StateManager
@onready var animator = $Animator

var max_health = 25
var current_health

var speed = 10000
var movement_direction : float

var flop_power = 400

var gravity = 1000

func _ready():
	states.init(self)
	current_health = max_health
	
	randomize()

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

func randomize_direction():
	var random = RandomNumberGenerator.new()
	random.randomize()
	movement_direction = random.randf_range(-1,1)
