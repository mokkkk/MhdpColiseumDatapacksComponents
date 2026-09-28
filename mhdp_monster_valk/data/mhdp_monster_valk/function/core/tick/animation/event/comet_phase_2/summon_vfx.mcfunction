#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/summon_vfx
#
# アニメーションイベントハンドラ 彗星・滑空 (at_locator pos_comet_star から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main

# Object: Comet (10041) / Burst (10042)
    data modify storage api: Arg.Override set value {Scale:164}
    execute positioned ~ ~-15 ~ rotated 180 45 run function api:object/summon.m {ObjectId:10041}
    data modify storage api: Arg.Override set value {Scale:200}
    execute positioned ~ ~-15 ~ rotated 180 45 run function api:object/summon.m {ObjectId:10042}
