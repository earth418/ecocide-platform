class_name MainTree extends	 Tree

func _ready() -> void:
	
	
	
	var root = create_item()
	hide_root = true
	
	var i1 = create_item(root)
	i1.set_text(0, " 1 Kakhova Dam Destruction")
	
	var i1_1 = create_item(i1)
	i1_1.set_text(0, " 01 Armed Forces")
	var i1_2 = create_item(i1)
	i1_2.set_text(0, " 02 Photo")

	var i2 = create_item(root)
	i2.set_text(0, " 2 Flood & Reservoir")
	
	var i3 = create_item(root)
	i3.set_text(0, " 3 Marine Environment")
	
	var i4 = create_item(root)
	i4.set_text(0, " 4 Agriculture")

	for i in i1.get_children():
		i.set_text(0, i.get_text(0) + " (2)")
