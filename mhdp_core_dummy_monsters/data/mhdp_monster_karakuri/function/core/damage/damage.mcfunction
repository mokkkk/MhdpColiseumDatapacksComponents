#> mhdp_monster_karakuri:core/damage/damage
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

say からくりダメージ

# 相殺判定
    execute if entity @s[tag=Mns.Karakuri.Attack.Head] if entity @p[tag=Temp.Attacker,tag=Ply.Flag.Counter] if score #mhdp_temp_target_part_id MhdpCore matches 1 run data modify storage api: Return.Counter set value true

# 無敵時間のみ設定
    execute if score #mhdp_temp_damage_interval MhdpCore matches 1.. run scoreboard players operation @s Mns.General.DamageInterval = #mhdp_temp_damage_interval MhdpCore

# チュートリアル
    execute if entity @s[tag=Mns.State.Tutorial.IsDamage] run tag @s remove Mns.State.Tutorial.IsDamage

# 以下の優先度で怯みを適用
    # 相殺
        execute if data storage api: Return{Counter:true} run function mhdp_monster_karakuri:core/damage/reaction/counter

# 状態異常の発動
    # 爆破
        execute if entity @s[tag=Mns.Temp.Damage.Bomb] run function mhdp_monsters:core/util/damage/reaction_bomb
    # 龍気
        execute if entity @s[tag=Mns.Temp.Damage.DragonAura]

# ボスバー更新
    # なし

# 終了
    function mhdp_monsters:core/util/damage/remove_tags

# say モンスター処理：からくり飛竜被ダメージ