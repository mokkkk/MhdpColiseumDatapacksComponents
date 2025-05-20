#> mhdp_items:player/weapon/stamina/main
#
# スタミナ関連の処理
#
# @within function mhdp_items:player/weapon/tick

# 自然回復
    execute if entity @s[tag=!Skill.Stamina.StaminaSurge.1,tag=!Skill.Stamina.StaminaSurge.2,tag=!Ply.Ope.IsSprinting,tag=!Ply.Weapon.StaminaNotRegen,tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..999 run scoreboard players add @s Ply.Stats.Stamina 5
    execute if entity @s[tag=Skill.Stamina.StaminaSurge.1,tag=!Ply.Ope.IsSprinting,tag=!Ply.Weapon.StaminaNotRegen,tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..999 run scoreboard players add @s Ply.Stats.Stamina 7
    execute if entity @s[tag=Skill.Stamina.StaminaSurge.2,tag=!Ply.Ope.IsSprinting,tag=!Ply.Weapon.StaminaNotRegen,tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..999 run scoreboard players add @s Ply.Stats.Stamina 9

# ダッシュ中の消費
    execute if entity @s[tag=Ply.Ope.IsSprinting,tag=!Skill.Stamina.Runner.1,tag=!Skill.Stamina.Runner.2] run scoreboard players remove @s Ply.Stats.Stamina 3
    execute if entity @s[tag=Skill.Stamina.Runner.1,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 2
    execute if entity @s[tag=Skill.Stamina.Runner.2,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 1

# ジャンプ時の消費
    # 立ち
        execute if entity @s[tag=!Skill.Stamina.Constitution.1,tag=!Skill.Stamina.Constitution.2,tag=!Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 30
        execute if entity @s[tag=Skill.Stamina.Constitution.1,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 25
        execute if entity @s[tag=Skill.Stamina.Constitution.2,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 20
        execute if entity @s[tag=Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 15
    # ダッシュ中
        execute if entity @s[tag=!Skill.Stamina.Constitution.1,tag=!Skill.Stamina.Constitution.2,tag=!Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 50
        execute if entity @s[tag=Skill.Stamina.Constitution.1,tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 42
        execute if entity @s[tag=Skill.Stamina.Constitution.2,tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 35
        execute if entity @s[tag=Skill.Stamina.Constitution.3,tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSprinting] run scoreboard players remove @s Ply.Stats.Stamina 28

# ペナルティ開始
    execute if entity @s[tag=!Ply.Weapon.StaminaEmpty] if score @s Ply.Stats.Stamina matches ..-1 run function mhdp_items:player/weapon/stamina/penalry_start

# ペナルティ中
    execute if entity @s[tag=Ply.Weapon.StaminaEmpty] run function mhdp_items:player/weapon/stamina/penalry_tick

# 数値丸め込み
    execute if score @s Ply.Stats.Stamina matches 1001.. run scoreboard players set @s Ply.Stats.Stamina 1000
    execute if score @s Ply.Stats.Stamina matches ..-1 run scoreboard players set @s Ply.Stats.Stamina 0
