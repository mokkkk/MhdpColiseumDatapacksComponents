#> mhdp_monsters:core/util/tick/end_anger.m
# 
# 汎用処理 怒り終了
#
# @within function mhdp_monsters:core/util/tick/tick

# 怒り状態終了
    tag @s remove Mns.State.IsAnger

# ボスバー名更新
    $function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"$(Name)",State:"battle"}

# 存在すれば、モデル変更
    $function mhdp_monster_$(Name):core/util/models/anger_end
