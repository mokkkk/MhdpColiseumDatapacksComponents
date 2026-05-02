#> mhdp_items:weapons/lance/type_normal/22_guard_rage/start
#
# ガードレイジ 開始
#
# @within function mhdp_items:weapons/lance/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.GuardRage
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.Guard
    tag @s add Ply.Weapon.StaminaNotRegen

# ゲージ消費
    scoreboard players set @s Ply.Stats.Arts.1 0
    scoreboard players set @s Ply.Stats.Arts.1.Percent 0

# 演出
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.7
    execute anchored eyes positioned ~ ~ ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.5 0.5 0.5 0 3
    particle end_rod ~ ~1.6 ~ 0.5 0.5 0.5 0.1 10

# say 武器操作：ランス ガードレイジ