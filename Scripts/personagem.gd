extends KinematicBody2D

const SPEED = 200
const GRAVITY = 13
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

var hp = 99
var velocity = Vector2()
var on_ground = false


func _physics_process(delta):

        #Movimentação do personagem
        if Input.is_action_pressed("ui_right"):
              velocity.x = SPEED
              $AnimatedSprite.play("run")
              $AnimatedSprite.flip_h = false
              
        elif Input.is_action_pressed("ui_left"):
              velocity.x = -SPEED
              $AnimatedSprite.play("run")
              $AnimatedSprite.flip_h = true

        else: 
            velocity.x = 0              
            $AnimatedSprite.play("igle")

        #pulo
        if Input.is_action_pressed("ui_up"):
            if on_ground == true:
                velocity.y = JUMP_POWER
                on_ground = false 
                $AnimatedSprite.play("jump") 

        #elif Input.is_action_pressed("ui_down"):  #planar
              #if on_ground == false:
                  #velocity.y = JUMP_POWER
                  #on_ground = false
                  #$AnimatedSprite.play("down")  
   
        if get_slide_count() > 0:
            for i in range(get_slide_count()):
                if "inimigo1" in get_slide_collision(i).collider.name:
                    hp -= 5                  

        velocity.y += GRAVITY

        #para fazer animação do personagem caindo 
        if is_on_floor():
            on_ground = true
        else:
            on_ground = false      
            $AnimatedSprite.play("fall")

        velocity = move_and_slide(velocity, FLOOR)

        





