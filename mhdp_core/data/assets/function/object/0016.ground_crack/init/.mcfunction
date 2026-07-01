#> assets:object/0016.ground_crack/init/
#
# オブジェクト初期化処理

# 角度ランダム設定
    tp @s ~ ~-3 ~
    execute store result entity @s Rotation[0] float 1 run random value -180..180

# 召喚
    summon block_display ^1.2 ^-1.2 ^1.3 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.A","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-1.1 ^-1.2 ^1.2 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.B","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^1.2 ^-1.2 ^-1.3 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.C","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-1.1 ^-1.2 ^-1.2 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.D","Start"],block_state:{Name:"minecraft:sandstone"}}

# 自身に乗せる
    execute as @e[type=block_display,tag=Effect.CrackGround,tag=Start,distance=..10] run ride @s mount @n[type=item_display,tag=This]

# 角度設定
    execute rotated as @s on passengers run rotate @s ~ 0
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.A,tag=Start] at @s run data modify entity @s transformation set value [0.7848f,-0.2912f,-1.3532f,-0.5000f,-0.6638f,1.8934f,-0.5524f,0.5625f,1.2586f,1.1802f,0.5524f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.B,tag=Start] at @s run data modify entity @s transformation set value [1.2042f,-1.0496f,0.7546f,0.0000f,0.7581f,1.9688f,0.2022f,0.0000f,-0.7848f,0.2912f,1.3532f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.C,tag=Start] at @s run data modify entity @s transformation set value [1.2042f,-1.0496f,0.7546f,0.0000f,0.7581f,1.9688f,0.2022f,0.0000f,-0.7848f,0.2912f,1.3532f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.D,tag=Start] at @s run data modify entity @s transformation set value [-0.1231f,-0.3235f,-1.5417f,-0.5000f,-1.0156f,1.7503f,-0.1021f,0.5625f,1.2625f,1.3764f,-0.2325f,0.5625f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.A,tag=Start] at @s run data modify entity @s transformation.translation set value [1.2f,-1.2f,1.3f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.B,tag=Start] at @s run data modify entity @s transformation.translation set value [-1.1f,-1.2f,1.2f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.C,tag=Start] at @s run data modify entity @s transformation.translation set value [1.2f,-1.2f,-1.3f]
    execute on passengers if entity @s[type=block_display,tag=Effect.CrackGround.D,tag=Start] at @s run data modify entity @s transformation.translation set value [-1.1f,-1.2f,-1.2f]

# 終了
    execute on passengers run tag @s remove Start
