extends State

var frames

func enter():
	super.enter()
	entity.randomize_direction()
	frames = 60 * 0.5

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	entity.face_opponent()
	entity.opponent_detection()
	
	frames -= 1
	
	if frames == 0:
		if entity.opponent_in_range:
			return entity.get_random_action()
		else:
			return entity.move
	
	if entity.got_hurt == true:
		return entity.hurt

func exit():
	super.exit()
