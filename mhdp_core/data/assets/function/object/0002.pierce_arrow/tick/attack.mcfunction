#> assets:object/0002.pierce_arrow/tick/attack
#
# 矢の召喚処理
#
# @within function assets:object/0002.pierce_arrow/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 2.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    tag @n[type=slime,tag=Mns.HitBox] add Temp.Victim

# 型ごとの処理実行
    execute unless entity @s[tag=2.IsTec] run function assets:object/0002.pierce_arrow/tick/attack_normal

# 終了
    tag @a remove 2.TargetPlayer
