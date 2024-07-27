#> mhdp_monster_reus:core/damage/damage
#
# 被ダメージ時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage
# @input
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

# 非戦闘時、戦闘に移行
    execute if entity @s[tag=!Mns.State.IsBattle] run scoreboard players set @s Mns.General.SearchTimer 3000
    execute if entity @s[tag=!Mns.State.IsBattle] run function mhdp_monster_reus:core/tick/animation/change/main

# 共通ステータスの減算
    function mhdp_monsters:core/util/damage/damage_common_data
    # 討伐時、処理を中断
        execute if entity @s[tag=Mns.State.Death] run return 0
    
# 部位ダメージの減算
    # 頭
        execute if score #mhdp_temp_target_part_id MhdpCore matches 0 run scoreboard players operation @s Mns.Reus.Head.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Reus.Head.Damage matches ..0 run tag @s add Mns.Temp.Damage.Head
    # 胴
        execute if score #mhdp_temp_target_part_id MhdpCore matches 1 run scoreboard players operation @s Mns.Reus.Body.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Reus.Body.Damage matches ..0 run tag @s add Mns.Temp.Damage.Body
    # 尻尾
        execute if score #mhdp_temp_target_part_id MhdpCore matches 2 run scoreboard players operation @s Mns.Reus.Tail.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Reus.Tail.Damage matches ..0 run tag @s add Mns.Temp.Damage.Tail
    # 右足
        execute if score #mhdp_temp_target_part_id MhdpCore matches 3 run scoreboard players operation @s Mns.Reus.LegR.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Reus.LegR.Damage matches ..0 run tag @s add Mns.Temp.Damage.LegR
    # 左足
        execute if score #mhdp_temp_target_part_id MhdpCore matches 4 run scoreboard players operation @s Mns.Reus.LegL.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Reus.LegL.Damage matches ..0 run tag @s add Mns.Temp.Damage.LegL

# 以下の優先度で怯みを適用
    # 麻痺
        # execute if entity @s[tag=Mns.Temp.Damage.Paralysis] run function mhdp_monster_reus:core/damage/reaction/paralysis
    # スタン
        execute if entity @s[tag=Mns.Temp.Damage.Stun] run function mhdp_monster_reus:core/damage/reaction/stun
    # 減気
        # execute if entity @s[tag=Mns.Temp.Damage.Tire]
    # 頭(独自)
        execute if entity @s[tag=Mns.Temp.Damage.Head] run function mhdp_monster_reus:core/damage/reaction/head
    # 胴(独自)
        execute if entity @s[tag=Mns.Temp.Damage.Body] run function mhdp_monster_reus:core/damage/reaction/body
    # 尻尾(独自)
        execute if entity @s[tag=Mns.Temp.Damage.Tail] run function mhdp_monster_reus:core/damage/reaction/tail
    # 右足(独自)
        execute if entity @s[tag=Mns.Temp.Damage.LegR] run function mhdp_monster_reus:core/damage/reaction/leg_r
    # 左足(独自)
        execute if entity @s[tag=Mns.Temp.Damage.LegL] run function mhdp_monster_reus:core/damage/reaction/leg_l
    # 怒り
        execute if entity @s[tag=Mns.Temp.Damage.Anger] run function mhdp_monster_reus:core/damage/reaction/anger

# 状態異常の発動
    # 毒
        # execute if entity @s[tag=Mns.Temp.Damage.Poison] run function mhdp_monsters:core/util/damage/reaction_poison
    # 爆破
        # execute if entity @s[tag=Mns.Temp.Damage.Bomb] run function mhdp_monsters:core/util/damage/reaction_bomb
    # 龍気
        # execute if entity @s[tag=Mns.Temp.Damage.DragonAura]

# ボスバー更新
    execute if entity @s[tag=!Mns.Param.IsHideHp] store result bossbar mhdp_monster:reus value run scoreboard players get @s Mns.Hp

# 終了
    function mhdp_monsters:core/util/damage/remove_tags
    tag @s remove Mns.Temp.Damage.Head
    tag @s remove Mns.Temp.Damage.Body
    tag @s remove Mns.Temp.Damage.Tail
    tag @s remove Mns.Temp.Damage.LegR
    tag @s remove Mns.Temp.Damage.LegL

say 火竜被ダメージ