extends State

func enter():
	super.enter()
	
	entity.velocity.y = -entity.jump_velocity
	
	if Input.is_action_just_released("up"):
		entity.velocity.y = -entity.release_jump_velocity

func physics_update(delta):
	super.physics_update(delta)
	entity.handle_input()
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if Input.is_action_just_pressed("punch"):
		return entity.punch
	
	if entity.got_hurt == true:
		return entity.hurt
	
	if entity.is_on_floor():
		if entity.movement_input != 0:
			return entity.move
		else:
			return entity.idle
	
	if entity.velocity.y < -entity.release_jump_velocity and Input.is_action_just_released("up"):
		entity.velocity.y = -entity.release_jump_velocity

func exit():
	super.exit()
