#> mhdp_items:player/build/tick
#
# playerの建造物使用処理
#
# @within function mhdp_core:player/tick

# よじ登り
    execute if entity @s[tag=Ply.Ope.IsKeyJump] if score @s Ply.Stats.Stamina matches 1.. if score @s Ply.Timer.ClimbBuild matches ..0 run function mhdp_items:player/build/check_climb
