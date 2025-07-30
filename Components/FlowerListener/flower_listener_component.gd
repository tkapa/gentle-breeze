extends Node

signal on_flower_active
signal on_flower_inactive

@export var flower_id := 0

func _ready():
	SignalBus.flower_active.connect(_on_flower_active)
	SignalBus.flower_inactive.connect(_on_flower_inactive)
	
func _on_flower_active(flower_event_id: int):
	if flower_event_id == flower_id:
		on_flower_active.emit()

func _on_flower_inactive(flower_event_id: int):
	if flower_event_id == flower_id:
		on_flower_inactive.emit()
