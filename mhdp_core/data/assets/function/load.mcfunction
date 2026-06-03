#> assets:load
#
# load時実行される処理
#
# @within tag/function minecraft:load

# asset関連
    # ID
        scoreboard objectives add ObjectId dummy
    # 建造物固有ID
        scoreboard objectives add Build.Uid dummy
    # 処理用
        scoreboard objectives add ObjectTick dummy
    # 建造物ステータス
        # 耐久力
            scoreboard objectives add Build.Stats.Hp dummy
        # 設置時間
            scoreboard objectives add Build.Stats.RemainingTime dummy
        # 高さ
            scoreboard objectives add Build.Stats.Height dummy
        # 押し出しの強さ
            scoreboard objectives add Build.Stats.JumpStrength dummy
        # ダメージインターバル
            scoreboard objectives add Build.Stats.DamageInterval dummy
