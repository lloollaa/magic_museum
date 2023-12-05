extends Node2D

var selected = false
var rest_point
var rest_nodes = []


func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[3].global_position


func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else :
		global_position = lerp(global_position, rest_point, 10 * delta)
		
func _input(event):
	if event is InputEventMouseButton :
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 100
			for child in rest_nodes :
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					rest_point = child.global_position
					shortest_dist = distance
