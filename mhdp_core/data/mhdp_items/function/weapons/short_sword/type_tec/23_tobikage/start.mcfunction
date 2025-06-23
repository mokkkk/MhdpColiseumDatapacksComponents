#> mhdp_items:weapons/short_sword/type_tec/23_tobikage/start
#
# 飛影 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/23_tobikage/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.Tobikage
    tag @s remove Ply.Weapon.NoOpe

# 演出
    particle flash ~ ~1.65 ~ 0 0 0 0 1
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2

# 翔蟲使用中の場合、クールタイムを伸ばす
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run tag @s add Itm.Sp.Wirebug.UsedSkill
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run scoreboard players set @s Itm.Wirebug.CoolTime 400

# 終了
    tag @s remove Ply.Flag.SpJumpAttack

# say 武器操作：片手剣 飛影