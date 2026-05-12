#> mhdp_monster_ranposu:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 事前処理
    # 待機アニメーション再生、動作する場合は後の処理でアニメーションを上書き
        execute if score @s Mns.General.Phase matches 0 run function animated_java:ranposu/animations/idle_relax/tween {duration:1, to_frame: 0}
        execute unless score @s Mns.General.Phase matches 0 run function animated_java:ranposu/animations/idle/tween {duration:1, to_frame: 0}

# 共通処理
    # Animタグがすでについているか確認
    # 軸合わせ後の行動、およびコンボ攻撃実装のため
        function mhdp_monsters:core/util/tick/check_animation_tag

# 非発見時
    execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_ranposu:core/tick/animation/change/on_relax/main
# 警戒時
    execute if score @s Mns.General.Phase matches 1 run function mhdp_monster_ranposu:core/tick/animation/change/on_caution/main
# 戦闘時
    execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/main

# # 事前処理
#     # 発見
#         execute if entity @s[tag=!Mns.State.IsBattle] if score @s Mns.General.SearchTimer matches 2000.. run tag @s add Mns.Temp.IsFirstContact
#         execute if entity @s[tag=Mns.Temp.IsFirstContact,tag=!Mns.State.IsBattle] run tag @s add Mns.State.IsBattle
#     # 非戦闘時は警戒アニメーションのみ再生
#         execute if entity @s[tag=!Mns.State.IsBattle] if entity @n[tag=Ply.State.MnsTarget] run function animated_java:ranposu/animations/search/tween {duration:1, to_frame: 0}
#         execute if entity @s[tag=!Mns.State.IsBattle] run return 0

# # 共通処理
#     # Animタグがすでについているか確認
#         function mhdp_monsters:core/util/tick/check_animation_tag
#     # 連続行動回数加算
#         execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] run scoreboard players add @s Mns.General.ActCount.Target 1
#     # 怒り終了
#         execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches ..0 run function mhdp_monster_ranposu:core/damage/reaction/anger_end

# # ターゲット更新
#     # ターゲットがいない場合
#         execute unless entity @e[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/animation/change/update_target
#     # 一定以上行動した場合
#         execute if score @s Mns.General.ActCount.Target matches ..4 run function mhdp_monster_ranposu:core/tick/animation/change/update_target

# # 非怒り中・一定以上行動した場合、威嚇を選択(そのまま処理中断)
#     execute if entity @s[tag=!Mns.State.IsAnger,tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.ActCount.Idle matches 7.. run return run function mhdp_monsters:core/util/tick/skip

# # アニメーション選択
# # デバッグ時はここをコメントアウト
#     # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation,tag=!Mns.Temp.IsTurn,tag=!Mns.State.IsNotMove] if entity @e[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/animation/change/random/main

# 軸合わせアニメーション再生
    execute if entity @s[tag=Mns.Temp.IsTurn] run function mhdp_monster_ranposu:core/tick/animation/change/play/turn

# アニメーション再生(軸合わせ以外)
    execute if entity @s[tag=!Mns.Temp.IsTurn] run function mhdp_monster_ranposu:core/tick/animation/change/play/main

# 終了
    tag @s remove Mns.Temp.IsTurn
    tag @s remove Mns.Temp.Anim.IsFirstContact
    tag @s remove Mns.Temp.IsAlreadyAnimation
