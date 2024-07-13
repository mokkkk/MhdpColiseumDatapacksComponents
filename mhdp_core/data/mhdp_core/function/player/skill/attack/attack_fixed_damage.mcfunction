#> mhdp_core:player/skill/attack/attack_fixed_damage
#
# プレイヤーからモンスターに対してのダメージ処理
#
# @within function mhdp_core:player/damage/player_to_entity/main_fixed_damage

# ボマー
    execute if data storage mhdp_core:temp Damage{AttackType:"Bomb"}
