#> mhdp_monsters:core/util/tick/tick
# 
# 汎用処理 tickの共通処理
#
# @within function mhdp_monsters:/**

# 非戦闘中
    execute if entity @s[tag=!Mns.State.IsBattle] if entity @n[tag=Ply.State.MnsTarget,distance=..15] run scoreboard players add @s Mns.General.SearchTimer 5
    execute if entity @s[tag=!Mns.State.IsBattle] if entity @n[tag=Ply.State.MnsTarget,distance=15..30] run scoreboard players add @s Mns.General.SearchTimer 3
    execute if entity @s[tag=!Mns.State.IsBattle] if entity @n[tag=Ply.State.MnsTarget,distance=30..] run scoreboard players add @s Mns.General.SearchTimer 1

# 壁埋まり対策
    execute unless block ~ ~ ~ #mhdp_core:no_collision unless block ~ ~1 ~ #mhdp_core:no_collision unless block ~ ~2 ~ #mhdp_core:no_collision unless block ~ ~3 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/back_to_field

# 同士討ちの無敵時間
    # 適用
        execute if entity @s[tag=!Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches 1.. run function mhdp_monsters:core/util/tick/start_damage_interval
    # 終了
        execute if score @s Mns.General.DamageInterval matches 1.. run scoreboard players remove @s Mns.General.DamageInterval 1
        execute if entity @s[tag=Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches ..0 run function mhdp_monsters:core/util/tick/end_damage_interval

# まばたき
    execute if entity @s[tag=!Mns.State.IsBlink] run scoreboard players add @s Mns.General.BlinkTimer.Check 1
    # 開始
        execute if entity @s[tag=!Mns.State.IsBlink] if score @s Mns.General.BlinkTimer.Check matches 40.. if predicate {"condition":"minecraft:random_chance","chance":0.3} run function mhdp_monsters:core/util/tick/start_blink
    # 実行
        execute if entity @s[tag=!Mns.State.IsBlink] if score @s Mns.General.BlinkTimer matches 1.. run function mhdp_monsters:core/util/tick/apply_blink
    # 終了
        execute if entity @s[tag=Mns.State.IsBlink] run scoreboard players remove @s Mns.General.BlinkTimer 1
        execute if entity @s[tag=Mns.State.IsBlink] if score @s Mns.General.BlinkTimer matches ..0 run function mhdp_monsters:core/util/tick/end_blink

# 怒り時間減少
    execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches 1.. run scoreboard players remove @s Mns.Anger.Timer 1

# 討伐済みの場合、一定時間後に消滅
    execute if entity @s[tag=Mns.State.Death] run scoreboard players add @s Mns.General.RemoveTimer 1
    execute if entity @s[tag=Mns.State.Death] if score @s Mns.General.RemoveTimer matches 600.. run function mhdp_monsters:core/switch/remove
