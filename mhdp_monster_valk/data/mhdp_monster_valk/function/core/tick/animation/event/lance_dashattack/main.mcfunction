#> mhdp_monster_valk:core/tick/animation/event/lance_dashattack/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_dashattack.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/turn_start
    execute if score @s aj.lance_dashattack.frame matches 2..8 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_dashattack.frame matches 2..8 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_dashattack.frame matches 15..20 at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.lance_dashattack.frame matches 21..28 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.lance_dashattack.frame matches 29..35 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.lance_dashattack.frame matches 40..53 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.lance_dashattack.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    
    execute if score @s aj.lance_dashattack.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_dashattack.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.0 0.4
    execute if score @s aj.lance_dashattack.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_dashattack.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4

    execute if score @s aj.lance_dashattack.frame matches 15 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/sound
    
    execute if score @s aj.lance_dashattack.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_dashattack.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_dashattack.frame matches 21..26 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_dashattack.frame matches 21..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10

    execute if score @s aj.lance_dashattack.frame matches 43 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.lance_dashattack.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/attack
    execute if score @s aj.lance_dashattack.frame matches 21..28 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/attack_dash

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_dashattack.frame matches 59 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/end
