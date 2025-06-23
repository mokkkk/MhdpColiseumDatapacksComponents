#> mhdp_monster_karakuri:core/damage/reaction/counter
#
# 怯みリアクション 相殺
#
# @within function mhdp_monster_ranposu:core/damage/damage

# 共通処理
    # 相殺大成功
        data modify storage api: Return.CounterSuccess set value true

# アニメーション再生処理
    # アニメーション再生
        function animated_java:karakuri_aj/animations/damage_counter/tween {duration:1, to_frame: 0}
    # 遷移タイマー初期化
        scoreboard players set @s Mns.General.DummyTimer 0
    # タグ消去
        tag @s remove Mns.Karakuri.Attack.Head
