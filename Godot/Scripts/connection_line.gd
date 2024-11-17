extends Line2D

@onready var leaf_node_name

func _process(delta: float) -> void:
	points[0] = instance_from_id(leaf_node_name).position
