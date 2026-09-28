#> mhdp_monster_valk:core/tick/animation/event/lance_move/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_move/main

# 移動対象消去
    kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]

# 行動選択
    # 槍回転
        execute if entity @s[tag=Mns.Temp.Valk.MoveToSpin] run function mhdp_monster_valk:core/tick/animation/change/play/spear_to_spin
        execute if entity @s[tag=Mns.Temp.Valk.MoveToSpin] run return run tag @s remove Mns.Temp.Valk.MoveToSpin
    # 突進攻撃
        execute if entity @s[tag=Mns.Temp.Valk.MoveToDashAttack] run function animated_java_valk:valk/animations/lance_dashattack/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Mns.Temp.Valk.MoveToDashAttack] run return run tag @s remove Mns.Temp.Valk.MoveToDashAttack

# フォールバック
    function mhdp_monster_valk:core/tick/animation/change/main
