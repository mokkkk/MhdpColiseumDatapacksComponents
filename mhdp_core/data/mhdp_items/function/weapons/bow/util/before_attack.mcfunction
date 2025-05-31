#> mhdp_items:weapons/bow/util/before_attack
#
# 弓攻撃開始時の共通処理
#
# @within function mhdp_items:core/*

# アニメーション停止
    function mhdp_items:weapons/bow/util/stop_all_animations

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# attributeリセット
    function mhdp_items:weapons/bow/util/set_status

# 先行入力解除
    function mhdp_items:core/buffering/reset
