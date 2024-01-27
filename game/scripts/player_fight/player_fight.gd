extends CharacterBody2D
class_name Player

@onready var idle = $StateManager/Idle
@onready var move = $StateManager/Move

@onready var states = $StateManager
@onready var animator = $Animator

var max_health = 100
var current_health

var speed = 5000
var movement_input : float

var gravity = 1000

func _ready():
	states.init(self)
	current_health = max_health

func _physics_process(delta):
	states.physics_update(delta)
	move_and_slide()

func handle_input() -> void:
	movement_input = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_movement(delta):
	velocity.x = movement_input * speed * delta

func apply_gravity(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 1

func _on_hurtbox_area_entered(area):
	if area.is_in_group("Enemy"):
		get_hurt(area.damage)

func get_hurt(damage):
	current_health -= damage
	print(current_health, "/" , max_health)
