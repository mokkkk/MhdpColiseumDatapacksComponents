#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/attack_l
#
# アニメーションイベントハンドラ 翼槍回転斬り (左翼爪・突き)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main

# 攻撃実行 (翼爪の可動域に沿って複数点判定)
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_l"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_2",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_l"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_l"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_4",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_l"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_5",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_l"}

# 演出
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
