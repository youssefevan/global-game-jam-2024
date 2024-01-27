extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	#entity.handle_input()
	entity.apply_movement(delta)
	entity.apply_gravity(delta)

func exit():
	super.exit()

func _on_animator_animation_finished(anim_name):
	pass # Replace with function body.
