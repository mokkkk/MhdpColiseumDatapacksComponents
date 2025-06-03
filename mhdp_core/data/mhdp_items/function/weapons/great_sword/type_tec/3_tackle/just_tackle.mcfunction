#> mhdp_items:weapons/great_sword/type_tec/3_tackle/just_tackle
#
# タックル 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.2 0 0 0 0 1
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# タグ付与
    tag @s add Ply.Flag.Gs.JustTackle
