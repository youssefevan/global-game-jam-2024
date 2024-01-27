extends Node
class_name State

var entity : CharacterBody2D

func enter():
	if entity.states.print_states == true: 
		print(entity.name, ": ", entity.states.current_state.name)
	entity.animator.play(entity.states.current_state.name)

func update(delta):
	return null

func physics_update(delta):
	pass

func exit():
	pass
