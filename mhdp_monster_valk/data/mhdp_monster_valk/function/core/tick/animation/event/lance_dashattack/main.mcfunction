#> mhdp_monster_valk:core/tick/animation/event/lance_dashattack/main
#
# アニメーションイベントハンドラ 突進(体当たり)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_dashattack.frame matches 2..6 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.lance_dashattack.frame matches 7..11 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.lance_dashattack.frame matches 12..17 at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.lance_dashattack.frame matches 18..25 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.lance_dashattack.frame matches 26..32 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.lance_dashattack.frame matches 37..50 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.lance_dashattack.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

    execute if score @s aj.lance_dashattack.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_dashattack.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.0 0.4
    execute if score @s aj.lance_dashattack.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_dashattack.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4

    execute if score @s aj.lance_dashattack.frame matches 12 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/sound

    execute if score @s aj.lance_dashattack.frame matches 17 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_dashattack.frame matches 17 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_dashattack.frame matches 18..23 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_dashattack.frame matches 18..23 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10

    execute if score @s aj.lance_dashattack.frame matches 40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.lance_dashattack.frame matches 17 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"DashAttack"}]
    execute if score @s aj.lance_dashattack.frame matches 17 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/attack
    execute if score @s aj.lance_dashattack.frame matches 18..25 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/attack_dash
    execute if score @s aj.lance_dashattack.frame matches 25 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_dashattack.frame matches 56 run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/end
