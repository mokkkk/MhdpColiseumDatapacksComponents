#> mhdp_monsters:core/super/tick/in_tick
# 
# 共通処理 tick中

# 同士討ちの無敵時間
    # # 適用
    #     execute if entity @s[tag=!Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches 1.. run function mhdp_monsters:core/util/tick/start_damage_interval
    # # 終了
    #     execute if score @s Mns.General.DamageInterval matches 1.. run scoreboard players remove @s Mns.General.DamageInterval 1
    #     execute if entity @s[tag=Mns.State.IsDamageInterval] if score @s Mns.General.DamageInterval matches ..0 run function mhdp_monsters:core/util/tick/end_damage_interval

# まばたき
    # タイマー増加
        execute if entity @s[tag=!Mns.State.IsBlink] run scoreboard players add @s Mns.General.BlinkTimer.Check 1
    # 開始
        execute if entity @s[tag=!Mns.State.IsBlink] if score @s Mns.General.BlinkTimer.Check matches 40.. if predicate {"condition":"minecraft:random_chance","chance":0.3} run function mhdp_monsters:core/util/tick/start_blink
    # 実行
        execute if entity @s[tag=!Mns.State.IsBlink] if score @s Mns.General.BlinkTimer matches 1.. run function mhdp_monsters:core/util/tick/apply_blink
    # 終了
        execute if entity @s[tag=Mns.State.IsBlink] run scoreboard players remove @s Mns.General.BlinkTimer 1
        execute if entity @s[tag=Mns.State.IsBlink] if score @s Mns.General.BlinkTimer matches ..0 run function mhdp_monsters:core/util/tick/end_blink

# 討伐済み
    # 一定時間後に消滅
        execute if entity @s[tag=Mns.State.Death] run scoreboard players add @s Mns.General.RemoveTimer 1
        execute if entity @s[tag=Mns.State.Death] if score @s Mns.General.RemoveTimer matches 600.. run function mhdp_monsters:core/switch/remove

# 状態に応じた処理
    # 怒り状態：時間減少
        execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches 1.. run scoreboard players remove @s Mns.Anger.Timer 1
    # 毒
        # execute if entity @s[tag=Mns.State.IsPoison,tag=!Mns.State.Death] run function mhdp_monsters:core/util/tick/condition_poison
