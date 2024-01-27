extends State

func enter():
	super.enter()
	entity.randomize_direction()
	entity.velocity.y = -entity.flop_power

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if entity.is_on_floor():
		return entity.flop

func exit():
	super.exit()
