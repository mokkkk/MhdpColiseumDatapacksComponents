#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main_sub
#
# アニメーションイベントハンドラ 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute at @s run tp @s ^ ^ ^2

# 演出
    particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^2 ^-1.5 0.5 0.5 0.5 0.15 3
    # particle dust{color:[1.000,0.369,0.369],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    # particle dust{color:[1.000,0.369,0.369],scale:4} ^ ^2 ^-1.5 0.5 0.5 0.5 0.15 3
    # particle dust{color:[10000000000.0,1.0,1.0],scale:4} ^ ^2 ^-2 0.5 0.5 0.5 0.15 3
    particle flash ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] ^ ^3 ^

# 攻撃
    function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/attack

# 移動対象にある程度近づいた場合、または対象が見つからない場合終了
    execute if entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk,distance=..4] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/end
    execute if entity @s[tag=!Mns.Temp.Valk.EndFlyTackle] unless entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/end
