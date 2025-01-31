class_name SpeedItem extends Item

@export var speed_up := 100.0

func use(player: Player) -> void:
	player.speed += speed_up
