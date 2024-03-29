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
	
	if entity.got_hurt == true:
		return entity.hurt
	
	if entity.is_on_floor():
		return entity.idle

func exit():
	super.exit()
