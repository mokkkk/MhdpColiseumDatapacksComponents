#> mhdp_monster_dino:core/tick/animation/event/damage_head_heat/m.particle_head
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    $particle explosion_emitter ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.1 2
    $particle lava ^$(posx) ^$(posy) ^$(posz) 0.4 0.4 0.4 0.1 15
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
