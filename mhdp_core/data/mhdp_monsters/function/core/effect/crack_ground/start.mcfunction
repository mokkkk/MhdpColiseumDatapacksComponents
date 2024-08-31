#> mhdp_monsters:core/effect/crack_ground/start
#
# 汎用処理 地割れ 開始
#
# @within function mhdp_monsters:/**

# 演出
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^1 ^ 0.8 0.1 0.8 0.2 35 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^1 ^ 0.4 0.1 0.4 0.4 35 normal

# 召喚
    summon block_display ^1 ^-1.2 ^1.1 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.A","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-1.1 ^-1.2 ^1 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.B","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^1 ^-1.2 ^-1.1 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.C","Start"],block_state:{Name:"minecraft:sandstone"}}
    summon block_display ^-1.1 ^-1.2 ^-1 {start_interpolation:-1,interpolation_duration:3,brightness:{sky:15,block:15},Tags:["Effect.General","Effect.CrackGround","Effect.CrackGround.D","Start"],block_state:{Name:"minecraft:sandstone"}}

# 角度設定
    execute as @e[type=block_display,tag=Effect.CrackGround,tag=Start] positioned as @s run tp @s ~ ~ ~ ~ 0
    execute as @e[type=block_display,tag=Effect.CrackGround.B,tag=Start] at @s run data modify entity @s transformation set value [1.2042f,-1.0496f,0.7546f,0.0000f,0.7581f,1.9688f,0.2022f,0.0000f,-0.7848f,0.2912f,1.3532f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.A,tag=Start] at @s run data modify entity @s transformation set value [0.7848f,-0.2912f,-1.3532f,-0.5000f,-0.6638f,1.8934f,-0.5524f,0.5625f,1.2586f,1.1802f,0.5524f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.C,tag=Start] at @s run data modify entity @s transformation set value [1.2042f,-1.0496f,0.7546f,0.0000f,0.7581f,1.9688f,0.2022f,0.0000f,-0.7848f,0.2912f,1.3532f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f]
    execute as @e[type=block_display,tag=Effect.CrackGround.D,tag=Start] at @s run data modify entity @s transformation set value [-0.1231f,-0.3235f,-1.5417f,-0.5000f,-1.0156f,1.7503f,-0.1021f,0.5625f,1.2625f,1.3764f,-0.2325f,0.5625f,0.0000f,0.0000f,0.0000f,1.0000f]
    # execute as @e[type=block_display,tag=Effect.CrackGround.A,tag=Start] at @s run data modify entity @s transformation.scale set value [1.15f,1.2f,1.15f]
    # execute as @e[type=block_display,tag=Effect.CrackGround.B,tag=Start] at @s run data modify entity @s transformation.scale set value [1.15f,1.2f,1.15f]
    # execute as @e[type=block_display,tag=Effect.CrackGround.C,tag=Start] at @s run data modify entity @s transformation.scale set value [1.15f,1.2f,1.15f]
    # execute as @e[type=block_display,tag=Effect.CrackGround.D,tag=Start] at @s run data modify entity @s transformation.scale set value [1.15f,1.2f,1.15f]

# 終了
    tag @e[type=block_display,tag=Effect.CrackGround,tag=Start] remove Start
