extends Node3D

@onready var grid_ground = $Ground/GridMap
@onready var items_group = $Items

#func _ready() -> void:
	#spawn_item()
	
func spawn_item():
	var grid_cells = grid_ground.get_used_cells();
	var available_position = []
	
	for cell in grid_cells:
		var cell_position = grid_ground.map_to_local(cell)
		available_position.append(cell_position)
	
	# Spawn item in Random places
	var randam_index = randi() % available_position.size()
	var spawn_position = available_position[randam_index]
	
	var power_type = Global.POWERS_TYPES[randi() % Global.POWERS_TYPES.size()]
	var item = preload("res://scenes/item.tscn").instantiate()
	item.position = spawn_position + Vector3(0,0.75,0)
	item.power_type = power_type
	item.get_node("MeshInstance3D").material_override = StandardMaterial3D.new()
	item.get_node("MeshInstance3D").material_override.albedo_color = Global.POWERS_CATECAGRIES[power_type]
	items_group.add_child(item)
	Global.SPAWNED_ITEMS += 1

func _on_timer_timeout() -> void:
	if(items_group.get_child_count()<=5):
		spawn_item()
