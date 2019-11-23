extends KinematicBody2D

export (int) var speed = 350
var velocity = Vector2()
var window_size = Vector2(800, 600)
var board_height
var board_width

# Called when the node enters the scene tree for the first time.
func _ready():
	var board_texture = $Sprite.texture
	board_height = board_texture.get_height()*$Sprite.get_scale().y 
	board_width = board_texture.get_width()*$Sprite.get_scale().x

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		pass
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

func start(pos):
	set_process(true)
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 0, window_size.x)
	#todo: починить выход за экран
