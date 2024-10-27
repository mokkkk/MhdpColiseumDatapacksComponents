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
    scoreboard objectives add QuestSerialId dummy
    scoreboard objectives add Const dummy

# プレイヤー関連
    # UID
        scoreboard objectives add Ply.Uid dummy
    # HP
        scoreboard objectives add Ply.Health health
    # 操作
        # ニンジン棒使用回数
            scoreboard objectives add Ply.Ope.UsedCoas minecraft.used:carrot_on_a_stick
        # ニンジン棒投げ捨て回数
            scoreboard objectives add Ply.Ope.DropCoas dropped:carrot_on_a_stick
        # ジャンプ回数
            scoreboard objectives add Ply.Ope.Jump minecraft.custom:minecraft.jump
        # エンダーアイ投げ捨て回数
            scoreboard objectives add Ply.Ope.DropEnderEye dropped:ender_eye
        # スニークタイマー
            scoreboard objectives add Ply.Ope.SneakTimer dummy
            scoreboard objectives add Ply.Ope.SneakInterval dummy
        # エンダーアイ使用タイマー
            scoreboard objectives add Ply.Ope.EnderEyeTimer dummy
        # アイテム使用タイマー
            scoreboard objectives add Ply.Ope.EatingTimer dummy
            scoreboard objectives add Ply.Ope.EatingTimerMax dummy
            scoreboard objectives add Ply.Ope.EatingTimer.Effect dummy
        # クエスト受注のトリガー
            scoreboard objectives add Ply.Ope.AcceptedQuestId trigger
    # 処理用タイマー
        # 無敵時間
            scoreboard objectives add Ply.Timer.DamageInterval dummy
        # 回避時間
            scoreboard objectives add Ply.Timer.Avoid dummy
        # クエスト中・死亡演出再生用
            scoreboard objectives add Ply.Timer.DeathAnimation dummy
        # 先行入力
            scoreboard objectives add Ply.Timer.Buffering dummy
    # その他処理用
        # 攻撃対象の保持
            scoreboard objectives add Ply.Other.AttackTargetUuid dummy
        # 参加したクエストの連番ID
            scoreboard objectives add Ply.Other.QuestSerialId dummy

# 村人関連
    # タイマー
        scoreboard objectives add Vlg.General.Timer dummy
        scoreboard objectives add Vlg.General.Timer.Sub dummy
    # カウンター
        scoreboard objectives add Vlg.General.Counter dummy
    # 武器チュートリアル用
        # ターゲットプレイヤー
            scoreboard objectives add Vlg.WeaponTutorial.TargetPlayerUid dummy

    
# モンスター関連
    # UID
        scoreboard objectives add Mns.Uid dummy
    # その他EntityのUuid
        scoreboard objectives add Entity.Uuid dummy
    # チュートリアル用
        scoreboard objectives add Mns.Tutorial.Text dummy {"text":"チュートリアル：","color":"gold","bold":true}
        scoreboard objectives modify Mns.Tutorial.Text displayname {"text":"チュートリアル","color":"gold","bold":true,"underlined":true}

## Scoreboard初期値設定
# プレイヤーUID
    execute unless score #mhdp_player_uid_grobal Ply.Uid matches -2147483648.. run scoreboard players set #mhdp_player_uid_grobal Ply.Uid 1
# モンスターUID
    execute unless score #mhdp_monster_uid_grobal Mns.Uid matches -2147483648.. run scoreboard players set #mhdp_monster_uid_grobal Mns.Uid 1

## 定数定義
    scoreboard players set #const_2 Const 2
    scoreboard players set #const_3 Const 3
    scoreboard players set #const_20 Const 20
    scoreboard players set #const_30 Const 30
    scoreboard players set #const_60 Const 60
    scoreboard players set #const_80 Const 80
    scoreboard players set #const_100 Const 100
    scoreboard players set #const_10000 Const 10000
    scoreboard players set #const_crit_multiply_normal Const 125
    scoreboard players set #const_crit_multiply_lv1 Const 130
    scoreboard players set #const_crit_multiply_lv2 Const 135
    scoreboard players set #const_crit_multiply_lv3 Const 140
    scoreboard players set #const_crit_multiply_element Const 115
    # スライムのサイズ
        scoreboard players set #const_slime_size Const 5205

## チーム定義
    team add Team.QuestHost
    team add Team.QuestMember
    team add Team.QuestPlaying
    team add Team.NoCollision
    team modify Team.QuestPlaying color gray
    team modify Team.QuestHost prefix [{"text":"a","font":"icons/mhdp_icons"},{"text":" ","font":"default"}]
    team modify Team.QuestMember prefix [{"text":"b","font":"icons/mhdp_icons"},{"text":" ","font":"default"}]
    team modify Team.QuestPlaying prefix [{"text":"c","font":"icons/mhdp_icons"},{"text":" ","font":"default"}]
    team modify Team.NoCollision prefix [{"text":"c","font":"icons/mhdp_icons"},{"text":" ","font":"default"}]
    team modify Team.NoCollision collisionRule never

## その他
    # TSBライブラリ用
        scoreboard objectives add Global dummy
        scoreboard objectives add Temporary dummy
        scoreboard objectives add Const dummy
        scoreboard objectives add UserID dummy
        scoreboard objectives add AttackedEntity dummy
        scoreboard objectives add Lib dummy
        scoreboard players set $2 Const 2
        scoreboard players set $2^15 Const 32768
        scoreboard players set $2^16 Const 65536
        scoreboard players set $10 Const 10
        scoreboard players set $100 Const 100
        scoreboard players set $31743 Const 31743
        scoreboard players set $65536 Const 65536

## アイテム用ロード処理
    function mhdp_items:load

## モンスター用ロード処理
    function mhdp_monsters:load

# 以下、デバッグ時に適宜モンスター個別のinit処理を記述
    function mhdp_monster_tutorial_01:core/init/init_monster_data
    function mhdp_monster_karakuri:core/init/init_monster_data

# 体験版用処理
    data modify storage mhdp_core:game_data IsBetaVersion set value true
