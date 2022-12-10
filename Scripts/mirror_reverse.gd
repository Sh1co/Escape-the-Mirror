extends Area2D

func _on_MirrorReverse_area_entered(area):
	if ! area.is_in_group("Mirror"):
		return
	area.reverse_mirror()
	self.queue_free()
