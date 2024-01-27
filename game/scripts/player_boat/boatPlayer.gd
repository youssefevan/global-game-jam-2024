extends CharacterBody2D


var speed = 2

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	movement()

func cast():
	if Input.is_action_just_pressed("cast"):
		if $Rod/Line.get_point_count() >= 2:
			self.set_process_input(false)
		else:
			$Rod/Line.add_point(get_local_mouse_position())
func movement():
	cast()
	if $Rod/Line.get_point_count() >= 2:
		self.set_process_input(false)
	else:
		position += Input.get_vector("left", "right", "up", "down") * speed
