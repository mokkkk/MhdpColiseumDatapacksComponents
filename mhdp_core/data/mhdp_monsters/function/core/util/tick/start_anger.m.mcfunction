#> mhdp_monsters:core/util/tick/start_anger.m
# 
# 汎用処理 怒り開始
#
# @within function mhdp_monsters:core/util/tick/tick

# 怒り状態開始
    tag @s add Mns.State.IsAnger
    scoreboard players operation @s Mns.Anger.Timer = @s Mns.Anger.Timer.Max

# ボスバー名更新
    $function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"$(Name)",State:"anger"}
