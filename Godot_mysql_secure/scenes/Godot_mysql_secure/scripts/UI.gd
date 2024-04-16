extends Control

func scoreVisible(i):
	if i:
		$Score.visible = true
	else:
		$Score.visible = true

func setScore(score):
	$Score.text = "Score: " + str(score)


func _process(delta):
	$Highscore.text = "Highscore: " + str(colorState.highscore)
