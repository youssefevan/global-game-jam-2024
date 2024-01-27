extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	entity.handle_input()
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if Input.is_action_just_pressed("punch"):
		return entity.punch
	
	if entity.movement_input != 0:
		return entity.move
	
	if entity.got_hurt == true:
		return entity.hurt

func exit():
	super.exit()
