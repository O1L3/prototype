extends CanvasLayer

func _ready():
	$Control._get_player()


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/ColorSelecterScreen.tscn")
