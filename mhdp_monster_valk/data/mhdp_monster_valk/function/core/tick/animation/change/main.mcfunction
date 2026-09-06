#> mhdp_monster_valk:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# デバッグ用
    # execute as @a run function debug:check_hate {"Name":"Valk"}

# 事前処理
    # アニメーションが停止しないよう、とりあえず待機アニメーションを再生
    # 後の処理でアニメーションを上書きする
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] run function animated_java_valk:valk/animations/lance_idle/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.Valk.State.IsShoot] run function animated_java_valk:valk/animations/shoot_idle/tween {duration:1, to_frame: 0}

# 共通処理
    # Animタグがすでについているか確認
    # 軸合わせ後の行動、およびコンボ攻撃実装のため
        function mhdp_monsters:core/util/tick/check_animation_tag
    # ターゲット存在確認
        function mhdp_monster_valk:core/tick/on_battle/check_target
    # 怒り終了
        execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches ..0 run function mhdp_monster_valk:core/damage/reaction/anger_end

# 非発見時
    # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 0 run function mhdp_monster_valk:core/tick/animation/change/on_relax/main
# 警戒時
    # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 1 run function mhdp_monster_valk:core/tick/animation/change/on_caution/main
# 戦闘時
    # execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 2 run function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 軸合わせアニメーション再生
    execute if entity @s[tag=Mns.Temp.IsTurn] store result score #mhdp_temp_result MhdpCore run function mhdp_monster_valk:core/tick/animation/change/play/turn

# アニメーション再生
    execute if entity @s[tag=!Mns.Temp.IsTurn,tag=!Mns.Temp.IsTurn.Big] run function mhdp_monster_valk:core/tick/animation/change/play/main

# 終了
    tag @s remove Mns.Temp.IsTurn
    tag @s remove Mns.Temp.Anim.IsFirstContact
    tag @s remove Mns.Temp.IsAlreadyAnimation
