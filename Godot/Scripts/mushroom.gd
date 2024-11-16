extends TextureButton

@export var mushroom = preload("res://Scenes/mushroom.tscn")
@export var line = preload("res://Scenes/Connection_Line.tscn")
@onready var connections = 0
@onready var mushroom_array = []
@onready var hover = false
@onready var d = 1.2
@onready var location_array = [Vector2(130*d, -75*d), Vector2(0, -150*d), Vector2(-130*d, 75*d), Vector2(130*d, 75*d), Vector2(0, 150*d), Vector2(-130*d, -75*d)]

func _ready():
	self.pressed.connect(self._button_pressed)
	location_array.shuffle()

func _button_pressed():
	Global.points += 1 * connections + 1
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Upgrade") and hover == true and len(location_array) > 0 and Global.points >= Global.cost:
		var obj = mushroom.instantiate()
		obj.position = location_array[0]
		location_array.remove_at(0)
		mushroom_array.append(obj)
		add_child(obj)
		connections += 1
		Global.points -= Global.cost
		Global.cost += 15
		var connection = line.instantiate()
		connection.add_point(obj.position)
		connection.add_point(self.position)
		add_child(connection)


func _on_mouse_entered() -> void:
	hover = true

func _on_mouse_exited() -> void:
	hover = false
