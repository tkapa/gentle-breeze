extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var dash_state: State

@export var jump_force := 200.0

func enter() -> void:
	super()
	movement_controller.set_jumped()
	parent.velocity.y = -jump_force

func process_input(event: InputEvent) -> State:
	if get_dash(): 
		return dash_state
	return null;

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = get_movement_input().x * move_speed
	if movement != 0:
		animations.flip_h = movement < 0;
	
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
