#> mhdp_monsters:core/super/tick/pre_tick
# 
# 共通処理 tick開始時

# モンスター用の一時storageを初期化
    data modify storage mhdp_core:temp MonsterTemp set value {}

# 現在いるエリアを保持
    execute store result storage mhdp_core:temp MonsterTemp.CurrentArea.AreaId int 1 run scoreboard players get @s Fld.CurrentAreaId

# 現在位置を保持
    data modify storage mhdp_core:temp MonsterTemp.PrePosArray set from entity @s Pos
    data modify storage mhdp_core:temp MonsterTemp.PrePos.X set from storage mhdp_core:temp MonsterTemp.PrePosArray[0]
    data modify storage mhdp_core:temp MonsterTemp.PrePos.Y set from storage mhdp_core:temp MonsterTemp.PrePosArray[1]
    data modify storage mhdp_core:temp MonsterTemp.PrePos.Z set from storage mhdp_core:temp MonsterTemp.PrePosArray[2]

# 1秒ごとの処理
    scoreboard players add @s Mns.General.TickTimer 1
    execute if score @s Mns.General.TickTimer matches 20.. run tag @s add Mns.Temp.IsTick
    execute if entity @s[tag=Mns.Temp.IsTick] run scoreboard players set @s Mns.General.TickTimer 0
