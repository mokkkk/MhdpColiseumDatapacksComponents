#> mhdp_items:player/build/check_climb
#
# 建造物よじ登り
#
# @within function mhdp_core:player/tick

# よじ登り
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] run return run function mhdp_items:player/build/check_climb.m {Rotate:-45}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] run return run function mhdp_items:player/build/check_climb.m {Rotate:45}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] run return run function mhdp_items:player/build/check_climb.m {Rotate:-135}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] run return run function mhdp_items:player/build/check_climb.m {Rotate:135}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run function mhdp_items:player/build/check_climb.m {Rotate:0}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run function mhdp_items:player/build/check_climb.m {Rotate:180}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] run return run function mhdp_items:player/build/check_climb.m {Rotate:-90}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] run return run function mhdp_items:player/build/check_climb.m {Rotate:90}
