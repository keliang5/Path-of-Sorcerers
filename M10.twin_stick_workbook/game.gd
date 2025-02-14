extends Node2D


@onready var teleporter: Area2D = $Teleporter
@onready var end_menu: PanelContainer = $CanvasLayer/EndMenu

func _ready() -> void:
	teleporter.body_entered.connect(func (body:Node) -> void:
		if body is Player:
			end_menu.open()
	)
