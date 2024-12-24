extends CharacterBody2D

const SPEED = 150
const JUMPSPEED = 300
const GRAVITY = 1000

var jumping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var jump = Input.is_action_just_pressed('jump')
	var jumping = Input.is_action_pressed('jump')

	if is_on_floor() and jump:
		jumping = true
		velocity.y -= JUMPSPEED
	if right:
		velocity.x += SPEED
	if left:
		velocity.x -= SPEED

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	get_input()
	move_and_slide()
	if velocity.length() > 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.stop()
