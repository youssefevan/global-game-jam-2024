extends CharacterBody2D

var speed = 100

func _physics_process(delta):
	move_and_slide()
	#movement(delta)

func cast():
	if Input.is_action_just_pressed("cast"):
		pass

func movement(delta):
	cast()
	if $Rod/Line.get_point_count() >= 2:
		self.set_process_input(false)
	else:
		position += Input.get_vector("left", "right", "up", "down") * speed * delta
