#> mhdp_core:player/damage/player_to_entity
#
# プレイヤーからモンスターに対してのダメージ処理
#
# @within function mhdp_core:tick
# @input
#        mhdp_core:temp Damage.AttackType 物理攻撃種別
#        mhdp_core:temp Damage.DamageMult 物理ダメージ倍率
#        mhdp_core:temp Damage.PartDamageMult 部位ダメージ倍率
#        mhdp_core:temp Damage.ElementType 属性種別
#        mhdp_core:temp Damage.ElementDamageMult 属性ダメージ倍率
#        mhdp_core:temp Damage.ConditionType 状態異常種別
#        mhdp_core:temp Damage.ConditionValue 状態異常ダメージ量
#        mhdp_core:temp Damage.StunValue スタン量
#        mhdp_core:temp Damage.TireValue 減気量
#        mhdp_core:temp Damage.DragonAuraValue 龍気量
#        mhdp_core:temp Damage.IsDecreseSharpness 斬れ味消費有無

# 肉質取得
    execute store result storage mhdp_core:temp Damage.TargetMonsterUid int 1 run scoreboard players get @e[type=slime,tag=Mns.HitBox,tag=Victim,limit=1] Mns.HitBox.MonsterUid
    execute store result storage mhdp_core:temp Damage.TargetPartId int 1 run scoreboard players get @e[type=slime,tag=Mns.HitBox,tag=Victim,limit=1] Mns.HitBox.PartId
    function mhdp_core:player/damage/macro/m.get_monster_defence with storage mhdp_core:temp Damage
    execute if data storage mhdp_core:temp Damage{AttackType:"Cut"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[0]
    execute if data storage mhdp_core:temp Damage{AttackType:"Blow"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[1]
    execute if data storage mhdp_core:temp Damage{AttackType:"Shot"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage mhdp_core:temp Damage.Defence[2]

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

# スキル効果適用
    function mhdp_core:player/damage/skill/attack_status

# ダメージ量を計算
    # 物理
        execute store result score #mhdp_temp_damage_phys_value MhdpCore run data get storage mhdp_core:temp Damage.DamageMult
        scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
    # 属性
    # 斬れ味補正
    # 状態異常
    # 会心判定
    # スキル適用

# 実ダメージ量の計算

# モンスター側の被ダメージ処理に移行
