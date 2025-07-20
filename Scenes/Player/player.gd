class_name Player
extends CharacterBody2D

@onready 
var animations := $AnimatedSprite2D
@onready
var state_machine = $state_machine
@onready 
var movement_controller := $movement_controller

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.init(self, animations, movement_controller)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
