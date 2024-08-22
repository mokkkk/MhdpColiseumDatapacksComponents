#> mhdp_monsters:core/effect/crack_ground/start
#
# 汎用処理 地割れ 開始
#
# @within function mhdp_monsters:/**

# 召喚
    summon block_display ^0.5 ^ ^0.5 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.A","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-0.5 ^ ^0.5 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.B","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^0.5 ^ ^-0.5 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.C","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-0.5 ^ ^-0.5 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.D","Start"],block_state:{Name:"minecraft:sandstone"}}

# 角度設定
    execute as @e[type=block_display,tag=Effect.CrackGround,tag=Start] positioned as @s run tp @s ~ ~ ~ ~ 0
    execute as @e[type=block_display,tag=Effect.CrackGround.A,tag=Start] at @s run data modify entity @s transformation set value [0.9330f,-0.2500f,0.2588f,0.0000f,0.2588f,0.9659f,0.0000f,0.3125f,-0.2500f,0.0670f,0.9659f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.B,tag=Start] at @s run data modify entity @s transformation set value [0.8365f,0.4830f,0.2588f,-0.8750f,-0.5000f,0.8660f,0.0000f,0.6250f,-0.2241f,-0.1294f,0.9659f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.C,tag=Start] at @s run data modify entity @s transformation set value [0.9330f,-0.2500f,0.2588f,0.0000f,0.2588f,0.9659f,0.0000f,0.3125f,-0.2500f,0.0670f,0.9659f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.D,tag=Start] at @s run data modify entity @s transformation set value [0.7500f,0.4330f,-0.5000f,-0.8750f,-0.5000f,0.8660f,0.0000f,0.6250f,0.4330f,0.2500f,0.8660f,-0.4375f,0.0000f,0.0000f,0.0000f,1.0000f]

# 終了
    tag @e[type=block_display,tag=Effect.CrackGround,tag=Start] remove Start
