extends TextureProgress

func _ready():
    pass

func _physics_process(delta):
    value = get_tree().root.get_node("stage1").get_node("personagem").hp