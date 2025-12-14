#> api:damage_entity_to_player/get_damage_reduction
#
# プレイヤーのステータス取得
#
# @input storage api: Arg.

# 初期値
    scoreboard players set #mhdp_temp_damage_reduction MhdpCore 100

# ハイパーアーマー時、ダメージ半減
    execute if entity @s[tag=Ply.Weapon.Armor.Hyper] if score #mhdp_temp_damage_reduction MhdpCore matches 100.. run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 50
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] if score #mhdp_temp_damage_reduction MhdpCore matches 100.. run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 50

# 加護
    function api:damage_entity_to_player/skill/damage_reduction
