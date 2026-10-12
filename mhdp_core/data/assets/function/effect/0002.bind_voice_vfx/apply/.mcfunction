#> assets:effect/0002.bind_voice_vfx/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:2}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:2}].Tick set value 20

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:2,\
        Level:1,\
        Tick:62,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:2}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:2}].Tick set from storage api: Arg.Override.Tick

# post_effect操作
    posteffect remove @s impact:bloom/60t
    posteffect remove @s impact:light_pulse/60t
