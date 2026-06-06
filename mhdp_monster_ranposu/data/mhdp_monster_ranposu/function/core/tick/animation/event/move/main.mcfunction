#> mhdp_monster_ranposu:core/tick/animation/event/move/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# オブジェクト探知開始
    execute if score @s aj.move.frame matches 1 run tag @s add Mns.State.IsSearchObject

# 軸合わせ
    tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 移動
    tp @s ^ ^ ^0.6

# 効果音
    particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.move.frame matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.move.frame matches 9 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if entity @n[tag=Mns.Target.Ranposu,distance=..5] run function mhdp_monster_ranposu:core/tick/animation/event/move/end
    execute unless entity @e[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/animation/event/move/end
