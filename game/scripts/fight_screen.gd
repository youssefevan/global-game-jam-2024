extends Node2D

func _ready():
	await get_tree().create_timer(0.25).timeout
	$Animator.play("slide_player")

func _on_animator_animation_finished(anim_name):
	if anim_name == "slide_player":
		$Animator.play("slide_fish")
