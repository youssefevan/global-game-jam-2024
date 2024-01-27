extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	entity.handle_input()
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	entity.face_opponent()
	
	if Input.is_action_just_pressed("punch"):
		return entity.punch
	
	if entity.is_on_floor() and entity.movement_input != 0:
		return entity.move
	
	if entity.got_hurt == true:
		return entity.hurt
	
	if entity.is_on_floor() and entity.jump_was_pressed:
		return entity.jump

func exit():
	super.exit()
