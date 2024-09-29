#> mhdp_items:weapons/bow/type_tec/4_charge_step/move
#
# チャージステップ 移動
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 移動ベクトル取得
    summon marker ~ ~ ~ {Tags:["Mk.Temp.PlayerPos.0"]}
    data modify entity @n[type=marker,tag=Mk.Temp.PlayerPos.0] Pos set from storage mhdp_core:temp PlayerData.PrePos
    execute at @n[type=marker,tag=Mk.Temp.PlayerPos.0] facing entity @s feet as @n[type=marker,tag=Mk.Temp.PlayerPos.0] run tp @s ~ ~ ~ ~ 0

# プレイヤー移動有無検知
    data modify storage mhdp_core:temp Temp.Pos1 set from entity @n[type=marker,tag=Mk.Temp.PlayerPos.0] Pos
    data modify storage mhdp_core:temp Temp.Pos2 set from storage mhdp_core:temp PlayerData.Pos
    data modify storage mhdp_core:temp Temp.Pos1[1] set value 0.0
    data modify storage mhdp_core:temp Temp.Pos2[1] set value 0.0
    execute as @n[type=marker,tag=Mk.Temp.PlayerPos.0] store success score @s MhdpCore run data modify storage mhdp_core:temp Temp.Pos1 set from storage mhdp_core:temp Temp.Pos2

# 移動
    tp @s @s
    tp @s ~ ~ ~0.5
    scoreboard players set $strength delta.api.launch 20000
    execute if score @n[type=marker,tag=Mk.Temp.PlayerPos.0] MhdpCore matches 1.. rotated as @n[type=marker,tag=Mk.Temp.PlayerPos.0] run function delta:api/launch_looking
    execute unless score @n[type=marker,tag=Mk.Temp.PlayerPos.0] MhdpCore matches 1.. rotated ~ 0 run function delta:api/launch_looking

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3

# 終了
    kill @n[type=marker,tag=Mk.Temp.PlayerPos.0]
    data remove storage mhdp_core:temp Temp
