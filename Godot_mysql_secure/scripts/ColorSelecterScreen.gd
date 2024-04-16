extends Node2D




func _on_Player1Orange_pressed():
	colorState.color1Change("Orange")


func _on_Player2Purple_pressed():
	colorState.color2Change("Purple") 


func _on_Start_pressed():
	get_tree().change_scene("res://scenes/Level.tscn")


func _on_Player2Orange_pressed():
	colorState.color2Change("Orange")

func _on_Player1Purple_pressed():
	colorState.color1Change("Purple") 


func _on_Player1Green_pressed():
	colorState.color1Change("Green") 


func _on_Player2Green_pressed():
	colorState.color2Change("Green") 


func _on_Player2Pink_pressed():
	colorState.color2Change("Pink") 


func _on_Player1Pink_pressed():
	colorState.color1Change("Pink") 
