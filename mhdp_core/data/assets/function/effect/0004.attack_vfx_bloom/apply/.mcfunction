#> assets:effect/0004.attack_vfx_bloom/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:4}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:4}].Tick set value 60

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:4,\
        Level:1,\
        Tick:20,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:4}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:4}].Tick set from storage api: Arg.Override.Tick

# post_effect操作
    posteffect add @s impact:light_pulse/20t_arts
    posteffect add @s impact:bloom/20t_arts
