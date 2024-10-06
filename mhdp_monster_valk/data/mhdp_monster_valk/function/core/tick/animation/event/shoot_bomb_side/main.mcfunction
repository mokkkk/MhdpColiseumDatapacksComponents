#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/main
#
# アニメーションイベントハンドラ 側面爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.shoot_bomb_side.frame matches 48..58 at @s run tp @s ^ ^ ^-0.7

# 効果音
    execute if score @s aj.shoot_bomb_side.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_bomb_side.frame matches 7 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_bomb_side.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_bomb_side.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_bomb_side.frame matches 15..17 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_bomb_side.frame matches 15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_bomb_side.frame matches 15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_bomb_side.frame matches 55 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_bomb_side.frame matches 55 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 演出
    execute if score @s aj.shoot_bomb_side.frame matches 8 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/thunder
    execute if score @s aj.shoot_bomb_side.frame matches 3..44 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/particle
    execute if score @s aj.shoot_bomb_side.frame matches 45 run summon text_display ^6 ^-1 ^2 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.shoot_bomb_side.frame matches 45 run summon text_display ^-6 ^-1 ^2 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.shoot_bomb_side.frame matches 45 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]

# 攻撃
    execute if score @s aj.shoot_bomb_side.frame matches 45 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/attack

# モデル演出
    execute if score @s aj.shoot_bomb_side.frame matches 6 run function mhdp_monster_valk:core/util/models/ignite_start
    execute if score @s aj.shoot_bomb_side.frame matches 48 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_bomb_side.frame matches 82 run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/end
