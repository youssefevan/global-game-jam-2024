extends CharacterBody2D

@onready var idle = $StateManager/Idle

@onready var states = $StateManager
@onready var animator = $Animator

var speed = 500
var movement_input : float

func _ready():
	states.init(self)

func _physics_process(delta):
	states.physics_update(delta)

func handle_input() -> void:
	movement_input = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_movement(delta):
	velocity.x = movement_input * speed * delta
