#> mhdp_monster_ranposu:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 連続行動回数加算
    scoreboard players add @s Mns.General.ActCount.Target 1

# ターゲット更新
    # ターゲットがいない場合
        execute unless entity @e[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/animation/change/update_target
    # 一定以上行動した場合
        execute if score @s Mns.General.ActCount.Target matches ..4 run function mhdp_monster_ranposu:core/tick/animation/change/update_target

# 待機アニメーション再生、動作する場合は後の処理でアニメーションを上書き
    function animated_java:ranposu_aj/animations/idle/tween {duration:1, to_frame: 0}

# 非怒り中・一定以上行動した場合、威嚇を選択(そのまま処理中断)
    # execute if score @s Mns.General.ActCount.Idle matches 6..

# TODO:アニメーション選択
# 内部で軸合わせ有無の取得をする
    # 
    # execute if entity @s[tag=!Mns.Temp.IsCombo] run function mhdp_monster_ranposu:core/tick/animation/change/get_turn

# 軸合わせアニメーション再生
    execute if entity @s[tag=Mns.Temp.IsTurn] store result score #mhdp_temp_result MhdpCore run function mhdp_monster_ranposu:core/tick/animation/change/play/turn
    # 軸合わせ不要な場合、すぐアニメーションを再生する
        execute if score #mhdp_temp_result MhdpCore matches 99 run tag @s remove Mns.Temp.IsTurn
    scoreboard players reset #mhdp_temp_result MhdpCore

# 軸合わせしない場合、攻撃アニメーション再生・タグ消去
    execute if entity @s[tag=!Mns.Temp.IsTurn] run function mhdp_monster_ranposu:core/tick/animation/change/play/main

# 終了
    tag @s remove Mns.Temp.IsTurn
