extends CharacterBody2D

const SPEED = 400
const JUMPSPEED = 500
const GRAVITY = 2500
const FLOATVAL = 100
const FLOATREDUCTION = 20

var jumping = false
var float_tracker = FLOATVAL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var jump = Input.is_action_just_pressed('jump')
	var jumping = Input.is_action_pressed('jump')

	if jumping and is_on_floor():
		jumping = false
		float_tracker = FLOATVAL
	if jumping and float_tracker >= 0:
		velocity.y -= float_tracker
		float_tracker -= FLOATREDUCTION

	if is_on_floor() and jump:
		velocity.y -= JUMPSPEED
	if right:
		velocity.x += SPEED
	if left:
		velocity.x -= SPEED

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	get_input()
	move_and_slide()
