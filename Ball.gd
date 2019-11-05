extends Area2D

export (int) var speed
var velocity = Vector2()
var window_size = Vector2(800, 600)
var ball_height
var ball_width

func _ready():
	var ball_texture = $Sprite.texture
	ball_height = ball_texture.get_height()
	ball_width = ball_texture.get_width()
	velocity.x = speed
	velocity.y = speed

func start(pos):
	set_process(true)
	velocity.x = speed
	velocity.y = speed
	# Global position of object in Vector2(x, y)
	position = pos

func die():
	queue_free ()
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	position.x = clamp(position.x, 0 + ball_width/2, window_size.x - ball_width/2)
	position.y = clamp(position.y, 0 + ball_height/2, window_size.y - ball_height/2)
	#todo: починить выход за экран

func bounce (type):
	if (type == VERTICAL):
		velocity.x *= (-1)
	if (type == HORIZONTAL):
		velocity.y *= (-1)

func _on_Hor_borders_area_entered(area):
	if area.is_in_group("balls"):
		area.bounce(HORIZONTAL)

func _on_Ver_borders_area_entered(area):
	if area.is_in_group("balls"):
		area.bounce(VERTICAL)

func _on_Board_area_entered(area):
	if area.is_in_group("balls"):
		area.bounce(HORIZONTAL)

