extends Control


func _on_start_pressed():
	get_tree().change_scene("res://scenes/Mainarena.tscn")

func _on_options_pressed():
	get_tree().change_scene("res://scenes/options.tscn")

func _on_quit_pressed():
	get_tree().quit()
