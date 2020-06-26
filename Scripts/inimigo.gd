extends KinematicBody2D

const GRAVITY = 10
const FLOOR = Vector2(0,-1)

var velocity = Vector2()
var direction = 1
var hp = 10

export(int) var speed = 30

func _ready():
    pass

func _physics_process(delta):
         velocity.x = speed * direction

         if direction == 1:
             $AnimatedSprite.flip_h = false
         else:
             $AnimatedSprite.flip_h = true

         $AnimatedSprite.play("walk")

         if get_slide_count() > 0:
             for i in range (get_slide_count()):
                 if "personagem" in get_slide_collision(i).collider.name:               
                     hp -= 5

         velocity = move_and_slide(velocity,FLOOR)

         if is_on_wall():
             direction = direction * -1
             $RayCast2D.position.x *= -1

         if $RayCast2D.is_colliding() == false:
             direction = direction * -1
             $RayCast2D.position.x *= -1

