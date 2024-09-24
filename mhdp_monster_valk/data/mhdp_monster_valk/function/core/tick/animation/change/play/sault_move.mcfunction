#> mhdp_monster_valk:core/tick/animation/change/play/sault_move
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# クールタイム設定
    scoreboard players set @s Mns.Valk.MoveSkill.CoolDown 3

# 左右ランダム
    execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Mns.Temp.Right

# 位置決定
    execute positioned as @n[tag=Mns.Target.Valk] facing entity @s feet positioned ^ ^0.5 ^12 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s unless block ~ ~ ~ #mhdp_core:no_collision run kill @s
    execute as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground

# 再生アニメーション決定
    tag @s add Anim.MoveStart.Shoot

# 終了
    tag @s remove Mns.Temp.Right
