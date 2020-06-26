extends Camera2D

func _process(delta):
    var pos = get_node("../personagem").global_position - Vector2(0,16)
    var x = floor(pos.x / 840) * 840
    var y = floor(pos.y / 420) * 420
    global_position = Vector2(x,y)











