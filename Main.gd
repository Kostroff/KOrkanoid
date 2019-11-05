extends Node2D

onready var brick_scene = preload("res://Brick.tscn")
var player_score
var window_size = Vector2(800, 600)

func _ready():
	player_score = 0;
	
	# generate field of bricks
	# todo: make resizeble window
	var brick_instance = brick_scene.instance()
	var brick_height = brick_instance._get_height()
	var brick_width = brick_instance._get_width()
	# make it in the center
	var x_gap_min = brick_width/10
	var num_in_row = int((window_size.x + x_gap_min)/(brick_width + x_gap_min))
	var it_first = (window_size.x - brick_width*num_in_row + x_gap_min*(num_in_row-1))/2
	
	for y in range(brick_height/2, window_size.y/2, brick_height+brick_height/10):
		for x in range(it_first, window_size.x-x_gap_min, x_gap_min+brick_width):
			var brick = brick_scene.instance()
			brick._set_pos(Vector2(x,y))
			add_child(brick)