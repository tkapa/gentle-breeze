extends TileMapLayer

@onready var flowerListener := $FlowerListener

func _ready():
	_set_enabled(false)
	flowerListener.on_flower_active.connect(on_flower_active)

func on_flower_active():
	_set_enabled(true)

func _set_enabled(is_enabled: bool):
	set_deferred("enabled", is_enabled)
