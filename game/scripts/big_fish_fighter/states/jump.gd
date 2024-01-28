extends State

var frames

func enter():
	super.enter()
	entity.velocity.y = -entity.jump_velocity
	randomize()
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	frames = random.randi_range(5, 100)

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	entity.face_opponent()
	
	frames -= 1
	
	if entity.got_hurt == true:
		return entity.hurt
	
	if entity.is_on_floor():
		return entity.move
	
	if frames == 0:
		var random = RandomNumberGenerator.new()
		random.randomize()
		var attack_int = random.randi_range(0, 1)
		
		if attack_int == 0:
			#print("punch")
			return entity.punch
		elif attack_int == 1:
			#print("kick")
			return entity.kick

func exit():
	super.exit()
