#> mhdp_items:player/weapon/stamina/main
#
# スタミナ関連の処理
#
# @within function mhdp_items:player/weapon/tick

# 自然回復
    execute if entity @s[tag=!Ply.Weapon.StaminaNotRegen,tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..999 run scoreboard players add @s Ply.Stats.Stamina 5

# ダッシュ中の消費
    execute if entity @s[tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 4

# ジャンプ時の消費
    execute if entity @s[tag=Ply.Ope.StartJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 50
    execute if entity @s[tag=Ply.Ope.StartJump,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 100

# ペナルティ開始
    execute if entity @s[tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..-1 run function mhdp_items:player/weapon/stamina/penalry_start

# ペナルティ中
    execute if entity @s[tag=Ply.Weapon.StaminaEmpty] run function mhdp_items:player/weapon/stamina/penalry_tick

# 数値丸め込み
    execute if score @s Ply.Stats.Stamina matches 1001.. run scoreboard players set @s Ply.Stats.Stamina 1000
    execute if score @s Ply.Stats.Stamina matches ..-1 run scoreboard players set @s Ply.Stats.Stamina 0
