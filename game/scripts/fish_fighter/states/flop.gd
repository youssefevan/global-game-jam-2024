extends State

func enter():
	super.enter()
	entity.randomize_direction()
	entity.velocity.y = -entity.flop_power
	
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	entity.flop_player.pitch_scale = random.randf_range(0.8, 1.2)
	entity.flop_player.play()

func physics_update(delta):
	super.physics_update(delta)
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if entity.is_on_floor():
		return entity.flop
	
	if entity.got_hurt:
		return entity.hurt

func exit():
	super.exit()
