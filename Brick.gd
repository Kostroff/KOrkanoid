extends Area2D

func _get_height():
	return $Sprite.texture.get_height()*$Sprite.get_scale().y

func _get_width():
	return $Sprite.texture.get_width()*$Sprite.get_scale().x

func _set_pos(pos):
	position = pos
