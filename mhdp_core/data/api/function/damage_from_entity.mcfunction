#> api:damage_from_entity
#
# エンティティからのダメージ処理
#
# @input storage api: Arg.

# 攻撃者保持
    tag @s add Temp.Attacker

# プレイヤー対象
    execute if entity @a[tag=Temp.Victim] as @a[tag=Temp.Victim] run function api:damage_entity_to_player

# 建造物対象

# 他モンスター対象
