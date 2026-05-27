#> mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/start_from_soaring
#
# 気刃兜割 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.HelmBreaker
    tag @s add Ply.Ope.IsAir
    tag @s remove Ply.Flag.Hit
    tag @s remove Ply.Weapon.NoOpe

# タイマー上書き
    scoreboard players set @s Wpn.GeneralTimer 8
    scoreboard players set @s Wpn.AnimationTimer 8

# 操作表示
    function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.helmbreaker"}

# 移動制限
    function api:weapon_operation/attribute_movestop
    tag @s add Ply.Weapon.NoMoveJump
