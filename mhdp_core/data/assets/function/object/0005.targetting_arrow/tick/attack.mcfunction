#> assets:object/0005.targetting_arrow/tick/attack
#
# 矢の召喚処理
#
# @within function assets:object/0005.targetting_arrow/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 5.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    tag @n[type=slime,tag=Mns.HitBox,tag=5.TargetEntity] add Temp.Victim

# 型ごとの処理実行
    execute unless entity @s[tag=5.IsTec] run function assets:object/0005.targetting_arrow/tick/attack_normal
    execute if entity @s[tag=5.IsTec] run function assets:object/0005.targetting_arrow/tick/attack_tec

# 2ヒット後、削除
    tag @a remove 5.TargetPlayer
    scoreboard players add @s MhdpCore 1
    execute if score @s MhdpCore matches 2.. run tag @s add 5.Death
    execute if entity @s[tag=5.Death] run kill @s
