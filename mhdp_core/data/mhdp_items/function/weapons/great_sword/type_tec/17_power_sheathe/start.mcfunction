#> mhdp_items:weapons/great_sword/type_tec/17_power_sheathe/start
#
# 強化納刀 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.PowerSheathe
    tag @s remove Ply.Weapon.NoOpe

# ゲージ消費
    # scoreboard players set @s Ply.Stats.Arts.1 0
    # scoreboard players set @s Ply.Stats.Arts.1.Percent 0

# 演出
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.7
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.9
    execute anchored eyes positioned ~ ~ ~ run particle flash ^ ^ ^1 0.5 0.5 0.5 0 3
    particle end_rod ~ ~1.6 ~ 0.5 0.5 0.5 0.1 10
