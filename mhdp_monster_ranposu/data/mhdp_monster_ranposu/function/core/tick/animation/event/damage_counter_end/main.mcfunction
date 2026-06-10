#> mhdp_monster_ranposu:core/tick/animation/event/damage_counter_end_counter_start/main
#
# アニメーションイベントハンドラ 怯み・相殺
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_counter_end.frame matches 2..15 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.damage_counter_end.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_counter_end.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.damage_counter_end.frame matches 19 run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter_end/end
