extends CharacterBody2D
class_name BigFish

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
var movement_direction : float

var gravity = 1000

var damage_taken : float
var knockback_angle : float
var knockback_power : float
var hitstun_frames : int
var hitbox_dir : float
var got_hurt : bool

var opponent
var opponent_in_range : bool

func _ready():
	states.init(self)
	current_health = max_health
	
	opponent = get_tree().get_first_node_in_group("Player")
	face_opponent()
	
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
	
	if random.randi_range(0, 5) == 0:
		movement_direction = 0
	elif random.randi_range(0, 5) == 1:
		movement_direction = $Hitbox.scale.x
	elif random.randi_range(0, 5) >= 2:
		movement_direction = -$Hitbox.scale.x

func get_random_action():
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	var action : State
	
	if random.randi_range(0, 2) == 0:
		action = punch
	elif random.randi_range(0, 2) == 1:
		action = kick
	elif random.randi_range(0, 10) >= 2:
		action = move
	
	return action

func _on_hurtbox_area_entered(area):
	if area.is_in_group("Player"):
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
	print("Fish: ", current_health, "/" , max_health)

func face_opponent():
	if opponent.global_position.x - global_position.x >= 0:
		$Sprite.flip_h = true
		$Hitbox.scale.x = -1
	else:
		$Sprite.flip_h = false
		$Hitbox.scale.x = 1

func opponent_detection():
	if abs(opponent.global_position.x - global_position.x) < 200:
		opponent_in_range = true
	else:
		opponent_in_range = false
