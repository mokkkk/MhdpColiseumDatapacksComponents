#> mhdp_core:player/damage/player_to_entity/main
#
# プレイヤーからモンスターに対してのダメージ処理
#
# @within function 
# @input
#        storage mhdp_core:temp Damage.AttackType 物理攻撃種別
#        storage mhdp_core:temp Damage.DamageMult 物理ダメージ倍率（物理モーション値）
#        storage mhdp_core:temp Damage.PartDamageMult 部位ダメージ倍率
#        storage mhdp_core:temp Damage.ElementDamageMult 属性ダメージ倍率（属性モーション値）
#        storage mhdp_core:temp Damage.StunValue スタン量
#        storage mhdp_core:temp Damage.TireValue 減気量
#        storage mhdp_core:temp Damage.DragonAuraValue 龍気量
#        storage mhdp_core:temp Damage.IsDecreseSharpness 斬れ味消費有無
# @output
#        score #mhdp_temp_target_part_id MhdpCore 攻撃を受けた部位Id
#        score #mhdp_temp_damage_total MhdpCore 総ダメージ量
#        score #mhdp_temp_damage_phys_type MhdpCore 物理ダメージ種別
#        score #mhdp_temp_damage_phys_value MhdpCore 物理ダメージ量
#        score #mhdp_temp_damage_element_value MhdpCore 属性ダメージ量
#        score #mhdp_temp_damage_partdamage_value MhdpCore 部位ダメージ量
#        score #mhdp_temp_condition_value_poison MhdpCore 毒ダメージ量
#        score #mhdp_temp_condition_value_paralysis MhdpCore 麻痺ダメージ量
#        score #mhdp_temp_condition_value_bomb MhdpCore 爆破ダメージ量
#        score #mhdp_temp_damage_stun_value MhdpCore スタン量
#        score #mhdp_temp_damage_tire_value MhdpCore 減気量
#        score #mhdp_temp_damage_dragonaura_value MhdpCore 龍気量

