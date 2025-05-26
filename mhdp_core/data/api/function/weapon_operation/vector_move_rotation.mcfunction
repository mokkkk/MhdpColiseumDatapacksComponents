#> api:weapon_operation/vector_move_rotation
#
# 武器操作時の移動用
# 移動方向を打ち消すように回転する

# カメラ回転
    execute if entity @s[tag=Ply.Ope.IsKeyLeft] at @s run tp @s ~ ~ ~ ~1 ~
    execute if entity @s[tag=Ply.Ope.IsKeyRight] at @s run tp @s ~ ~ ~ ~-1 ~
