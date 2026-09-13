#> mhdp_monster_valk:core/debug/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 実行者変更
    execute unless entity @s[type=item_display,tag=Mns.Root.Valk] as @n[type=item_display,tag=Mns.Root.Valk] at @s run return run function mhdp_monster_valk:core/debug/interrupt

# 攻撃データ更新のため、register実行
    function mhdp_monster_valk:core/register

# 通常攻撃用
    # タグ付与
        tag @s add Anim.MoveBack
        # execute positioned as @p[tag=Mns.Target.Valk] run summon area_effect_cloud ~ ~ ~ {Tags:["Mns.MovePos.Valk"],Duration:600,Radius:0.0f}
        # function mhdp_monster_valk:core/tick/animation/change/play/tail_jump
    # 軸合わせ
        # tag @s add Mns.Temp.IsTurn
        # scoreboard players set @s Mns.General.TurnCount 2
    # アニメーション変更
        function mhdp_monster_valk:core/tick/animation/change/main

# 移動用
    # タグ付与
        # tag @s add Anim.MoveStart.Lance
        # execute positioned as @p[tag=Mns.Target.Valk] run summon area_effect_cloud ~ ~ ~ {Tags:["Mns.MovePos.Valk"],Duration:600,Radius:0.0f}
    # 遷移先決定
        # tag @s add Mns.Temp.Valk.MoveToSpin
    # アニメーション変更
        # function mhdp_monster_valk:core/tick/animation/change/main

# 強制再生
    # function animated_java_valk:valk/animations/roundforce_interrupt/tween {duration:1, to_frame: 1}

# 強制リアクション
    # function mhdp_monster_valk:core/damage/reaction/anger
