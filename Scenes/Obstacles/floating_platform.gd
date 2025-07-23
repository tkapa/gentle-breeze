extends StaticBody2D

@onready var flowerListener := $FlowerListener

func _ready():
	visible = false
	flowerListener.on_flower_active.connect(on_flower_active)

func on_flower_active():
	visible = true
