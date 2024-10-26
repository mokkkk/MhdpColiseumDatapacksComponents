#> mhdp_monster_karakuri:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_karakuri:core/summon/summon_init

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# モード設定
    tag @s add Mns.Karakuri.Mode.Idle

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:karakuri_aj/animations/idle/play
