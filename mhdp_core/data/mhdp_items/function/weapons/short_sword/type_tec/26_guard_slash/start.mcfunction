#> mhdp_items:weapons/short_sword/type_tec/26_guard_slash/start
#
# ガード斬り 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 狩技発動条件を満たしている場合、狩技を発動する
    execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeyBack] if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run return run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/start

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.GuardSlash
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 ガード斬り