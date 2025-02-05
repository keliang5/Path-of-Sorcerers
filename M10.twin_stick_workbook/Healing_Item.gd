class_name HealingItem extends Item

@export var heal = 1

func use(player: Player) -> void:
	player.health += heal
