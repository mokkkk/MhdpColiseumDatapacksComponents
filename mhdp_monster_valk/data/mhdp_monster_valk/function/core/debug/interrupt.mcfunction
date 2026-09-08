#> mhdp_monster_valk:core/debug/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 実行者変更
    execute unless entity @s[type=item_display,tag=Mns.Root.Valk] as @n[type=item_display,tag=Mns.Root.Valk] at @s run return run function mhdp_monster_valk:core/debug/interrupt

# 攻撃データ更新のため、register実行
    function mhdp_monster_valk:core/register

# 通常再生
    # タグ付与
        tag @s add Anim.Upper.R
        # function mhdp_monster_valk:core/tick/animation/change/play/tail_jump
    # 軸合わせ
        # tag @s add Mns.Temp.IsTurn
        # scoreboard players set @s Mns.General.TurnCount 2
    # アニメーション変更
        function mhdp_monster_valk:core/tick/animation/change/main

# 強制再生
    # function animated_java_valk:valk/animations/roundforce_interrupt/tween {duration:1, to_frame: 1}

# 強制リアクション
    # function mhdp_monster_valk:core/damage/reaction/anger
