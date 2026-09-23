#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main
#
# アニメーションイベントハンドラ 彗星・急襲
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_3.frame matches 2..10 at @s run tp @s ^ ^ ^1

# 効果音
    function animated_java_valk:valk/at_locator {name:"pos_head",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/particle_head"}

# 演出
    # Object: Star (10044)
        execute if score @s aj.comet_phase_3.frame matches 3 run kill @e[type=text_display,tag=10044.StarVfx]

    # Object: Jet (10043)
        execute if score @s aj.comet_phase_3.frame matches 2 run function animated_java_valk:valk/as_locator {name:"shadow",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/summon_vfx_jet"}
        execute if score @s aj.comet_phase_3.frame matches 2..20 run function animated_java_valk:valk/as_locator {name:"shadow",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/tp_vfx_jet"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.comet_phase_3.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/end
