#> mhdp_items:weapons/great_sword/type_tec/33_rage_charge/start
#
# 震怒竜怨斬 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.RageCharge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0

# ゲージ消費
    scoreboard players set @s Ply.Stats.Arts.2 0
    scoreboard players set @s Ply.Stats.Arts.2.Percent 0

# 演出
    playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.5
    playsound minecraft:block.trial_spawner.ominous_activate master @s ~ ~ ~ 3 0.7
    execute anchored eyes positioned ~ ~ ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.5 0.5 0.5 0 3
    particle end_rod ~ ~1.6 ~ 0.5 0.5 0.5 0.1 10

# say 武器操作：大剣・震怒竜怨斬