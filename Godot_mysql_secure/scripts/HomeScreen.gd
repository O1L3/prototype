extends CanvasLayer

func _ready():
	$Control._get_player()
	$UI/scorebox.visible = false

func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/ColorSelecterScreen.tscn")

func _on_Shop_pressed():
	get_tree().change_scene("res://scenes/lootboxes.tscn")


func _on_Quit_pressed():
	get_tree().quit()
