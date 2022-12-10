class_name Level
extends SGamePlayLevel

var bodies_outside = 2


func _on_VisibilityNotifier2D_screen_exited():
	bodies_outside += 1
	if bodies_outside == 2:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		level_complete()


func _on_VisibilityNotifier2D_screen_entered():
	bodies_outside -= 1
