#> mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m
# 
# 汎用処理 プレイヤーの状態取得
#
# @within function mhdp_monsters:core/util/tick/tick

# 位置取り
    # 正面
        $execute rotated ~ 0 run function api:bounding/cake.m {Selector:"@a[tag=$(Tag)]",Tag:"Mns.Temp.Situation.Forward",Radius:80.0,Height:4.0,Angle:45.0}
    # # 背面
        $execute rotated ~180 0 run function api:bounding/cake.m {Selector:"@a[tag=$(Tag)]",Tag:"Mns.Temp.Situation.Back",Radius:80.0,Height:4.0,Angle:45.0}
    # 横
        $execute as @a[tag=$(Tag),tag=!Mns.Temp.Situation.Forward,tag=Mns.Temp.Situation.Back] run tag @s add Mns.Temp.Situation.Side

# 距離
    # 近距離
        $execute as @a[tag=$(Tag),distance=..$(DistNear)] run tag @s add Mns.Temp.Situation.Near
    # 中距離
        $execute as @a[tag=$(Tag),distance=$(DistNear)..$(DistFar)] run tag @s add Mns.Temp.Situation.Middle
    # 遠距離
        $execute as @a[tag=$(Tag),distance=$(DistFar)..100] run tag @s add Mns.Temp.Situation.Far

# 状態
    # ダッシュ移動中
        $execute as @a[tag=$(Tag),tag=Ply.Ope.IsSprinting,distance=..100] run tag @s add Mns.Temp.Situation.IsSprinting
    # 停止中
        $execute as @a[tag=$(Tag),distance=..100] if entity @s[tag=!Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyJump] run tag @s add Mns.Temp.Situation.IsStopping
    # スニーク中
        $execute as @a[tag=$(Tag),tag=Ply.Ope.IsSneaking,distance=..100] run tag @s add Mns.Temp.Situation.IsSneaking
    # ブロックに隠れている
        $execute as @a[tag=$(Tag),distance=..100] at @s if block ~ ~ ~ #mhdp_core:cover if block ~ ~1 ~ #mhdp_core:cover run tag @s add Mns.Temp.Situation.IsCovering
