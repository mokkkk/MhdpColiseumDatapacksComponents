#> mhdp_monster_valk:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 事前処理
    # 待機アニメーション再生、動作する場合は後の処理でアニメーションを上書き
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] run function animated_java:valk_aj/animations/lance_idle/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.Valk.State.IsShoot] run function animated_java:valk_aj/animations/shoot_idle/tween {duration:1, to_frame: 0}
    # 発見
        execute if entity @s[tag=!Mns.State.IsBattle] if score @s Mns.General.SearchTimer matches 2000.. run tag @s add Mns.Temp.IsFirstContact
        execute if entity @s[tag=Mns.Temp.IsFirstContact,tag=!Mns.State.IsBattle] run tag @s add Mns.State.IsBattle
    # 非戦闘時は警戒アニメーションのみ再生
        execute if entity @s[tag=!Mns.State.IsBattle] if entity @n[tag=Ply.State.MnsTarget] run function animated_java:valk_aj/animations/lance_search/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=!Mns.State.IsBattle] run return 0

# 共通処理
    # Animタグがすでについているか確認
        function mhdp_monsters:core/util/tick/check_animation_tag
    # 連続行動回数加算
        execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] run scoreboard players add @s Mns.General.ActCount.Target 1
    # 怒り終了
        execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation,tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches ..0 run function mhdp_monster_valk:core/damage/reaction/anger_end

# ターゲット更新
    # ターゲットがいない場合
        execute unless entity @e[tag=Mns.Target.Valk] run function mhdp_monster_valk:core/tick/animation/change/update_target
    # 一定以上行動した場合
        execute if score @s Mns.General.ActCount.Target matches 6.. run function mhdp_monster_valk:core/tick/animation/change/update_target

# 非怒り中・一定以上行動した場合、威嚇を選択(そのまま処理中断)
    execute if entity @s[tag=!Mns.State.IsAnger,tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.ActCount.Idle matches 18.. run return run function mhdp_monsters:core/util/tick/skip

# アニメーション選択
    # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation,tag=!Mns.Temp.IsTurn] if entity @e[tag=Mns.Target.Valk] run function mhdp_monster_valk:core/tick/animation/change/random/main

# 軸合わせアニメーション再生
    execute if entity @s[tag=Mns.Temp.IsTurn] store result score #mhdp_temp_result MhdpCore run function mhdp_monster_valk:core/tick/animation/change/play/turn
    # 軸合わせ不要な場合、すぐアニメーションを再生する
        execute if score #mhdp_temp_result MhdpCore matches 99 run tag @s remove Mns.Temp.IsTurn
    scoreboard players reset #mhdp_temp_result MhdpCore

# 軸合わせしない場合、攻撃アニメーション再生・タグ消去
    execute if entity @s[tag=!Mns.Temp.IsTurn,tag=!Mns.Temp.IsTurn.Big] run function mhdp_monster_valk:core/tick/animation/change/play/main

# 終了
    tag @s remove Mns.Temp.IsTurn
    tag @s remove Mns.Temp.IsTurn.Big
    tag @s remove Mns.Temp.IsFirstContact
    tag @s remove Mns.Temp.IsAlreadyAnimation
