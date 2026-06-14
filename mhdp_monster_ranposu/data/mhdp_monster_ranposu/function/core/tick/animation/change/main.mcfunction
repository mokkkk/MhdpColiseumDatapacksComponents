#> mhdp_monster_ranposu:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 事前処理
    # アニメーションが停止しないよう、とりあえず待機アニメーションを再生
    # 後の処理でアニメーションを上書きする
        execute if score @s Mns.General.Phase matches 0 run function animated_java_ranposu:ranposu/animations/idle_relax/tween {duration:1, to_frame: 0}
        execute unless score @s Mns.General.Phase matches 0 run function animated_java_ranposu:ranposu/animations/idle/tween {duration:1, to_frame: 0}

# 共通処理
    # Animタグがすでについているか確認
    # 軸合わせ後の行動、およびコンボ攻撃実装のため
        function mhdp_monsters:core/util/tick/check_animation_tag
    # ターゲット存在確認
        function mhdp_monster_ranposu:core/tick/on_battle/check_target
    # 怒り終了
        execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches ..0 run function mhdp_monsters:core/util/tick/end_anger.m {Name:"ranposu"}

# 非発見時
    execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 0 run function mhdp_monster_ranposu:core/tick/animation/change/on_relax/main
# 警戒時
    execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 1 run function mhdp_monster_ranposu:core/tick/animation/change/on_caution/main
# 戦闘時
    # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 2 run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/main

# 軸合わせアニメーション再生
    execute if entity @s[tag=Mns.Temp.IsTurn] run function mhdp_monster_ranposu:core/tick/animation/change/play/turn

# アニメーション再生
    execute if entity @s[tag=!Mns.Temp.IsTurn] run function mhdp_monster_ranposu:core/tick/animation/change/play/main

# 終了
    tag @s remove Mns.Temp.IsTurn
    tag @s remove Mns.Temp.Anim.IsFirstContact
    tag @s remove Mns.Temp.IsAlreadyAnimation
