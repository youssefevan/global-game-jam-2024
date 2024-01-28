extends CharacterBody2D
class_name Player

@onready var idle = $StateManager/Idle
@onready var move = $StateManager/Move
@onready var jump = $StateManager/Jump
@onready var hurt = $StateManager/Hurt
@onready var punch = $StateManager/Punch
@onready var kick = $StateManager/Kick
@onready var dead = $StateManager/Dead

@onready var states = $StateManager
@onready var animator = $Animator

var max_health = 200
var current_health

var speed = 10000
var movement_input : float

var damage_taken : float
var knockback_angle : float
var knockback_power : float
var hitstun_frames : int
var hitbox_dir : float
var got_hurt : bool

var jump_velocity = 400
var release_jump_velocity = 200
var jump_was_pressed : bool
var jump_buffer = 0.05

var gravity = 1000

var opponent

func _ready():
	states.init(self)
	current_health = Global.player_health
	jump_was_pressed = false
	$Hitbox/Collider.disabled = true
	
	await get_tree().create_timer(0.1).timeout
	opponent = get_tree().get_first_node_in_group("Fish")
	face_opponent()

func _physics_process(delta):
	states.physics_update(delta)
	jump_buffering()
	move_and_slide()

func handle_input() -> void:
	movement_input = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_movement(delta):
	if is_on_floor():
		velocity.x = movement_input * speed * delta
	else:
		velocity.x = lerp(velocity.x, movement_input * speed * delta, 5 * delta)

func apply_gravity(delta):
	if !is_on_floor():
		if velocity.y > 0:
			velocity.y += gravity * 1.5 * delta
		else:
			velocity.y += gravity * delta
	else:
		velocity.y = 1

func jump_buffering() -> void:
	if Input.is_action_just_pressed("up"):
		jump_was_pressed = true
		await get_tree().create_timer(jump_buffer).timeout
		jump_was_pressed = false

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
	#print("Player: ", current_health, "/" , max_health)

func face_opponent():
	if opponent:
		if opponent.global_position.x - global_position.x >= 0:
			$Sprite.flip_h = false
			$Hitbox.scale.x = 1
		else:
			$Sprite.flip_h = true
			$Hitbox.scale.x = -1
