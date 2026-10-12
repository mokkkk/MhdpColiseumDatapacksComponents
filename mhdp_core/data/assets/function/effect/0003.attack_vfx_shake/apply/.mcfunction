#> assets:effect/0003.attack_vfx_shake/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:3}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:3}].Tick set value 12

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:3,\
        Level:1,\
        Tick:5,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:3}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:3}].Tick set from storage api: Arg.Override.Tick

# post_effect操作
    execute if data storage api: Arg.Override{Type:"weak"} run posteffect add @s impact:shake/weak
    execute if data storage api: Arg.Override{Type:"medium"} run posteffect add @s impact:shake/medium
    execute if data storage api: Arg.Override{Type:"strong"} run posteffect add @s impact:shake/strong
