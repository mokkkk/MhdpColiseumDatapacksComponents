#> mhdp_core:load
#
# load時実行される処理
#
# @within tag/function minecraft:load

## storage初期値設定
    execute unless data storage mhdp_core:game_data Phase run data modify storage mhdp_core:game_data Phase set value 1

## Scoreboard定義
# Mhdp基本処理用
    scoreboard objectives add MhdpCore dummy
    scoreboard objectives add Const dummy

# プレイヤー関連
    # UID
        scoreboard objectives add Ply.Uid dummy
    # 操作
        # ニンジン棒使用回数
            scoreboard objectives add Ply.Ope.UsedCoas minecraft.used:carrot_on_a_stick
        # ジャンプ回数
            scoreboard objectives add Ply.Ope.Jump minecraft.custom:minecraft.jump
        # エンダーアイ投げ捨て回数
            scoreboard objectives add Ply.Ope.DropEnderEye dropped:ender_eye
        # スニークタイマー
            scoreboard objectives add Ply.Ope.SneakTimer dummy
            scoreboard objectives add Ply.Ope.SneakInterval dummy
        # エンダーアイ使用タイマー
            scoreboard objectives add Ply.Ope.EnderEyeTimer dummy
    # 処理用タイマー
        # クエスト中・死亡演出再生用
            scoreboard objectives add Ply.Timer.DeathAnimation dummy

# モンスター関連
    # UID
        scoreboard objectives add Mns.Uid dummy

## Scoreboard初期値設定
# プレイヤーUID
    execute unless score #mhdp_player_uid_grobal Ply.Uid matches -2147483648.. run scoreboard players set #mhdp_player_uid_grobal Ply.Uid 1
# モンスターUID
    execute unless score #mhdp_monster_uid_grobal Mns.Uid matches -2147483648.. run scoreboard players set #mhdp_monster_uid_grobal Mns.Uid 1

## 定数定義
    scoreboard players set #const_20 Const 20
    scoreboard players set #const_60 Const 60
    scoreboard players set #const_100 Const 100

# 処理用のEntity配置
    # summon interaction 223 64 206 {width:1.2f,height:1.2f,Tags:["Other.Interaction.UI","Other.Interaction.Bell"]}
    # summon text_display 223 65 206 {view_range:0.1f,width:1.5f,height:1.5f,billboard:"vertical",default_background:1b,Tags:["Other.Text.Bell"],text:'{"bold":true,"color":"white","text":"クエスト出発"}'}
