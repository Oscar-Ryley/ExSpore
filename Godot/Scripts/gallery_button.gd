extends Button

@onready var gallery_scene = preload("res://Scenes/gallery.tscn")

func _on_pressed() -> void:
	var obj = gallery_scene.instantiate()
	obj.position -= Vector2(1600, 0)
	add_child(obj)
