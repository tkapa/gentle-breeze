class_name Spore
extends CharacterBody2D

@onready 
var animations := $AnimatedSprite2D
@onready
var state_machine = $StateMachine
@onready
var movement_controller = $SporeMovementController
@onready
var player_detection: PlayerDetectionComponent = $PlayerDetectionComponent

@export var move_speed := 100
@export var follow_distance := 50

var player: Player

func _ready():
	player_detection.on_player_entered.connect(_on_player_entered)
	$AnimatedSprite2D.play("default", 0.5)
	state_machine.init(self, animations, movement_controller, player_detection)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_player_entered(player_body: Player):
	player = player_body
	player_detection.on_player_entered.disconnect(_on_player_entered)
	
