#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon_skill
#
# クエスト開始処理 プレイヤー実行 武器のセットアップ スキル効果適用
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon

# 攻撃力
    # 攻撃
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.1] run scoreboard players add @s Ply.Stats.AttackValue 3
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.2] run scoreboard players add @s Ply.Stats.AttackValue 6
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.3] run scoreboard players add @s Ply.Stats.AttackValue 9
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.4] run scoreboard players add @s Ply.Stats.AttackValue 12
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.5] run scoreboard players add @s Ply.Stats.AttackValue 15
        execute if entity @s[tag=Skill.Attack.Status.AttackUp.6] run scoreboard players add @s Ply.Stats.AttackValue 20

# 会心率
    # 見切り
        execute if entity @s[tag=Skill.Attack.Status.CritUp.1] run scoreboard players add @s Ply.Stats.CritValue 5
        execute if entity @s[tag=Skill.Attack.Status.CritUp.2] run scoreboard players add @s Ply.Stats.CritValue 10
        execute if entity @s[tag=Skill.Attack.Status.CritUp.3] run scoreboard players add @s Ply.Stats.CritValue 15
        execute if entity @s[tag=Skill.Attack.Status.CritUp.4] run scoreboard players add @s Ply.Stats.CritValue 20
        execute if entity @s[tag=Skill.Attack.Status.CritUp.5] run scoreboard players add @s Ply.Stats.CritValue 25
        execute if entity @s[tag=Skill.Attack.Status.CritUp.6] run scoreboard players add @s Ply.Stats.CritValue 30
    # 閃転
        execute if entity @s[tag=Skill.Attack.Status.CritConvert.1] run scoreboard players add @s Ply.Stats.CritValue 10
        execute if entity @s[tag=Skill.Attack.Status.CritConvert.2] run scoreboard players add @s Ply.Stats.CritValue 20
        execute if entity @s[tag=Skill.Attack.Status.CritConvert.3] run scoreboard players add @s Ply.Stats.CritValue 30

# 属性値
    execute if entity @s[tag=Skill.Attack.Status.FireUp.1] if score @s Ply.Stats.ElementValue.Fire matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Fire 10
    execute if entity @s[tag=Skill.Attack.Status.FireUp.2] if score @s Ply.Stats.ElementValue.Fire matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Fire 20
    execute if entity @s[tag=Skill.Attack.Status.FireUp.3] if score @s Ply.Stats.ElementValue.Fire matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Fire 35
    execute if entity @s[tag=Skill.Attack.Status.WaterUp.1] if score @s Ply.Stats.ElementValue.Water matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Water 10
    execute if entity @s[tag=Skill.Attack.Status.WaterUp.2] if score @s Ply.Stats.ElementValue.Water matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Water 20
    execute if entity @s[tag=Skill.Attack.Status.WaterUp.3] if score @s Ply.Stats.ElementValue.Water matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Water 35
    execute if entity @s[tag=Skill.Attack.Status.ThunderUp.1] if score @s Ply.Stats.ElementValue.Thunder matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Thunder 10
    execute if entity @s[tag=Skill.Attack.Status.ThunderUp.2] if score @s Ply.Stats.ElementValue.Thunder matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Thunder 20
    execute if entity @s[tag=Skill.Attack.Status.ThunderUp.3] if score @s Ply.Stats.ElementValue.Thunder matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Thunder 35
    execute if entity @s[tag=Skill.Attack.Status.IceUp.1] if score @s Ply.Stats.ElementValue.Ice matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Ice 10
    execute if entity @s[tag=Skill.Attack.Status.IceUp.2] if score @s Ply.Stats.ElementValue.Ice matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Ice 20
    execute if entity @s[tag=Skill.Attack.Status.IceUp.3] if score @s Ply.Stats.ElementValue.Ice matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Ice 35
    execute if entity @s[tag=Skill.Attack.Status.DragonUp.1] if score @s Ply.Stats.ElementValue.Dragon matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Dragon 10
    execute if entity @s[tag=Skill.Attack.Status.DragonUp.2] if score @s Ply.Stats.ElementValue.Dragon matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Dragon 20
    execute if entity @s[tag=Skill.Attack.Status.DragonUp.3] if score @s Ply.Stats.ElementValue.Dragon matches 1.. run scoreboard players add @s Ply.Stats.ElementValue.Dragon 35
