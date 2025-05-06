extends CanvasLayer

var next_scene_path

func _ready() -> void:
	ResourceLoader.load_threaded_request(next_scene_path)
	set_process(true)

func _process(_delta: float) -> void:
	if ResourceLoader.load_threaded_get_status(next_scene_path) == ResourceLoader.THREAD_LOAD_LOADED:
		var next_scene = ResourceLoader.load_threaded_get(next_scene_path)
		get_tree().change_scene_to_packed(next_scene)
		set_process(false)