# 肉質取得
    execute store result storage mhdp_core:temp Damage.TargetMonsterUid int 1 run scoreboard players get @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] Mns.HitBox.MonsterUid
    execute store result storage mhdp_core:temp Damage.TargetPartId int 1 run scoreboard players get @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] Mns.HitBox.PartId
    function mhdp_core:player/damage/player_to_entity/macro/m.get_monster_defence with storage mhdp_core:temp Damage
    execute if data storage mhdp_core:temp Damage{AttackType:"Cut"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[0]
    execute if data storage mhdp_core:temp Damage{AttackType:"Blow"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[1]
    execute if data storage mhdp_core:temp Damage{AttackType:"Shot"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[2]
    execute if data storage mhdp_core:temp Damage{AttackType:"Cut"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 0
    execute if data storage mhdp_core:temp Damage{AttackType:"Blow"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 1
    execute if data storage mhdp_core:temp Damage{AttackType:"Shot"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 2

# ダメージ計算用値初期値
    # 攻撃力
        scoreboard players operation #mhdp_temp_attack_value MhdpCore = @s Ply.Stats.AttackValue
    # 会心率
        scoreboard players operation #mhdp_temp_crit_value MhdpCore = @s Ply.Stats.CritValue
    # 属性値
        scoreboard players operation #mhdp_temp_element_value_fire MhdpCore = @s Ply.Stats.ElementValue.Fire
        scoreboard players operation #mhdp_temp_element_value_water MhdpCore = @s Ply.Stats.ElementValue.Water
        scoreboard players operation #mhdp_temp_element_value_thunder MhdpCore = @s Ply.Stats.ElementValue.Thunder
        scoreboard players operation #mhdp_temp_element_value_ice MhdpCore = @s Ply.Stats.ElementValue.Ice
        scoreboard players operation #mhdp_temp_element_value_dragon MhdpCore = @s Ply.Stats.ElementValue.Dragon
    # 状態異常
        scoreboard players operation #mhdp_temp_condition_value_poison MhdpCore = @s Ply.Stats.ConditionValue.Poison
        scoreboard players operation #mhdp_temp_condition_value_paralysis MhdpCore = @s Ply.Stats.ConditionValue.Paralysis
        scoreboard players operation #mhdp_temp_condition_value_bomb MhdpCore = @s Ply.Stats.ConditionValue.Bomb

# ステータス関連スキル効果適用
    function mhdp_core:player/damage/player_to_entity/skill/attack_status

# ダメージ量を計算
    # 物理ダメージ斬れ味補正
        scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches ..0 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 50
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 1 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 75
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 2 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 3 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 105
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 4 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 120
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 5 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 132
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 6.. run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 139
    # 物理
        # 攻撃力 * モーション値
            execute store result score #mhdp_temp_damage_phys_value MhdpCore run data get storage mhdp_core:temp Damage.DamageMult
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
        # * 斬れ味補正
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_damage_sharpness_multiply MhdpCore
        # 桁合わせ
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_10000 Const
    # 属性ダメージ斬れ味補正
        scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches ..0 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 50
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 1 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 75
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 2..4 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 5 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 115
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 6.. run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 125
    # 属性
        # 属性ダメージ加算
            function mhdp_core:player/damage/player_to_entity/sum_element_damage
        # 属性ダメージ * モーション値
            execute store result score #mhdp_temp_element_attack_value MhdpCore run data get storage mhdp_core:temp Damage.ElementDamageMult
            scoreboard players operation #mhdp_temp_damage_element_value MhdpCore *= #mhdp_temp_element_attack_value MhdpCore
        # * 斬れ味補正
            scoreboard players operation #mhdp_temp_damage_element_value MhdpCore *= #mhdp_temp_damage_sharpness_multiply MhdpCore
        # 桁合わせ
            scoreboard players operation #mhdp_temp_damage_element_value MhdpCore /= #const_10000 Const
    # 状態異常
        # 成功判定
            execute if predicate {"condition":"minecraft:random_chance","chance":0.66} run tag @s add Ply.Temp.IsDisableConditionDamage
            execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_poison MhdpCore 0
            execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_paralysis MhdpCore 0
            execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_bomb MhdpCore 0
            tag @s remove Ply.Temp.IsDisableConditionDamage

# 会心判定およびダメージ関連スキル適用
    function mhdp_core:player/damage/player_to_entity/skill/attack_damage

# 実ダメージ量の計算
    # 物理
        # ダメージ * 肉質
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_defence_phys MhdpCore
            execute store result score #mhdp_temp_damage_total MhdpCore store result score #mhdp_temp_damage_partdamage_value MhdpCore run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_100 Const
    # 部位ダメージ
        # ダメージ * 部位ダメージ倍率
            execute store result score #mhdp_temp_attack_value MhdpCore run data get storage mhdp_core:temp Damage.PartDamageMult
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore /= #mhdp_temp_attack_value MhdpCore
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore /= #const_100 Const
    # スタン
        execute store result score #mhdp_temp_damage_stun_value MhdpCore run data get storage mhdp_core:temp Damage.StunValue
    # 減気
        execute store result score #mhdp_temp_damage_tire_value MhdpCore run data get storage mhdp_core:temp Damage.TireValue
    # 龍気
        execute store result score #mhdp_temp_damage_dragonaura_value MhdpCore run data get storage mhdp_core:temp Damage.DragonAuraValue
    # 総ダメージ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore += #mhdp_temp_damage_element_value MhdpCore

# 演出
    execute positioned as @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] run function mhdp_core:player/damage/player_to_entity/vfx

# 斬れ味消費
    execute if data storage mhdp_core:temp Damage{IsDecreseSharpness:true} run function mhdp_core:player/damage/player_to_entity/decrease_sharpness

# モンスター側の被ダメージ処理に移行
    function mhdp_monsters:core/switch/damage

# 終了
    scoreboard players reset #mhdp_temp_attack_value MhdpCore
    scoreboard players reset #mhdp_temp_defence_phys
    scoreboard players reset #mhdp_temp_damage_sharpness_multiply MhdpCore
    scoreboard players reset #mhdp_temp_element_value_fire MhdpCore
    scoreboard players reset #mhdp_temp_element_value_water MhdpCore
    scoreboard players reset #mhdp_temp_element_value_thunder MhdpCore
    scoreboard players reset #mhdp_temp_element_value_ice MhdpCore
    scoreboard players reset #mhdp_temp_element_value_dragon MhdpCore
    scoreboard players reset #mhdp_temp_element_attack_value MhdpCore
    tag @e[tag=Temp.Victim] remove Temp.Victim
    # data remove storage mhdp_core:temp Damage
