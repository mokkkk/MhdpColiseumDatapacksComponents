#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/main
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_vertical_r_to_l.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/turn_start
    execute if score @s aj.lance_vertical_r_to_l.frame matches 5..14 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_vertical_r_to_l.frame matches 1..8 if entity @n[tag=Mns.Target.Valk,distance=..9] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_vertical_r_to_l.frame matches 9..15 unless entity @n[tag=Mns.Target.Valk,distance=..12] at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.lance_vertical_r_to_l.frame matches 16..20 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.lance_vertical_r_to_l.frame matches 52..62 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.lance_vertical_r_to_l.frame matches 63..68 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.lance_vertical_r_to_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_r_to_l.frame matches 9 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_r_to_l.frame matches 9 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_r_to_l.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_r_to_l.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_r_to_l.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_r_to_l.frame matches 47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_r_to_l.frame matches 68 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_r_to_l.frame matches 68 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_r_to_l.frame matches 81 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_r_to_l.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_r_to_l.frame matches 11..20 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle with entity @s data.locators.pos_wing_l_3

# 攻撃
    execute if score @s aj.lance_vertical_r_to_l.frame matches 20 positioned ^1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/attack
    execute if score @s aj.lance_vertical_r_to_l.frame matches 24 positioned ^1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/particle_ring

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_vertical_r_to_l.frame matches 124 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/end
