#> mhdp_monster_ranposu:core/debug/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 実行者変更
    execute unless entity @s[type=item_display,tag=Mns.Root.Ranposu] as @n[type=item_display,tag=Mns.Root.Ranposu] run return run function mhdp_monster_ranposu:core/debug/interrupt

# 通常再生
    # タグ付与
        tag @s add Anim.Bite
        # function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump
    # 軸合わせ
        tag @s add Mns.Temp.IsTurn
        scoreboard players set @s Mns.General.TurnCount 2
    # アニメーション変更
        function mhdp_monster_ranposu:core/tick/animation/change/main

# 強制再生
    # function animated_java:ranposu/animations/idle/tween {duration:1, to_frame: 1}

# 強制リアクション
    # function mhdp_monster_ranposu:core/damage/reaction/anger
