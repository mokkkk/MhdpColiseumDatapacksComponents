#> mhdp_items:weapons/long_sword/type_tec/8_move_slash/start
#
# 移動斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s remove Ply.Weapon.NoOpe

# 移動方向決定
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-90 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Left
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~90 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Right
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Left
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Right
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Back
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Left
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~-20 run return run tag @s add Wpn.Ls.Tec.MoveSlash.Right
    execute rotated ~180 ~-20 run tag @s add Wpn.Ls.Tec.MoveSlash.Back