extends TextureButton

@export var mushroom = preload("res://Scenes/mushroom.tscn")
@export var line = preload("res://Scenes/Connection_Line.tscn")
@export var young_big = preload("res://Assets/Mushrooms/Baby_large.png")
@export var young_small = preload("res://Assets/Mushrooms/Baby_small.png")
@export var b_middle_big = preload("res://Assets/Mushrooms/bob_junior_big.png")
@export var b_middle_small = preload("res://Assets/Mushrooms/bob_junior_small.png")
@export var b_old_big = preload("res://Assets/Mushrooms/bob_large.png")
@export var b_old_small = preload("res://Assets/Mushrooms/Bob_small.png")
@export var k_middle_big = preload("res://Assets/Mushrooms/Karl_junior_large.png")
@export var k_middle_small = preload("res://Assets/Mushrooms/Karl_junior_small.png")
@export var k_old_big = preload("res://Assets/Mushrooms/Karl_large.png")
@export var k_old_small = preload("res://Assets/Mushrooms/Karl_small.png")
@export var d_middle_big = preload("res://Assets/Mushrooms/Dave_junior_large.png")
@export var d_middle_small = preload("res://Assets/Mushrooms/Dave_junior_small.png")
@export var d_old_big = preload("res://Assets/Mushrooms/Dave_large.png")
@export var d_old_small = preload("res://Assets/Mushrooms/Dave_small.png")
@onready var connections = 0
@onready var mushroom_array = []
@onready var hover = false
@onready var d = 1.2
@onready var location_array = [Vector2(130*d, -75*d), Vector2(0, -150*d), Vector2(-130*d, 75*d), Vector2(130*d, 75*d), Vector2(0, 150*d), Vector2(-130*d, -75*d)]
@onready var middle_big = k_middle_big
@onready var middle_small
@onready var old_big
@onready var old_small
@onready var num = randi() % 3
@onready var timer = 0


func _ready():
	self.pressed.connect(self._button_pressed)
	location_array.shuffle()
	texture_normal = young_big
	texture_pressed = young_small
	if num == 1:
		middle_big = b_middle_big
		middle_small = b_middle_small
		old_big = b_old_big
		old_small = b_old_small
	elif num == 2:
		middle_big = k_middle_big
		middle_small = k_middle_small
		old_big = k_old_big
		old_small = k_old_small
	else:
		middle_big = d_middle_big
		middle_small = d_middle_small
		old_big = d_old_big
		old_small = d_old_small

func _button_pressed():
	Global.points += 1 * (connections + 1)

func _process(delta: float) -> void:
	timer += delta
	if int(timer) % 2 == 0:
		timer += 1
		Global.points += connections

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
		connection.leaf_node_name = obj.get_instance_id()
		add_child(connection)
		Global.connections_no += 1

	if connections > 1:
		texture_normal = middle_big
		texture_pressed = middle_small
	if connections > 4:
		texture_normal = old_big
		texture_pressed = old_small

func _on_mouse_entered() -> void:
	hover = true

func _on_mouse_exited() -> void:
	hover = false
