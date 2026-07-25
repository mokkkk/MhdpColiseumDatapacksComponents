#> mhdp_monster_dino:core/debug/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 実行者変更
    execute unless entity @s[type=item_display,tag=Mns.Root.Dino] as @n[type=item_display,tag=Mns.Root.Dino] at @s run return run function mhdp_monster_dino:core/debug/interrupt

# 攻撃データ更新のため、register実行
    function mhdp_monster_dino:core/register

# 通常再生
    # タグ付与
        # tag @s add Anim.Anger
        function mhdp_monster_dino:core/tick/animation/change/play/tail
    # 軸合わせ
        # tag @s add Mns.Temp.IsTurn
        # scoreboard players set @s Mns.General.TurnCount 2
    # アニメーション変更
        function mhdp_monster_dino:core/tick/animation/change/main

# 強制再生
    # function animated_java_dino:dino/animations/damage_counter_tail_left_start/tween {duration:1, to_frame: 1}

# 強制リアクション
    # function mhdp_monster_dino:core/damage/reaction/anger
