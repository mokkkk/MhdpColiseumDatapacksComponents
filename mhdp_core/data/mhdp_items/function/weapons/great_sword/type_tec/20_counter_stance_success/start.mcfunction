#> mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/start
#
# 威姿呵成の構え 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.2 0 0 0 0 1
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# タグ付与
    tag @s add Wpn.Gs.Tec.CounterStance.Success
    tag @s remove Ply.Weapon.NoOpe
