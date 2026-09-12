extends CanvasLayer

var player1_score = 0
var player2_score = 0
@onready var player_1 = $Player1
@onready var player_2 = $Player2

func add_point1():
	player1_score += 1
	player_1.text = str(player1_score)

func add_point2():
	player2_score += 1
	player_2.text = str(player2_score)
