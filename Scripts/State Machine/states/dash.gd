extends State

@export var idle_state : State
@export var fall_state : State

@export var dash_force := 500
@export var dash_decay := 1500

@export var max_dashes := 1

var initial_dash_dir : Vector2
var negative_dash_dir : Vector2
var total_dashes := 0

func enter() -> void:
	super()
	initial_dash_dir = get_movement_input().normalized()
	negative_dash_dir = initial_dash_dir * -1;
	parent.velocity = initial_dash_dir * dash_force
	movement_controller.increment_dashes()

func process_physics(delta):
	parent.velocity += (negative_dash_dir * dash_decay) * delta
	parent.move_and_slide()
	
	var scalar_projection = initial_dash_dir.dot(parent.velocity)
	
	if scalar_projection <= 0:
		if parent.is_on_floor():
			return idle_state
		else:
			return fall_state
	
	return null;
