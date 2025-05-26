#> mhdp_items:weapons/short_sword/type_tec/23_tobikage/start
#
# 飛影 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/23_tobikage/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Tec.Tobikage
    tag @s remove Ply.Weapon.NoOpe

# attribute設定
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# 演出
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2

# 翔蟲使用中の場合、クールタイムを伸ばす
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run tag @s add Itm.Sp.Wirebug.UsedSkill
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run scoreboard players set @s Itm.Wirebug.CoolTime 400

# 終了
    tag @s remove Ply.Flag.SpJumpAttack

# say 武器操作：片手剣 飛影