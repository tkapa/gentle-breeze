class_name Player
extends CharacterBody2D

@onready 
var animations := $AnimatedSprite2D
@onready
var state_machine = $StateMachine
@onready 
var movement_controller := $MovementController

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.init(self, animations, movement_controller)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	if is_on_floor():
		movement_controller.reset_dash()
		movement_controller.reset_jump()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
