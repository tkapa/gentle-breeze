extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default", 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
