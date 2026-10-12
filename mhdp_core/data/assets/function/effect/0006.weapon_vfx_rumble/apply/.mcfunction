#> assets:effect/0006.weapon_vfx_rumble/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:6}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:6}].Tick set value 20

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:6,\
        Level:1,\
        Tick:20,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:6}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:6}].Tick set from storage api: Arg.Override.Tick

# post_effect操作
    posteffect add @s impact:rumble/10t
