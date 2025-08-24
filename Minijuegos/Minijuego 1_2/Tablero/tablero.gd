extends Area2D

var tiles = []
var solved = []
var mouse
signal puzzle_solved

func start_game():
	shuffle_tiles()

func _ready():
	tiles = [$Tile1, $Tile2, $Tile3, $Tile4, $Tile5, $Tile6, $Tile7, $Tile8, $Tile9]
	solved = tiles.duplicate()
	var i := 9
	var rng:RandomNumberGenerator
	randomize()
	var random_num = randi_range(1,5)
	for num in range(0, 8):
		tiles[num].texture = load("res://Minijuegos/Minijuego 1_2/Arte/M"+str(random_num)+"/"+str(i)+".png")
		i -= 1
	$Refe.texture = load("res://Minijuegos/Minijuego 1_2/Arte/M"+str(random_num)+"/m"+str(random_num)+".png")
	start_game()

func shuffle_tiles():
	var previous = 99
	var previous_1 = 98
	for t in range(0,50):
		var tile = randi() % 9
		if tiles[tile] != $Tile9 and tile != previous and tile != previous_1:
			var rows = int(tiles[tile].position.y / 128)
			var cols = int(tiles[tile].position.x / 128)
			check_neighbours(rows,cols)
			previous_1 = previous
			previous = tile
	if tiles == solved:
		shuffle_tiles()

func _process(delta):
	if tiles == solved:
		$CollisionShape2D.disabled = false
		await get_tree().create_timer(1).timeout
		emit_signal("puzzle_solved")
		queue_free()
		
	if Input.is_action_just_pressed("Left_click") and mouse:
		var mouse_copy = mouse
		print(mouse.position)
		mouse = false
		var rows = int(mouse_copy.position.y /128)
		var cols = int(mouse_copy.position.x /128)
		check_neighbours(rows, cols)
	

func check_neighbours(rows, cols):
	var empty = false
	var done = false
	var pos = rows*3 + cols
	while !empty and !done:
		var new_pos = tiles[pos].position
		if rows < 2:
			new_pos.y += 128
			empty = find_empty(new_pos, pos)
			new_pos.y -= 128
		if rows > 0:
			new_pos.y -= 128
			empty = find_empty(new_pos, pos)
			new_pos.y += 128
		if cols < 2:
			new_pos.x += 128
			empty = find_empty(new_pos, pos)
			new_pos.x -= 128
		if cols > 0:
			new_pos.x -= 128
			empty = find_empty(new_pos, pos)
			new_pos.x += 128
		done = true
		
func find_empty(position, pos):
	var new_rows = int(position.y /128)
	var new_cols = int(position.x /128)
	var new_pos = new_rows*3 + new_cols
	if tiles[new_pos] == $Tile9:
		swap_tiles(pos, new_pos)
		return true
	else:
		return false

func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos
	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouse:
		mouse = event
