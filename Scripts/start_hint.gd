extends Control


onready var tween = $Tween


func _ready():
	flashing_effect()


func flashing_effect():
	tween.interpolate_property(self, "modulate:a", 0, 1, 2)
	tween.start()
	yield(tween, "tween_completed")
	while true:
		tween.interpolate_property(self, "modulate:a", 1, 0.3, 1)
		tween.start()
		yield(tween, "tween_completed")
		tween.interpolate_property(self, "modulate:a", 0.3, 1, 1)
		tween.start()
		yield(tween, "tween_completed")
