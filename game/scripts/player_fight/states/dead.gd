extends State

func enter():
	super.enter()
	entity.got_hurt = false
	
	entity.velocity = get_knockback_angle() * entity.knockback_power
	#print(entity.velocity)
	
	entity.take_damage()

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
	
	if entity.is_on_floor():
		entity.velocity.x = 0

func exit():
	super.exit()
