extends CharacterBody2D
class_name Player

@onready var idle = $StateManager/Idle
@onready var move = $StateManager/Move
@onready var punch = $StateManager/Punch
@onready var hurt = $StateManager/Hurt

@onready var states = $StateManager
@onready var animator = $Animator

var max_health = 100
var current_health

var speed = 10000
var movement_input : float

var damage_taken : float
var knockback_angle : float
var knockback_power : float
var hitstun_frames : int
var hitbox_dir : float
var got_hurt : bool

var gravity = 1000

func _ready():
	states.init(self)
	current_health = max_health
	
	$Hitbox/Collider.disabled = true

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
		get_hurt(area)

func get_hurt(area):
	damage_taken = area.damage
	hitstun_frames = area.hitstun
	knockback_angle = area.knockback_angle
	knockback_power = area.knockback_power
	hitbox_dir = area.global_position.x - global_position.x
	got_hurt = true

func take_damage():
	current_health -= damage_taken
	print("Player: ", current_health, "/" , max_health)
