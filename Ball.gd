extends KinematicBody2D

export (int) var speed
var velocity = Vector2()
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

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		print("collision!")
		velocity = velocity.bounce(collision_info.normal)
