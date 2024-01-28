extends State

var anim_done : bool

func enter():
	super.enter()
	anim_done = false
	
	if entity.is_on_floor():
		entity.movement_input = 0
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	entity.woosh_player.pitch_scale = random.randf_range(0.6, 1.0)
	entity.woosh_player.play()

func physics_update(delta):
	super.physics_update(delta)
	#entity.handle_input()
	entity.apply_movement(delta)
	entity.apply_gravity(delta)
	
	if anim_done == true:
		return entity.idle
	
	if entity.got_hurt == true:
		return entity.hurt

func exit():
	super.exit()

func _on_animator_animation_finished(anim_name):
	anim_done = true
