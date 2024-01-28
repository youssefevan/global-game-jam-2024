extends Area2D

var speed = 50

func _ready():
	$AnimationPlayer.play("anim")
	speed = 50

func _physics_process(delta):
	position.x -= speed * delta

func caught():
	speed = 0
	$AnimationPlayer.play("caught")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Caught":
		call_deferred("queue_free")
