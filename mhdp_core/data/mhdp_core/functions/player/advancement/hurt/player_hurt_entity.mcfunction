#> mhdp_core:player/advancement/hurt/player_hurt_entity
#
# 進捗 与ダメージ時
#
# @within advancement mhdp_core:player/hurt/player_hurt_entity

# タグ付与
    tag @s add Ply.Adv.Hurt.PlayerHurtEntity

# 終了
    advancement revoke @s only mhdp_core:player/hurt/player_hurt_entity
