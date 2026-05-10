#> mhdp_monsters:core/super/tick/in_tick
# 
# 共通処理 tick中

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
