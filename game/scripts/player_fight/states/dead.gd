extends State

func enter():
	super.enter()
	entity.got_hurt = false

func physics_update(delta):
	super.physics_update(delta)
	#entity.handle_input()
	#entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if entity.is_on_floor():
		entity.velocity.x = 0

func exit():
	super.exit()
