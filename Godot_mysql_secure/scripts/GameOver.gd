extends CanvasLayer



func _ready():
	$Control._add_score()

func _on_Retry_pressed():
	get_tree().change_scene("res://scenes/ColorSelecterScreen.tscn")

func _on_Home_pressed():
	get_tree().change_scene("res://scenes/HomeScreen.tscn")
