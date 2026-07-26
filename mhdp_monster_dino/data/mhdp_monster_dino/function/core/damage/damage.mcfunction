#> mhdp_monster_dino:core/damage/damage
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
    execute unless score @s Mns.General.Phase matches 2 run function mhdp_monster_dino:core/tick/on_battle/start_ambush

# 共通ステータスの減算
    function mhdp_monsters:core/util/damage/damage_common_data
    # 討伐された場合、以降の処理は行わない
        execute if entity @s[tag=Mns.State.Death] run return 0

# チュートリアル用処理
    execute if entity @s[tag=Mns.State.Tutorial.IsDamage] run tag @s remove Mns.State.Tutorial.IsDamage

# 部位ダメージの減算
    # 頭
        execute if score #mhdp_temp_target_part_id MhdpCore matches 0 run scoreboard players operation @s Mns.Dino.Head.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score #mhdp_temp_target_part_id MhdpCore matches 5 run scoreboard players operation @s Mns.Dino.Head.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Dino.Head.Damage matches ..0 run tag @s add Mns.Temp.Damage.Head
    # 喉赤熱化
        execute if score #mhdp_temp_target_part_id MhdpCore matches 5 run scoreboard players operation @s Mns.Dino.Sp.RedHead.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Dino.Sp.RedHead.Damage matches ..0 run tag @s add Mns.Temp.Damage.RedHead
    # 胴
        execute if score #mhdp_temp_target_part_id MhdpCore matches 1 run scoreboard players operation @s Mns.Dino.Body.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Dino.Body.Damage matches ..0 run tag @s add Mns.Temp.Damage.Body
    # 右脚
        execute if score #mhdp_temp_target_part_id MhdpCore matches 3 run scoreboard players operation @s Mns.Dino.LegR.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Dino.LegR.Damage matches ..0 run tag @s add Mns.Temp.Damage.LegR
    # 左脚
        execute if score #mhdp_temp_target_part_id MhdpCore matches 3 run scoreboard players operation @s Mns.Dino.LegL.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
        execute if score @s Mns.Dino.LegL.Damage matches ..0 run tag @s add Mns.Temp.Damage.LegL

# ボスバー更新
    execute if entity @s[tag=!Mns.Param.IsHideHp] store result bossbar mhdp_monster:dino value run scoreboard players get @s Mns.Hp

# 怯み適用：優先度順
    # # 麻痺
    #     execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Paralysis] run function mhdp_monster_dino:core/damage/reaction/paralysis
    # スタン
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Stun] run function mhdp_monster_dino:core/damage/reaction/stun
    # # 減気
    #     execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Tire]
    # 相殺
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Counter] run function mhdp_monster_dino:core/damage/reaction/counter
    # 頭(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Head] run function mhdp_monster_dino:core/damage/reaction/head
    # 喉赤熱化(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.RedHead] run function mhdp_monster_dino:core/damage/reaction/red_head
    # 胴(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Body] run function mhdp_monster_dino:core/damage/reaction/body
    # 右脚(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.LegR] run function mhdp_monster_dino:core/damage/reaction/leg_r
    # 左脚(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.LegL] run function mhdp_monster_dino:core/damage/reaction/leg_l
    # 尻尾(独自)
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Tail] run function mhdp_monster_dino:core/damage/reaction/tail
    # 怒り
        execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Anger] run function mhdp_monster_dino:core/damage/reaction/anger

# 状態異常の発動
    # 毒
        execute if entity @s[tag=Mns.Temp.Damage.Poison] run function mhdp_monsters:core/util/damage/reaction_poison
    # 爆破
        execute if entity @s[tag=Mns.Temp.Damage.Bomb] run function mhdp_monsters:core/util/damage/reaction_bomb
    # 龍気
        execute if entity @s[tag=Mns.Temp.Damage.DragonAura]

# 終了
    function mhdp_monsters:core/util/damage/remove_tags
    tag @s remove Mns.Temp.Damage.Head
    tag @s remove Mns.Temp.Damage.RedHead
    tag @s remove Mns.Temp.Damage.Body
    tag @s remove Mns.Temp.Damage.LegR
    tag @s remove Mns.Temp.Damage.LegL
    tag @s remove Mns.Temp.Damage.Tail
