#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start
    execute if score @s aj.lance_spear_l_to_r.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start
    execute if score @s aj.lance_spear_l_to_r.frame matches 2..20 run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.lance_spear_l_to_r.frame matches 44 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start
    execute if score @s aj.lance_spear_l_to_r.frame matches 44..54 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 効果音
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_spear_l_to_r.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_spear_l_to_r.frame matches 13 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 38 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 62 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 67 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_spear_l_to_r.frame matches 87 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.lance_spear_l_to_r.frame matches 38 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/attack_l
    execute if score @s aj.lance_spear_l_to_r.frame matches 62 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/attack_r

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_spear_l_to_r.frame matches 106 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/end
