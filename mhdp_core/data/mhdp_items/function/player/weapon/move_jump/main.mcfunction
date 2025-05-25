#> mhdp_items:player/weapon/move_jump/main
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# 移動ベクトル取得
    summon marker ~ ~ ~ {Tags:["Mk.Temp.PlayerPos.0"]}
    data modify entity @n[type=marker,tag=Mk.Temp.PlayerPos.0] Pos set from storage mhdp_core:temp PlayerData.PrePos
    execute at @n[type=marker,tag=Mk.Temp.PlayerPos.0] facing entity @s feet as @n[type=marker,tag=Mk.Temp.PlayerPos.0] run tp @s ~ ~ ~ ~ 10

# プレイヤー移動有無検知
    data modify storage mhdp_core:temp Temp.Pos1 set from entity @n[type=marker,tag=Mk.Temp.PlayerPos.0] Pos
    data modify storage mhdp_core:temp Temp.Pos2 set from storage mhdp_core:temp PlayerData.Pos
    data modify storage mhdp_core:temp Temp.Pos1[1] set value 0.0
    data modify storage mhdp_core:temp Temp.Pos2[1] set value 0.0
    execute as @n[type=marker,tag=Mk.Temp.PlayerPos.0] store success score @s MhdpCore run data modify storage mhdp_core:temp Temp.Pos1 set from storage mhdp_core:temp Temp.Pos2

# 移動
    scoreboard players set $strength player_motion.api.launch 1500
    execute if score @n[type=marker,tag=Mk.Temp.PlayerPos.0] MhdpCore matches 1.. rotated as @n[type=marker,tag=Mk.Temp.PlayerPos.0] run function player_motion:api/launch_looking

# 終了
    kill @e[type=marker,tag=Mk.Temp.PlayerPos.0]
    data remove storage mhdp_core:temp Temp
