#> mhdp_items:weapons/great_sword/type_tec/19_counter_stance/animation_1
#
# 強溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/19_counter_stance/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"counter_stance_1"}

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    particle crit ~ ~1 ~ 0 0 0 1 50
