extends Node

@export
var starting_state: SporeState

var current_state: SporeState

func init(
 parent: Spore,
 animations: AnimatedSprite2D,
 movement_controller: SporeMovementController,
 player_detection: PlayerDetectionComponent) -> void:
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.movement_controller = movement_controller
		child.player_detection_component = player_detection
	change_state(starting_state)

func change_state(new_state: SporeState) -> void:
	if current_state:
		current_state.exit();
	current_state = new_state
	current_state.enter()

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
