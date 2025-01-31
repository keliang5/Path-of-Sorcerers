class_name Pickups extends Area2D

@export var item: Item = null
@onready var sprite: Sprite2D = %Sprite2D


func ready() -> void:
	sprite.texture = item.Display_image
	body_entered.connect(func(body: Node) -> void:
		if body is Player:
			item.use(body)
			queue_free()
)
