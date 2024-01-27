extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	entity.handle_input()
	entity.apply_movement(delta)
	
	if entity.movement_input == 0:
		return entity.idle

func exit():
	super.exit()
