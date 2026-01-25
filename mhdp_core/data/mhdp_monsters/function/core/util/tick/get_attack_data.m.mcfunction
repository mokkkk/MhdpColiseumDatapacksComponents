#> mhdp_monsters:core/util/tick/get_attack_data.m
# 
# 汎用処理 攻撃データ初期化
#
# @within function mhdp_monsters:/**

# 攻撃データ
    $data modify storage mhdp_core:temp Arg set from storage mhdp_core:monster_data AttackData[{Uid:$(Uid)}].Attacks[{Name:"$(Name)"}]

# 攻撃力倍率
    scoreboard players operation #mhdp_temp_attack_multiply_quest MhdpCore = @s Mns.QuestAttackMultiply

# 怒りダメージ倍率
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# フラグ
    data modify storage mhdp_core:temp Arg.UseUtil set value true
