extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	escoria.main.current_scene.game.hide_ui()
	escoria.main.current_scene.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
