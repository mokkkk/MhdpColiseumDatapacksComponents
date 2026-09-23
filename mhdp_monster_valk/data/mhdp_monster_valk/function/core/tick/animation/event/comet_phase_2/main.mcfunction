#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_2.frame matches 3..60 at @s run tp @s ~ ~ ~ ~-4.2 ~
    execute if score @s aj.comet_phase_2.frame matches 3..60 unless entity @n[tag=Mns.Target.Valk,distance=..3] at @s facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 run tp @s ^ ^ ^1

# 効果音
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_2.frame matches 2..55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.7
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.8
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.9
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.0

# 演出
    function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/change_text

    # Object: Star (10044)
        execute if score @s aj.comet_phase_2.frame matches 2 run function animated_java_valk:valk/at_locator {name:"pos_comet_star",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/summon_vfx_star"}
        execute if score @s aj.comet_phase_2.frame matches 3 run data modify entity @n[type=text_display,tag=10044.StarVfx] transformation.scale set value [64f,64f,1f]
        execute if score @s aj.comet_phase_2.frame matches 2..60 run function animated_java_valk:valk/at_locator {name:"pos_comet_star",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/tp_vfx_star"}
        execute if score @s aj.comet_phase_2.frame matches 61..90 run function animated_java_valk:valk/at_locator {name:"pos_comet_star",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/tp_vfx_star_turn"}

    # Object: Comet (10041) / Burst (10042)
        execute if score @s aj.comet_phase_2.frame matches 60 run function animated_java_valk:valk/at_locator {name:"pos_comet_star",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/summon_vfx"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.comet_phase_2.frame matches 91 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/end
