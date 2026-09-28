#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/attack_l
#
# アニメーションイベントハンドラ 2連突き (左翼爪)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main

# 攻撃実行 (翼爪先端のロケータから前後に長い判定)
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/hit_l"}

# 演出
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
