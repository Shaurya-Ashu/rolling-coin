extends CharacterBody2D


var speed = 100
var jump_force = -220
var gravity = 900

var is_dead = false

@onready var anim = $AnimatedSprite2D



func _physics_process(delta):

	if is_dead:
		return

	
	if not is_on_floor():
		velocity.y += gravity * delta


	
	var direction = Input.get_axis("move left", "move right")
	velocity.x = direction * speed


	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force


	move_and_slide()

	update_animation(direction)



func update_animation(direction):

	if not is_on_floor():
		anim.play("jump")

	elif direction == 0:
		anim.play("idle")

	elif direction > 0:
		anim.play("move_right")

	else:
		anim.play("move_left")
