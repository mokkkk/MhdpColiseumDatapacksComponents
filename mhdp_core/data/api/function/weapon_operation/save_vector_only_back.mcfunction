#> api:weapon_operation/save_vector_only_back
#
# 実行時の向きとキー入力を記録する
# ただし、前方方向は保存しない
#
# @input storage api: Arg.Strength

# データ保存
    data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 180
    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value -45
    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 45
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value -135
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 135
    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 0
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 180
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value -90
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] run return run data modify storage mhdp_core:temp PlayerData.VectorMove.Direction set value 90
