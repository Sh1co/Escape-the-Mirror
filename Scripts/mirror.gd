extends Follower

export(NodePath) var follower_path

var follower = null
var follower_og_pos = Vector2.ZERO

func _ready():
	._ready()
	if follower_path == null:
		push_warning("Mirror not connect to follower!")
		return
	follower = get_node(follower_path)
	follower_og_pos = follower.position
	following = true
	
func reset():
	.reset()
	follower.reset()
	follower_og_pos = follower.position
	following=true

func _follow():
	var diff = follower.position - follower_og_pos
	position = position - diff
	follower_og_pos = follower.position

func _on_Follower_mouse_entered():
	pass
