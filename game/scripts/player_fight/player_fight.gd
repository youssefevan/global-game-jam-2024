extends CharacterBody2D

@onready var idle = $StateManager/Idle

@onready var states = $StateManager
@onready var animator = $Animator

func _ready():
	states.init(self)

func _physics_process(delta):
	states.physics_update(delta)
