extends CanvasLayer

var rng = RandomNumberGenerator.new()
var randomNum = rng.randf_range(0.0,2.0)

func _ready():
	$UI/scorebox.visible = false

func buyLoot():
	colorState.spaceBucks -= 100
	if colorState.pinkUnlocked and colorState.greenUnlocked:
		colorState.spaceBucks += 100
	elif colorState.pinkUnlocked:
		reward("Green")
	elif colorState.greenUnlocked:
		reward("Pink")
	else:
		rng.randomize()
		if randomNum >1:
			reward("Green")
		elif randomNum <=1:
			reward("Pink")

func reward(color):
	colorState.skinUnlocked(color)
	if color == "Green":
		$Green.visible = true
	else:
		$Green.visible = false
	if color == "Pink":
		$Pink.visible = true
	else:
		$Pink.visible = false

func _on_TextureButton_pressed():
	if colorState.spaceBucks >= 100:
		buyLoot()
	else:
		print("You don't have enough money")


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/HomeScreen.tscn")
