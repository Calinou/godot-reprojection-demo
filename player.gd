extends Spatial

const MOUSE_SENSITIVITY = 0.001



func _ready():
	get_tree().root.connect("size_changed", self, "_size_changed")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# Quad is hidden in the editor to avoid hindering visibility.
	get_node("../Yaw/Pitch/Quad").visible = true


func _input(event):
	if event is InputEventMouseMotion:
		get_node("%Yaw").rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		get_node("%Camera").rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		get_node("../Yaw").rotation.y -= -event.relative.x * MOUSE_SENSITIVITY
		get_node("../Yaw/Pitch").rotation.x -= -event.relative.y * MOUSE_SENSITIVITY

func _on_RedrawTimer_timeout():
	# Update mode needs to be set again before calling `force_draw()`, even if it didn't change.
	$Viewport.render_target_update_mode = Viewport.UPDATE_ONCE
	VisualServer.force_draw()

	get_node("../Yaw").rotation.y = 0.0
	get_node("../Yaw/Pitch").rotation.x = 0.0

func _size_changed():
	get_node("%Viewport").size = OS.window_size
