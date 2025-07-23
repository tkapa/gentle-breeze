class_name Flower
extends StaticBody2D

enum FlowerState {INACTIVE, ACTIVE = 1}

const INACTIVE_ANIMATION := 'default'
const ACTIVE_ANIMATION := 'active'

@export var flower_id := 0

@onready var animation := $AnimatedSprite2D

var _currentState := FlowerState.INACTIVE

func activate():
	_currentState = FlowerState.ACTIVE
	animation.play(ACTIVE_ANIMATION)
	SignalBus.flower_active.emit(flower_id)
	print_debug("Activated")
