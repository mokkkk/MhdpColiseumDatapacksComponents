#> mhdp_monster_dino:core/tick/animation/event/turn_l/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.turn_l.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:18,MaxRotation:360}
    execute if score @s aj.turn_l.frame matches 3..20 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.turn_l.frame matches 1..10 if entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^-0.3

# 効果音
    execute if score @s aj.turn_l.frame matches 9 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.turn_l.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.turn_l.frame matches 26 run function mhdp_monster_dino:core/tick/animation/event/turn_l/end
