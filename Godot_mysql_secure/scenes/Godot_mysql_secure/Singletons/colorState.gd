extends Node

var color1 
var color2

var highscore = 0

var playerName = ""

func highscoreUpdate(score):
	if score > highscore:
		highscore = score


func playerNameUpdate(Name):
	playerName=Name

func color1Change(color):
	color1 = color

func color2Change(color):
	color2 = color