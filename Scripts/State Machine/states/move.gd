extends State

const COYOTE_TIME := 0.2

@export var idle_state: State
@export var jump_state: State
@export var fall_state: State
@export var dash_state: State

var _coyote_timer: Timer
var _coyote_time_started := false

func _ready():
	_coyote_timer = Timer.new()
	_coyote_timer.autostart = false;
	_coyote_timer.one_shot = true;
	_coyote_timer.wait_time = COYOTE_TIME
	add_child(_coyote_timer)

func process_input(event: InputEvent) -> State:
	if get_dash(): 
		return dash_state
	return null;

func process_physics(delta: float) -> State:
	if get_jump() and _can_jump():
		return jump_state
		
	parent.velocity.y += gravity * delta
	
	var movement = get_movement_input().x * move_speed
	
	if movement == 0:
		return idle_state
	
	animations.flip_h = movement < 0
	parent.velocity.x = movement
	
	if !parent.is_on_floor():
		if !_coyote_time_started and _coyote_timer.is_stopped():
			_start_coyote_time()
			return null
			
		if _coyote_time_started and _coyote_timer.is_stopped():
			return fall_state
	else:
		if _coyote_time_started:
			_coyote_time_started = false
	
	parent.move_and_slide()
	
	return null

func _can_jump() -> bool:
	var canJump = (parent.is_on_floor() or !_coyote_timer.is_stopped())
	return canJump

func _start_coyote_time():
	_coyote_timer.start()
	_coyote_time_started = true
