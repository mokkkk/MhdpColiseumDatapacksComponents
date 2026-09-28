#> mhdp_monster_valk:core/tick/animation/event/comet_phase_4/main
#
# アニメーションイベントハンドラ 彗星・着陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_4.frame matches 2..10 at @s run tp @s ^0.5 ^ ^-2
    execute if score @s aj.comet_phase_4.frame matches 11..24 at @s run tp @s ^ ^ ^-0.8 ~-5 ~
    execute if score @s aj.comet_phase_4.frame matches 25..40 at @s run tp @s ^ ^ ^-0.2 ~-0.5 ~
    execute if score @s aj.comet_phase_4.frame matches 41..55 at @s run tp @s ^ ^ ^-0.07 ~-0.2 ~

# 効果音
    execute if score @s aj.comet_phase_4.frame matches 2 run stopsound @a[tag=Ply.State.MnsTarget] master
    execute if score @s aj.comet_phase_4.frame matches 2..55 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle
    execute if score @s aj.comet_phase_4.frame matches 11..40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 11..40 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.comet_phase_4.frame matches 55 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run particle block{block_state:"minecraft:sand"} ^ ^ ^6 1 0.1 1 0 10

# 演出
    execute if score @s aj.comet_phase_4.frame matches 2..15 run particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^ ^3 2 2 2 0.15 10 force
    execute if score @s aj.comet_phase_4.frame matches 2..15 run particle explosion ^ ^2 ^6 2 2 2 0 10 force
    execute if score @s aj.comet_phase_4.frame matches 2..5 run particle gust_emitter_large ~ ~2 ~ 3 1 3 0 3 force

    # Object: Jet (10043、Phase3から継続追従)
        execute if score @s aj.comet_phase_4.frame matches 2..15 run function animated_java_valk:valk/as_locator {name:"shadow",command:"function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/tp_vfx_jet"}
        execute if score @s aj.comet_phase_4.frame matches 2 run data modify entity @n[type=text_display,tag=10043.JetVfx] transformation.scale set value [50f,50f,50f]
        execute if score @s aj.comet_phase_4.frame matches 2 run data modify entity @n[type=text_display,tag=10043.JetVfx] start_interpolation set value -1L
        execute if score @s aj.comet_phase_4.frame matches 8 run kill @e[type=text_display,tag=10043.JetVfx]

    # Object: RedFlash (10047) / Bomb (10046)
        execute if score @s aj.comet_phase_4.frame matches 2 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 2 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.comet_phase_4.frame matches 4 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 4 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.comet_phase_4.frame matches 6 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 6 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.comet_phase_4.frame matches 8 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 8 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.comet_phase_4.frame matches 2 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 2 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10046}
        execute if score @s aj.comet_phase_4.frame matches 4 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 4 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10046}
        execute if score @s aj.comet_phase_4.frame matches 6 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 6 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10046}
        execute if score @s aj.comet_phase_4.frame matches 8 run data modify storage api: Arg.Override set value {Scale:18}
        execute if score @s aj.comet_phase_4.frame matches 8 positioned ^ ^2 ^ run function api:object/summon.m {ObjectId:10046}

# 無音
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1
    execute if score @s aj.comet_phase_4.frame matches 5 run tag @a[tag=Mns.Candidate.Valk] add Ply.State.IsSilent
    execute if score @s aj.comet_phase_4.frame matches 65 run tag @a[tag=Mns.Candidate.Valk] remove Ply.State.IsSilent

# 攻撃
    execute if score @s aj.comet_phase_4.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/attack

# モデル演出
    execute if score @s aj.comet_phase_4.frame matches 55 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.comet_phase_4.frame matches 93 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/end
