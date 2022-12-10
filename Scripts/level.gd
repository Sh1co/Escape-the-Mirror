class_name Level
extends SGamePlayLevel

var bodies_outside = 0


func _on_FrameWithCol_area_entered(area):
	if ! area.is_in_group("Player"):
		return
	bodies_outside+=1
	
	if bodies_outside == 2:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		level_complete()


func _on_FrameWithCol_area_exited(area):
	if ! area.is_in_group("Player"):
		return
	bodies_outside-=1
