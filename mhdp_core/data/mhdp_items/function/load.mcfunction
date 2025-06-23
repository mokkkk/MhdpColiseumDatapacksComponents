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
    # 攻撃力
        scoreboard objectives add Ply.Stats.AttackValue dummy
    # 会心率
        scoreboard objectives add Ply.Stats.CritValue dummy
    # 属性値
        scoreboard objectives add Ply.Stats.ElementValue.Fire dummy
        scoreboard objectives add Ply.Stats.ElementValue.Water dummy
        scoreboard objectives add Ply.Stats.ElementValue.Thunder dummy
        scoreboard objectives add Ply.Stats.ElementValue.Ice dummy
        scoreboard objectives add Ply.Stats.ElementValue.Dragon dummy
    # 状態異常値
        scoreboard objectives add Ply.Stats.ConditionValue.Poison dummy
        scoreboard objectives add Ply.Stats.ConditionValue.Paralysis dummy
        scoreboard objectives add Ply.Stats.ConditionValue.Bomb dummy
    # 防御力
        scoreboard objectives add Ply.Stats.DefenceValue dummy
        scoreboard objectives add Ply.Stats.DefenceValue.Fire dummy
        scoreboard objectives add Ply.Stats.DefenceValue.Water dummy
        scoreboard objectives add Ply.Stats.DefenceValue.Thunder dummy
        scoreboard objectives add Ply.Stats.DefenceValue.Ice dummy
        scoreboard objectives add Ply.Stats.DefenceValue.Dragon dummy
    # 斬れ味
        scoreboard objectives add Ply.Stats.CurrentSharpnessColor dummy
    # 狩技ゲージ
        scoreboard objectives add Ply.Stats.Arts.1 dummy
        scoreboard objectives add Ply.Stats.Arts.1.Max dummy
        scoreboard objectives add Ply.Stats.Arts.2 dummy
        scoreboard objectives add Ply.Stats.Arts.2.Max dummy
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
    # 武器の無操作取得用
        scoreboard objectives add Wpn.NoOpeTimer dummy
# 武器ごとの特殊スコア
    # 大剣
        # 溜め時間
            scoreboard objectives add Wpn.Gs.ChargeTimer dummy
        # 溜め段階
            scoreboard objectives add Wpn.Gs.ChargeCount dummy
        # 溜め斬り段階
            scoreboard objectives add Wpn.Gs.ChargeSlashCount dummy
    # 片手剣
        # 溜め時間
            scoreboard objectives add Wpn.Ss.ChargeTimer dummy
        # 溜め段階
            scoreboard objectives add Wpn.Ss.ChargeCount dummy
    # 弓
        # 溜め時間
            scoreboard objectives add Wpn.Bw.ChargeTimer dummy
        # 溜め段階
            scoreboard objectives add Wpn.Bw.ChargeCount dummy
        # 導ノ矢効果時間
            scoreboard objectives add Wpn.Bw.HormingTimer dummy
        # 導ノ矢ホーミングターゲット
            scoreboard objectives add Wpn.Bw.HormingTarget dummy
        # 仕込み矢ゲージ
            scoreboard objectives add Wpn.Bw.Gauge dummy
        # ビン種別
            scoreboard objectives add Wpn.Bw.Bottle.Type dummy
        # ビン本数
            scoreboard objectives add Wpn.Bw.Bottle.Count dummy
        # 飛翔睨み撃ち回数
            scoreboard objectives add Wpn.Bw.FlyingShot.Count dummy
# 特殊装具ごとの特殊スコア
    # 砥石
        # 処理タイマー
            scoreboard objectives add Itm.Whetstone.GeneralTimer dummy
    # 肉焼きセット
        # 処理タイマー
            scoreboard objectives add Itm.Nikuyaki.GeneralTimer dummy
    # 翔蟲
        # 処理タイマー
            scoreboard objectives add Itm.Wirebug.GeneralTimer dummy
        # クールタイム
            scoreboard objectives add Itm.Wirebug.CoolTime dummy
    # 不動の装衣
        # 処理タイマー
            scoreboard objectives add Itm.ImmovableCloth.GeneralTimer dummy
        # クールタイム
            scoreboard objectives add Itm.ImmovableCloth.CoolTime dummy
        
## 定数定義
    # 強撃ビン補正値
        scoreboard players set #const_bow_bottle_strong_multiply Const 125
    # 導ノ矢補正値
        scoreboard players set #const_bow_horming_multiply Const 120

## init
    function mhdp_items:core/init/item_data
    function mhdp_items:core/init/weapon_data
