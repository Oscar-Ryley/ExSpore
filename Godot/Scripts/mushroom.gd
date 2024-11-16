extends TextureButton

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	Global.points += 1
