#> mhdp_monster_reus:core/tick/animation/event/fly_turn/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_turn.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/fly_turn/turn_start
    execute if score @s aj.fly_turn.frame matches 2..12 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 効果音
    execute if score @s aj.fly_turn.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 終了
    execute if score @s aj.fly_turn.frame matches 16 run function mhdp_monster_reus:core/tick/animation/event/fly_turn/end
