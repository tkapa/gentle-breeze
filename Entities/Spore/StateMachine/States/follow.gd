extends SporeState

@export var idle_state: SporeState
@export var pushed_state: SporeState
@export var follow_distance: int = 30

var _player_dashed: bool = false

func enter() -> void:
	super()
	SignalBus.player_dashed.connect(_on_player_dashed)

func process_physics(delta: float) -> SporeState:
	if parent.player == null:
		return idle_state
	
	var current_position = parent.position
	var player_position = parent.player.position
	var dir = current_position.direction_to(player_position)
	var dist = current_position.distance_to(player_position) - follow_distance
	var speed_mult = dist/follow_distance
	
	parent.velocity = dir.normalized() * (move_speed * speed_mult)
	
	if get_pushed():
		return pushed_state

	parent.move_and_slide()

	return null

func exit() -> void:
	super()
	SignalBus.player_dashed.disconnect(_on_player_dashed)

func _on_player_dashed(direction: Vector2, speed: int):
	movement_controller.movement_direction = direction * -1
	movement_controller.is_pushed = true
