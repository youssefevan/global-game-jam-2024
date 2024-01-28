extends Node2D

var frame = 0

func _ready():
	frame = 0

func _physics_process(delta):
	if $Sprite2D.frame < 23:
		frame += 1
		if frame == 4:
			$Sprite2D.frame += 1
			frame = 0

func _on_sprite_2d_frame_changed():
	if $Sprite2D.frame == 22:
		get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/fight_screen.tscn")
