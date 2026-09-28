#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/particle_launch_muzzle
#
# アニメーションイベントハンドラ 彗星・離陸 (at_locator から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/particle_launch

# 演出
    particle flash{color:[1.000,1.000,1.000,1.00]} ~ ~ ~ 0 0 0 0 1
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^ ^ 1 1 1 0.15 5 force
