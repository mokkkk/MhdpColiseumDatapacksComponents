#> assets:effect/0001.bind_voice/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:1}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:1}].Tick set value 50

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:1,\
        Level:1,\
        Tick:20,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:1}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:1}].Tick set from storage api: Arg.Override.Tick

# attribute操作
    attribute @s movement_speed modifier add mhdp_core:effect_bind_voice_movement_speed -0.07 add_value
    attribute @s jump_strength modifier add mhdp_core:effect_bind_voice_jump_strength -1.00 add_value
