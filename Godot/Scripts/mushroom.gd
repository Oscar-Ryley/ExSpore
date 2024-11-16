extends TextureButton

func _ready():
	self.pressed.connect(self._button_pressed)

@export var mushroom = preload("res://Scenes/mushroom.tscn")
@onready var connections = 0
@onready var mushroom_array = []
@onready var hover = false
@onready var location_array = [Vector2(150, 150), Vector2(-150, -150), Vector2(-150, 150), Vector2(150, -150), Vector2(150, 0), Vector2(0, 150)]

func _button_pressed():
	Global.points += 1 * connections + 1
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Upgrade") and hover == true and len(location_array) > 0:
		var obj = mushroom.instantiate()
		obj.position = location_array[0]
		location_array.remove_at(0)
		mushroom_array.append(obj)
		add_child(obj)
		connections += 1

func _on_mouse_entered() -> void:
	hover = true

func _on_mouse_exited() -> void:
	hover = false
