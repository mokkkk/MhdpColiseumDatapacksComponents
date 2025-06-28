#> mhdp_items:weapons/bow/type_tec/12_targetting_shot/start
#
# 昇天煌弓・箭射 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.TargettingShot
    tag @s remove Ply.Weapon.NoOpe
    tag @s remove Ply.Weapon.StaminaNotRegen

# 狩技使用開始
    tag @s add Ply.Weapon.UsingArts.2

# 演出
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.7
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.9
    execute anchored eyes positioned ~ ~ ~ run particle flash ^ ^ ^1 0.5 0.5 0.5 0 3
    particle end_rod ~ ~1.6 ~ 0.5 0.5 0.5 0.1 10
