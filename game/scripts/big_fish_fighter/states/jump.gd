extends State

func enter():
	super.enter()
	entity.velocity.y = -entity.jump_velocity

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	entity.face_opponent()
	
	if entity.got_hurt == true:
		return entity.hurt
	
	if entity.is_on_floor():
		return entity.move

func exit():
	super.exit()
