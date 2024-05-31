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
    # 武器のガード硬直時間
        scoreboard objectives add Wpn.GuardStopTimer dummy
    # 武器の使用停止時間
        scoreboard objectives add Wpn.DeactivateTimer dummy
# 武器ごとの特殊スコア
    # 大剣
        # 溜め時間
            scoreboard objectives add Wpn.Gs.ChargeTimer dummy
        # 溜め段階
            scoreboard objectives add Wpn.Gs.ChargeCount dummy
        # 溜め斬り段階
            scoreboard objectives add Wpn.Gs.ChargeSlashCount dummy
# 特殊装具ごとの特殊スコア
    # 翔蟲
        # 処理タイマー
            scoreboard objectives add Itm.Wirebug.GeneralTimer dummy
        # クールタイム
            scoreboard objectives add Itm.Wirebug.CoolTime dummy

## init
    function mhdp_items:core/init/item_data
