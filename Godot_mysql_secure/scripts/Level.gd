extends Node2D
const enemypath = preload("res://scenes/Enemy.tscn")
var score = 0
var waitWave1 = [2.0, 4.0]

var enemyCount = 0
var maxEnemyCount = 10
var rng = RandomNumberGenerator.new()
var rngSpawn = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	rngSpawn.randomize()
	$SpawnPosition.position.x = rngSpawn.randf_range(0.0,700.0)
	$EnemyTimer.wait_time = rng.randf_range(2.0, 3.0)
	$EnemyTimer.start()

func _process(delta):
	$Player1.shipColor(colorState.color1)
	$Player2.shipColor(colorState.color2)

func scoreUpdate(scorePlus):
	score += scorePlus
	print(score)

func shipColorChoice(color):
	
	if color == "Orange1":
		$Player1.color("Orange")
	if color == "Purple1":
		$Player1.color("Purple")
	if color == "Orange2":
		$Player2.color("Orange")
	if color == "Purple2":
		$Player2.color("Purple")

func spawnEnemy():
	var enemy = enemypath.instance()
	
	add_child(enemy)
	enemy.position = $SpawnPosition.global_position
	print(enemy)

func enemyDead():
	enemyCount -= 1

func _on_EnemyTimer_timeout():
	if enemyCount< maxEnemyCount:
		spawnEnemy()
		enemyCount+=1
	$EnemyTimer.wait_time = rng.randf_range(waitWave1[0],waitWave1[1])
	$SpawnPosition.position.x = rngSpawn.randf_range(0.0,700.0)
	$EnemyTimer.start()


func _on_ScoreTimer_timeout():
	score+=1
	$ScoreTimer.start()

