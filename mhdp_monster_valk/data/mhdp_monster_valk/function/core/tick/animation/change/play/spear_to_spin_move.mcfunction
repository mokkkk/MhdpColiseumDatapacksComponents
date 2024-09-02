#> mhdp_monster_valk:core/tick/animation/change/play/spear_to_spin_move
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 左右ランダム
    execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Mns.Temp.Right

# 位置決定
    execute if entity @s[tag=Mns.Temp.Right] positioned as @n[tag=Mns.Target.Valk] facing entity @s feet rotated ~110 0 positioned ^ ^0.5 ^10 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if entity @s[tag=!Mns.Temp.Right] positioned as @n[tag=Mns.Target.Valk] facing entity @s feet rotated ~-110 0 positioned ^ ^0.5 ^10 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s unless block ~ ~ ~ #mhdp_core:no_collision run kill @s

# 再生アニメーション決定
    tag @s add Mns.Temp.Valk.MoveToSpin
    tag @s add Anim.MoveStart.Lance

# 終了
    tag @s remove Mns.Temp.Right
