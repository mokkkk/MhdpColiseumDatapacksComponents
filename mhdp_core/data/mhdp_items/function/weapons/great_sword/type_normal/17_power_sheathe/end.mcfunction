#> mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/end
#
# 溜め 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/main

# タグ消去
    tag @s remove Wpn.Gs.Normal.PowerSheathe

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 狩技1の効果発動開始
    tag @s add Ply.Weapon.UsingArts.1

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# 効果音
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 納刀
    function mhdp_items:player/weapon/sheathe/force_sheathe
