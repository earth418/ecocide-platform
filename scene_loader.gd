extends Node3D

@export
var start_position_x := 0.0 #-2000# 000.0

@export
var start_position_y := 0.0 #3448 #000.0

@export
var tile_size_meters := 1000.0

@export
var tile_size_pixels := 1000

@export
var heightmap_data_path: String = ""

@export
var ortho_data_path: String


func _ready():
	
	print("Trying...")
	
	var img = Geodot.get_raster_layer(heightmap_data_path).get_image(
		start_position_x,
		start_position_y,
		tile_size_meters,
		tile_size_pixels,
		GeoImage.BILINEAR
	)
	var ortho = Geodot.get_raster_layer(ortho_data_path).get_image(
		start_position_x,
		start_position_y,
		tile_size_meters,
		tile_size_pixels * 4,
		GeoImage.NEAREST
	)
	
	print("min:", img.MIN)
	print("max:", img.MAX)
	
	get_node("MeshInstance3D").mesh.surface_get_material(0).set_shader_parameter("heightmap", img.get_image_texture())
	get_node("MeshInstance3D").mesh.surface_get_material(0).set_shader_parameter("ortho", ortho.get_image_texture())
	
	
	#print("Success!")
