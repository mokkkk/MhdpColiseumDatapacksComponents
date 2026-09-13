#> mhdp_monster_valk:core/tick/animation/event/lance_turn_r/main
#
# アニメーションイベントハンドラ 軸合わせ (右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_turn_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:14,MaxRotation:360}
    execute if score @s aj.lance_turn_r.frame matches 2..15 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.lance_turn_r.frame matches 2..10 if entity @n[tag=Mns.Target.Valk,distance=..9] at @s run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.lance_turn_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_turn_r.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_turn_r.frame matches 23 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_turn_r.frame matches 23 run function mhdp_monster_valk:core/tick/animation/event/lance_turn_r/end
