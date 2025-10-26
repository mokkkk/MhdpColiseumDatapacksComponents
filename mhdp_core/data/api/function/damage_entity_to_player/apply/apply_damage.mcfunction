#> api:damage_entity_to_player/apply/apply_damage
#
# エンティティからプレイヤーに与えるダメージ処理 ダメージ適用
#
# @input storage api: Arg.

# ダメージ
    $damage @s $(TotalDamage) minecraft:generic by @n[type=slime]
