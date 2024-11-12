#> mhdp_monster_dino:core/tick/animation/event/tail_back_l/main
#
# アニメーションイベントハンドラ 尻尾攻撃・背面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.tail_back_l.frame matches 31 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/move_start
    execute if score @s aj.tail_back_l.frame matches 34..43 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.tail_back_l.frame matches 2..8 at @s run tp @s ^ ^ ^ ~-3 ~
    execute if score @s aj.tail_back_l.frame matches 31..35 at @s run tp @s ^ ^ ^ ~1 ~
    execute if score @s aj.tail_back_l.frame matches 36..40 at @s run tp @s ^ ^ ^ ~18 ~
    execute if score @s aj.tail_back_l.frame matches 41..44 at @s run tp @s ^ ^ ^ ~16 ~
    execute if score @s aj.tail_back_l.frame matches 45..55 at @s run tp @s ^ ^ ^-0.2 ~3 ~
    execute if score @s aj.tail_back_l.frame matches 56..60 at @s run tp @s ^ ^ ^-0.1 ~0.2 ~

# 効果音
    execute if score @s aj.tail_back_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_back_l.frame matches 10 run particle block{block_state:"minecraft:sand"} ^ ^0.5 ^-7 1 0.1 1 0 10
    execute if score @s aj.tail_back_l.frame matches 10 run particle block{block_state:"minecraft:sand"} ^ ^0.5 ^-9 1 0.1 1 0 10
    execute if score @s aj.tail_back_l.frame matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_back_l.frame matches 38 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.tail_back_l.frame matches 38 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_back_l.frame matches 40 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.tail_back_l.frame matches 41..48 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 5
    execute if score @s aj.tail_back_l.frame matches 41..48 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_back_l.frame matches 88 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.tail_back_l.frame matches 36..44 run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/attack_tail

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 喉赤熱化中はキャンセルしてブレスに移行
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] if score @s aj.tail_back_l.frame matches 52 run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/combo

# 状態更新
    execute if score @s aj.tail_back_l.frame matches 30 run tag @s add Mns.Dino.State.Attack.Tail.L
    execute if score @s aj.tail_back_l.frame matches 50 run tag @s remove Mns.Dino.State.Attack.Tail.L

# 終了
    execute if score @s aj.tail_back_l.frame matches 94 run function mhdp_monster_dino:core/tick/animation/event/tail_back_l/end
