extends State

var frames : int

func enter():
	super.enter()
	entity.got_hurt = false
	
	entity.velocity = get_knockback_angle() * entity.knockback_power
	#print(entity.velocity)
	
	entity.take_damage()
	frames = entity.hitstun_frames
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	entity.hit_player.pitch_scale = random.randf_range(0.8, 1.2)
	entity.hit_player.play()

func get_knockback_angle():
	var kb_angle_radians = deg_to_rad(entity.knockback_angle)
	var kb_x = cos(kb_angle_radians)
	var kb_y = sin(kb_angle_radians)
	var output = Vector2(kb_x, kb_y)
	
	if entity.hitbox_dir > 0:
		output.x *= -1
	else:
		output.x *= 1
	
	return output

func physics_update(delta):
	super.physics_update(delta)
	#entity.handle_input()
	#entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	frames -= 1
	
	if frames == 0:
		if entity.current_health <= 0:
			return entity.dead
		else:
			return entity.flop
	
	if entity.got_hurt == true:
		return entity.hurt

func exit():
	super.exit()
	frames = 0
