extends CharacterBody2D
class_name Fish

@onready var idle = $StateManager/Idle
@onready var flop = $StateManager/Flop
@onready var hurt = $StateManager/Hurt
@onready var dead = $StateManager/Dead

@onready var states = $StateManager
@onready var animator = $Animator

var max_health = 50
var current_health

var speed = 10000
var movement_direction : float

var flop_power = 400

var gravity = 1000

var damage_taken : float
var knockback_angle : float
var knockback_power : float
var hitstun_frames : int
var hitbox_dir : float
var got_hurt : bool

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
