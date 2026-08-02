#> mhdp_monsters:core/util/tick/event/apply_attack.m
# 
# 汎用処理 攻撃の実行
#
# @within function mhdp_monsters:/**
# @input arg Uid モンスターのUID
# @input arg AttackName ストレージ検索に用いる攻撃名
# @input arg Player_Selector プレイヤー用Selector
# @input arg Player_Offset_X プレイヤー用攻撃基準位置オフセット
# @input arg Player_Offset_Y プレイヤー用攻撃基準位置オフセット
# @input arg Player_Offset_Z プレイヤー用攻撃基準位置オフセット
# @input arg Player_Scale_X プレイヤー用当たり判定サイズ
# @input arg Player_Scale_Y プレイヤー用当たり判定サイズ
# @input arg Player_Scale_Z プレイヤー用当たり判定サイズ
# @input arg Entity_Selector エンティティ用Selector、モンスターに使用
# @input arg Entity_Offset_X エンティティ用攻撃基準位置オフセット
# @input arg Entity_Offset_Y エンティティ用攻撃基準位置オフセット
# @input arg Entity_Offset_Z エンティティ用攻撃基準位置オフセット
# @input arg Entity_Scale_X エンティティ用当たり判定サイズ
# @input arg Entity_Scale_Y エンティティ用当たり判定サイズ
# @input arg Entity_Scale_Z エンティティ用当たり判定サイズ

# 怒り攻撃力倍率取得
    scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# 対建築物
    $function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:$(Uid), Name:"$(AttackName)"}
    tag @s add Temp.ObjectAttacker
    $execute positioned ^$(Entity_Offset_X) ^$(Entity_Offset_Y) ^$(Entity_Offset_Z) run function api:bounding/cuboid.m {Selector:"@e[type=shulker,tag=Entity.EnableDamage,distance=..30]",Tag:"Temp.Hit",X:"$(Entity_Scale_X)",Y:"$(Entity_Scale_Y)",Z:"$(Entity_Scale_Z)"}
    execute rotated as @s as @e[type=shulker,tag=Temp.Hit,distance=..30] run function api:damage_entity_to_object
    data remove storage api: Arg
    tag @e[type=shulker,tag=Temp.Hit,distance=..30] remove Temp.Hit
    tag @s remove Temp.ObjectAttacker

# 対プレイヤー
    $function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:$(Uid), Name:"$(AttackName)"}
    $execute positioned ^$(Player_Offset_X) ^$(Player_Offset_Y) ^$(Player_Offset_Z) run function api:bounding/cuboid.m {Selector:"$(Player_Selector)",Tag:"Temp.Hit",X:"$(Player_Scale_X)",Y:"$(Player_Scale_Y)",Z:"$(Player_Scale_Z)"}
    execute if entity @s[tag=!Mns.Temp.HitObject] rotated as @s as @a[tag=Temp.Hit] run function api:damage_entity_to_player
    data remove storage api: Arg
    tag @a remove Temp.Hit

# 対モンスター
    $function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:$(Uid), Name:"$(AttackName)"}
    tag @s add Temp.Attacker
    $execute positioned ^$(Entity_Offset_X) ^$(Entity_Offset_Y) ^$(Entity_Offset_Z) run function api:bounding/cuboid.m {Selector:"$(Entity_Selector)",Tag:"Temp.Hit",X:"$(Entity_Scale_X)",Y:"$(Entity_Scale_Y)",Z:"$(Entity_Scale_Z)"}
    execute if entity @s[tag=!Mns.Temp.HitObject] rotated as @s as @e[type=slime,tag=Temp.Hit,distance=..30] run function api:damage_entity_to_entity
    data remove storage api: Arg
    tag @e[type=slime,tag=Temp.Hit,distance=..30] remove Temp.Hit
    tag @s remove Temp.Attacker

# 終了
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
