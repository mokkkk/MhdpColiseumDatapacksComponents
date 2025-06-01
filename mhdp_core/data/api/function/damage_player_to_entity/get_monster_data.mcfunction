#> api:damage_player_to_entity/get_monster_data
#
# モンスターのステータス取得
#
# @input storage api: Arg.

# 肉質取得
    execute store result storage mhdp_core:temp Arg.TargetMonsterUid int 1 run scoreboard players get @n[type=slime,tag=Mns.HitBox,tag=Temp.Victim] Mns.HitBox.MonsterUid
    scoreboard players operation #mhdp_temp_target_part_id MhdpCore = @n[type=slime,tag=Mns.HitBox,tag=Temp.Victim] Mns.Hitbox.PartId
    execute store result storage mhdp_core:temp Arg.TargetPartId int 1 run scoreboard players get #mhdp_temp_target_part_id MhdpCore
    function api:damage_player_to_entity/get_monster_defence.m with storage mhdp_core:temp Arg

# 攻撃種別に応じた肉質の取得
    execute if data storage api: Arg{AttackType:"Cut"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage api: Arg.Defence[0]
    execute if data storage api: Arg{AttackType:"Blow"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage api: Arg.Defence[1]
    execute if data storage api: Arg{AttackType:"Shot"} store result score #mhdp_temp_defence_phys MhdpCore run data get storage api: Arg.Defence[2]
    execute if data storage api: Arg{AttackType:"Bomb"} run scoreboard players set #mhdp_temp_defence_phys MhdpCore 100

# 攻撃種別のスコア保持
    execute if data storage api: Arg{AttackType:"Cut"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 0
    execute if data storage api: Arg{AttackType:"Blow"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 1
    execute if data storage api: Arg{AttackType:"Shot"} run scoreboard players set #mhdp_temp_damage_phys_type MhdpCore 2
