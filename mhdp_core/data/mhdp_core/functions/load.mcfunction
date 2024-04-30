#> mhdp_core:load
#
# load時実行される処理
#
# @within tag/function minecraft:load

## Scoreboard定義
# Mhdp基本処理用
    scoreboard objectives add MhdpCore dummy

# プレイヤー関連
    # UID
        scoreboard objectives add Ply.Uid dummy
    # 操作
        # ニンジン棒使用回数
            scoreboard objectives add Ply.Event.UsedCoas minecraft.used:carrot_on_a_stick
        # ジャンプ回数
            scoreboard objectives add Ply.Event.Jump minecraft.custom:minecraft.jump
        # エンダーアイ投げ捨て回数
            scoreboard objectives add Ply.Event.DropEnderEye dropped:ender_eye
        # スニークタイマー
            scoreboard objectives add Ply.Event.SneakTimer dummy
            scoreboard objectives add Ply.Event.SneakInterval dummy
        # エンダーアイ使用タイマー
            scoreboard objectives add Ply.Event.EnderEyeTimer dummy

# モンスター関連
    # UID
        scoreboard objectives add Mns.Uid dummy

## Scoreboard初期値設定
# プレイヤーUID
    execute unless score #mhdp_player_uid_grobal Ply.Uid matches -2147483648.. run scoreboard players set #mhdp_player_uid_grobal Ply.Uid 1
# モンスターUID
    execute unless score #mhdp_monster_uid_grobal Mns.Uid matches -2147483648.. run scoreboard players set #mhdp_monster_uid_grobal Mns.Uid 1
