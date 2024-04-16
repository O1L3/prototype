extends Node2D

var Level1 = true
var Level2 = false
var Level2Score = 100
var Level3 = false
var Level3Score = 900
var Level4 = false
var Level4Score = 1800

var bossSpawn = true
var bossDead = true

onready var ui  = get_node("/root/Level/CanvasLayer/UI")

const enemypath = preload("res://scenes/Enemy.tscn")
const bosspath = preload("res://scenes/boss.tscn")
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
	ui.scoreVisible(true)

func _process(delta):
	$Player1.shipColor(colorState.color1)
	$Player2.shipColor(colorState.color2)
	if score >= Level2Score:
		Level1 = false
		Level2 = true
	if Level2:
		spawnBoss()
		if bossDead:
			waitWave1 = [1, 1.5]
		else:
			waitWave1 = [4.0, 5.0]
	
	if score >= Level3Score:
		Level2 = false
		Level3 = true
	if Level3:
		spawnBoss()
		if bossDead:
			waitWave1 = [0.5, 1.0]
		else:
			waitWave1 = [3.5, 4.0]
	
	if score >= Level4Score:
		Level3 = false
		Level4 = true
	if Level4:
		spawnBoss()
		$BossTimer.start()
		if bossDead:
			waitWave1 = [0.5, 0.5]
		else:
			waitWave1 = [3.0, 3.0]

func saveScore():
	if score > colorState.highscore:
		colorState.highscoreUpdate(score)

func scoreUpdate(scorePlus):
	score += scorePlus
	ui.setScore(score)

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
	if Level2:
		enemy.shootTime(2)


func spawnBoss():
	if bossSpawn:
		var boss = bosspath.instance()
		add_child(boss)
		boss.position = $bossSpawn.global_position 
		bossSpawn = false

func enemyDead():
	enemyCount -= 1

func bossDead():
	bossDead = true
	bossSpawn = true

func _on_EnemyTimer_timeout():
	if enemyCount< maxEnemyCount:
		spawnEnemy()
		enemyCount+=1
	$EnemyTimer.wait_time = rng.randf_range(waitWave1[0],waitWave1[1])
	$SpawnPosition.position.x = rngSpawn.randf_range(0.0,700.0)
	$EnemyTimer.start()


func _on_ScoreTimer_timeout():
	scoreUpdate(1)
	$ScoreTimer.start()



func _on_BossTimer_timeout():
	bossSpawn = true
	spawnBoss()
