#> assets:effect/0005.valk_vfx_commet/apply/
#
# エフェクト適用処理

# 既にデータがある場合、tickを上書き
    execute if data storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:5}] run return run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:5}].Tick set value 100

# データを付与
    data modify storage mhdp_core:temp PlayerData.ActiveEffectList append value {\
        EffectId:5,\
        Level:1,\
        Tick:100,\
        IsRemoveStartVillage:true,\
        IsRemoveStartQuest:true,\
        IsRemoveOnDeath:true\
    }

# Level上書き
    execute if data storage api: Arg.Override.Level run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:5}].Level set from storage api: Arg.Override.Level

# Tick上書き
    execute if data storage api: Arg.Override.Tick run data modify storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:5}].Tick set from storage api: Arg.Override.Tick

# post_effect操作
    execute if data storage api: Arg.Override{Type:"beam"} run posteffect add @s impact:bloom/100t
    execute if data storage api: Arg.Override{Type:"beam"} run posteffect add @s impact:light_pulse/20t_beam
    execute if data storage api: Arg.Override{Type:"first"} run posteffect add @s impact:bloom/20t
    execute if data storage api: Arg.Override{Type:"first"} run posteffect add @s impact:light_pulse/20t_comet
    execute if data storage api: Arg.Override{Type:"attack"} run posteffect add @s impact:bloom/100t_comet
    execute if data storage api: Arg.Override{Type:"attack"} run posteffect add @s impact:edge_flash/100t_comet
