extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if entity.is_on_floor():
		return entity.flop
	
	if entity.got_hurt:
		return entity.hurt
	

func exit():
	super.exit()
