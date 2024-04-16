extends CanvasLayer



func _ready():
	$Control._add_score()




func _on_TryAgain_pressed():
	get_tree().change_scene("res://scenes/ColorSelecterScreen.tscn")


func _on_HomeScreen_pressed():
	get_tree().change_scene("res://scenes/HomeScreen.tscn")
