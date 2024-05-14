#> mhdp_items:load
#
# アイテム処理用のスコア定義
#
# @within function mhdp_items:/**

## Scoreboard定義
# プレイヤーのステータス
    # スタミナ
        scoreboard objectives add Ply.Stats.Stamina dummy
    # スタミナのペナルティ時間
        scoreboard objectives add Ply.Stats.StaminaPenaltyTimer dummy
# 武器共通処理
    # 武器の操作処理用
        scoreboard objectives add Wpn.GeneralTimer dummy
    # 武器の演出操作用、ヒットストップの表現のため操作と分ける
        scoreboard objectives add Wpn.AnimationTimer dummy
    # 武器のヒットストップ時間
        scoreboard objectives add Wpn.HitStopTimer dummy

## init
    function mhdp_items:core/init/item_data
