extends SporeState

@export var follow_state: SporeState
@export var pushed_state: SporeState

const BOB_TIME: float = 2

var _bob_timer: Timer
var _player_entered: bool = false
var _bob_direction: Vector2 = Vector2.UP

func enter() -> void:
	super()
	_build_bob_timer()
	_player_entered = false
	player_detection_component.on_player_entered.connect(player_entered)

func process_physics(delta: float) -> SporeState:
	var dir = _bob_direction * move_speed
	parent.velocity = dir 
	parent.move_and_slide()
	
	if _player_entered:
		return follow_state
	return null

func exit() -> void:
	super()
	_destroy_bob_timer()
	player_detection_component.on_player_entered.disconnect(player_entered)

func player_entered(player: Player):
	_player_entered = true

func _build_bob_timer():
	_bob_timer = Timer.new()
	_bob_timer.timeout.connect(_on_bob_timeout)
	add_child(_bob_timer)
	_bob_timer.start(BOB_TIME)

func _destroy_bob_timer():
	_bob_timer.queue_free()

func _on_bob_timeout():
	_bob_direction = _bob_direction * -1;
