#> mhdp_items:weapons/great_sword/type_tec/1_charge/start_with_stance
#
# 溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# 剣を回すアニメーションをスキップ
    execute at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}
    scoreboard players set @s Wpn.GeneralTimer 6
    scoreboard players set @s Wpn.AnimationTimer 6
    function api:weapon_operation/attribute_movestop
    tag @s add Ply.Weapon.NoMoveJump

# タグ付与
    tag @s add Wpn.Gs.Tec.Charge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 2
