extends State

func enter():
	super.enter()

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	entity.face_opponent()
	
	return entity.move

func exit():
	super.exit()
