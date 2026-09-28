#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/summon_vfx_jet
#
# アニメーションイベントハンドラ 彗星・急襲 (as_locator shadow から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main

# Object: Jet (10043)
    data modify storage api: Arg.Override set value {Scale:20}
    function api:object/summon.m {ObjectId:10043}
