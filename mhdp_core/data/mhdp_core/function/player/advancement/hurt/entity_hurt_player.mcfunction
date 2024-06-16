#> mhdp_core:player/advancement/hurt/entity_hurt_player
#
# 進捗 被ダメージ時
#
# @within advancement mhdp_core:player/hurt/entity_hurt_player

# タグ付与
    tag @s add Ply.Adv.Hurt.EntityHurtPlayer

# 体力を確認し、0の場合死亡時処理実行
    execute if entity @s[nbt={Health:0.0f}] at @s run function mhdp_core:player/death/in_advancement

# 終了
    advancement revoke @s only mhdp_core:player/hurt/entity_hurt_player
