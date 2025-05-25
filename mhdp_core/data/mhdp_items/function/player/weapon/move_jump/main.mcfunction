#> mhdp_items:player/weapon/move_jump/main
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# スタミナ消費
    execute if entity @s[tag=!Skill.Stamina.Constitution.1,tag=!Skill.Stamina.Constitution.2,tag=!Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 120
    execute if entity @s[tag=Skill.Stamina.Constitution.1,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 110
    execute if entity @s[tag=Skill.Stamina.Constitution.2,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 100
    execute if entity @s[tag=Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 90

# 移動
    execute rotated ~ 10 run function api:weapon_operation/vector_move.m {Strength:2500}

# 演出
    particle cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.1 3
    playsound block.grass.step player @s ~ ~ ~ 2 1

# 空中フラグ有効
    tag @s add Ply.Ope.IsAir

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3
    
# 終了
    data remove storage mhdp_core:temp Temp
