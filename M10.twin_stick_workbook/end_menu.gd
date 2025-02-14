extends PanelContainer
	
var _start_time := Time.get_ticks_msec()


@onready var time: Label = %Time

func open() -> void:
	visible = true
	get_tree().paused = true

	var end_time := Time.get_ticks_msec()
	var total_time_msec := end_time - _start_time
	var total_time_s := snappedf(total_time_msec / 1000.0, 0.1)
	time.text = "Time: " + str(total_time_s) + "s"
