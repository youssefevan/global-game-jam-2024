extends Control

func _ready():
	Global.player_health = 200
	$FishKilled.text = "Fish Killed: " + str(Global.fish_killed)
	$FishKilled2.text = "Fish Killed: " + str(Global.fish_killed)

func _on_start_pressed():
	Global.fish_killed = 0
	get_tree().change_scene_to_file("res://scenes/fight_screen.tscn")

func _on_quit_pressed():
	get_tree().quit()
