class_name Level
extends SGamePlayLevel

var bodies_outside = 0


func _ready():
	$Follower.connect("lost", self, "_level_lost")
	$Mirror.connect("lost", self, "_level_lost")


func _on_VisibilityNotifier2D_screen_exited():
	if ! $BSDelay.is_stopped():
		return
	bodies_outside += 1
	if bodies_outside == 2:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		level_complete()


func _on_VisibilityNotifier2D_screen_entered():
	if ! $BSDelay.is_stopped():
		return
	bodies_outside -= 1

func _level_lost():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$BSDelay.start()
	level_failed()
