extends Area3D

func _on_body_entered(_body: Node3D) -> void:
	if(Global.SPAWNED_ITEMS!=0):
		Global.SPAWNED_ITEMS -= 1
		queue_free()
