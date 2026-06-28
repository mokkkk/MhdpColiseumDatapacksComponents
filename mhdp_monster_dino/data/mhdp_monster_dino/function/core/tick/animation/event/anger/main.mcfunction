#> mhdp_monster_ranposu:core/tick/animation/event/anger/main
#
# アニメーションイベントハンドラ 怒り
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.anger.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 13 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 13 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 2 0.1 2 0 15
    execute if score @s aj.anger.frame matches 16 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.anger.frame matches 16 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.anger.frame matches 54 run function mhdp_monster_ranposu:core/tick/animation/event/anger/end
