#> mhdp_items:weapons/short_sword/type_normal/23_tobikage/start
#
# 飛影 開始
#
# @within function mhdp_items:weapons/short_sword/type_normal/23_tobikage/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Normal.Tobikage

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# 翔蟲演出
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    tag @s add Itm.Sp.Wirebug.UsedSkill
    scoreboard players set @s Itm.Wirebug.CoolTime 400

say 片手剣 飛影