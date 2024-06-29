#> mhdp_core:player/damage/entity_to_entity/main
#
# モンスターからモンスターに対してのダメージ処理
#
# @within function mhdp_monsters:**
# @input
#        storage mhdp_core:temp Damage.DamageValue ダメージ量
# @output
#        score #mhdp_temp_target_part_id MhdpCore 攻撃を受けた部位Id
#        score #mhdp_temp_damage_total MhdpCore 総ダメージ量
#        score #mhdp_temp_damage_partdamage_value MhdpCore 部位ダメージ量
#        score #mhdp_temp_damage_interval MhdpCore 無敵時間

# 必要データの取得
    execute store result storage mhdp_core:temp Damage.TargetMonsterUid int 1 run scoreboard players get @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] Mns.HitBox.MonsterUid
    scoreboard players operation #mhdp_temp_target_part_id MhdpCore = @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] Mns.Hitbox.PartId

# ダメージ量の取得
    execute store result score #mhdp_temp_damage_total MhdpCore store result score #mhdp_temp_damage_partdamage_value MhdpCore run data get storage mhdp_core:temp Damage.DamageValue 30

# 無敵時間設定
    scoreboard players set #mhdp_temp_damage_interval MhdpCore 20

# 演出
    execute positioned as @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim,limit=1] run function mhdp_core:player/damage/entity_to_entity/show_damage

# モンスター側の被ダメージ処理に移行
    function mhdp_monsters:core/switch/damage

# 終了
    tag @e[tag=Temp.Victim] remove Temp.Victim
