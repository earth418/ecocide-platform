extends Node3D

@export
var start_position_x := 0.0 #-2000# 000.0

@export
var start_position_y := 0.0 #3448 #000.0

@export
var tile_size_meters := 300.0
var new_tile_size = tile_size_meters

@export
var tile_size_pixels := 1000

@export
var heightmap_data_path: String = ""

@export
var ortho_data_path: String

var objects : Array[Node3D] = []

func switch_display(new_display):
	
	if new_display == 0:
		objects.map(func(obj : Node3D): obj.hide)
		objects[new_display].show()
	
#func highlight(new_highlight):
	#var highlight = 0
	#match(new_highlight):
		#0: 
			#highlight = 0

var zooming_in = -1
var scale_rate = -1
var current_scale = 1
var move_rate = Vector2(0.0, 0.0)
var elapsed_since_last = 0
var done = false

func _process(delta: float) -> void:
	#elapsed_since_last += delta
	#if elapsed_since_last > 0.5:
		#elapsed_since_last = 0.0
	zooming_in -= delta
	if zooming_in >= 0:
		current_scale -= scale_rate * delta
		new_tile_size = current_scale # * tile_size_meters
		start_position_x += move_rate.x * delta
		start_position_y += move_rate.y * delta
		print(new_tile_size)
		load_images()
		done = true
	if zooming_in <= -1 && done:
		#switch_display(1)
		$map.hide()
		$dam.show()

func zoom_in(how_much, where, over_how_long):
	zooming_in = over_how_long
	current_scale = tile_size_meters
	scale_rate = (tile_size_meters - tile_size_meters / how_much) / over_how_long
	move_rate = Vector2(start_position_x, start_position_y) - where
	
func _ready():
	#objects = [get_node("map"), get_node("dam")]
	#switch_display(0)
	load_images()
	zoom_in(10, Vector2(-30, 23), 5)
	
func load_images():

	var img = Geodot.get_raster_layer(heightmap_data_path).get_image(
		start_position_x,
		start_position_y,
		new_tile_size,
		tile_size_pixels,
		GeoImage.BILINEAR
	)
	var ortho = Geodot.get_raster_layer(ortho_data_path).get_image(
		start_position_x * 4,
		start_position_y * 4,
		new_tile_size * 4,
		tile_size_pixels,
		GeoImage.NEAREST
	)
	
	print("Loading images!")
	get_node("map").mesh.surface_get_material(0).set_shader_parameter("heightmap", img.get_image_texture())
	get_node("map").mesh.surface_get_material(0).set_shader_parameter("ortho", ortho.get_image_texture())
	
	
	#print("Success!")
