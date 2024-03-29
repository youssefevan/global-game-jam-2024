extends Node2D

@export var force_big : bool
@export var force_small : bool

func _ready():
	await get_tree().create_timer(0.25).timeout
	$Animator.play("slide_player")
	
	if force_big == false and force_small == false:
		randomize()
		var random = RandomNumberGenerator.new()
		random.randomize()
		Global.fish_type = randi_range(0, 1)
	elif force_big == true:
		Global.fish_type = 1
	elif force_small == true:
		Global.fish_type = 0

func _on_animator_animation_finished(anim_name):
	if anim_name == "slide_player":
		if Global.fish_type == 0:
			$Animator.play("slide_fish")
		else:
			$Animator.play("slide_big")
	else:
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/fighting/fighting_test.tscn")
