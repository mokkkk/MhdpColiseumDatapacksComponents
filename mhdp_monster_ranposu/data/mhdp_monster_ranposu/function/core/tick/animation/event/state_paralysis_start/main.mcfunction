#> mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/main
#
# アニメーションイベントハンドラ 麻痺開始
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.state_paralysis_start.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.state_paralysis_start.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.state_paralysis_start.frame matches 9 run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/end
