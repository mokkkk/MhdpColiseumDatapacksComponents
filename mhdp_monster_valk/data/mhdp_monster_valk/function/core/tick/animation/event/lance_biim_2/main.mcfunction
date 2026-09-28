#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main
#
# アニメーションイベントハンドラ 龍閃 (発射)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_2.frame matches 50..58 at @s run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_2.frame matches 50..58 at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 移動
    execute if score @s aj.lance_biim_2.frame matches 4..9 at @s run tp @s ^ ^ ^-0.6
    execute if score @s aj.lance_biim_2.frame matches 10..25 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_biim_2.frame matches 26..35 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_biim_2.frame matches 68..77 at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_biim_2.frame matches 78..87 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.lance_biim_2.frame matches 67 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 67 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_2.frame matches 87 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 87 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_2.frame matches 134 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 134 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 134 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 134 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7

    execute if score @s aj.lance_biim_2.frame matches 70..74 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^3 0.5 0.7 0.5
    execute if score @s aj.lance_biim_2.frame matches 70..74 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^3 0.5 1 0.5

    execute if score @s aj.lance_biim_2.frame matches 4..8 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^3 0.5 0.7 0.5
    execute if score @s aj.lance_biim_2.frame matches 4..8 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^3 0.5 1 0.5
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^3 0.3 0.8 0.3
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^3 0.3 0.5 0.3
    execute if score @s aj.lance_biim_2.frame matches 4 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.lightning_bolt.impact master @s ^ ^1 ^3 0.5 0.5 0.5
    execute if score @s aj.lance_biim_2.frame matches 70 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.generic.explode master @s ^ ^1 ^3 0.4 0.7
    execute if score @s aj.lance_biim_2.frame matches 2..7 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.phantom.death master @s ^ ^1 ^3 0.4 0.5 0.5
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.warden.listening master @s ^ ^1 ^3 0.4 0.5 0.5
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.phantom.death master @s ^ ^1 ^3 0.3 0.6 0.3
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.phantom.death master @s ^ ^1 ^3 0.3 0.5 0.3
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.ghast.shoot master @s ^ ^1 ^3 0.3 0.5 0.5
    execute if score @s aj.lance_biim_2.frame matches 10..12 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.bee.hurt master @s ^ ^1 ^3 0.3 0.5 0.5
    execute if score @s aj.lance_biim_2.frame matches 65..70 at @a[tag=!Ply.State.IsSilent,distance=..96] facing entity @s feet as @p run playsound entity.ghast.shoot master @s ^ ^1 ^3 0.3 0.5 0.5

# 演出
    execute if score @s aj.lance_biim_2.frame matches 5 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 17 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 29 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 70 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 5..36 at @s run particle dust_pillar{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0.2 3
    # Object: RedFlash (10047, 発射合図＋Jet後始末)
        execute if score @s aj.lance_biim_2.frame matches 4 run data modify storage api: Arg.Override set value {Scale:8}
        execute if score @s aj.lance_biim_2.frame matches 4 positioned ^ ^2 ^8 run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.lance_biim_2.frame matches 4 run kill @e[type=text_display,tag=10047.IsBeamVfx]
    # Object: Beam (10045)
        execute if score @s aj.lance_biim_2.frame matches 4 run data modify storage api: Arg.Override set value {Scale:8}
        execute if score @s aj.lance_biim_2.frame matches 4 positioned ^ ^2 ^8 run function api:object/summon.m {ObjectId:10045}
        execute if score @s aj.lance_biim_2.frame matches 5..71 run function animated_java_valk:valk/at_locator {name:"beam_start",command:"tp @n[type=text_display,tag=10045.BeamVfx] ~ ~ ~ ~ 0"}
        execute if score @s aj.lance_biim_2.frame matches 71 run kill @n[type=text_display,tag=10045.BeamVfx]
    # Object: Thunder (10048、lance_biim_1から継続追従)
        execute if score @s aj.lance_biim_2.frame matches 5 as @e[type=text_display,tag=Asset.Object.Valk,scores={ObjectId=10048}] run data modify entity @s transformation.scale set value [6f,6f,6f]
        execute if score @s aj.lance_biim_2.frame matches 5..71 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick
        execute if score @s aj.lance_biim_2.frame matches 71 run kill @e[type=text_display,tag=Asset.Object.Valk,scores={ObjectId=10048}]
    # 照準マーカー（非object、Mns.BeamPos.Valk）
        execute if score @s aj.lance_biim_2.frame matches 4 run summon area_effect_cloud ~ ~0.1 ~ {Duration:70,DurationOnUse:0,Tags:["Mns.BeamPos.Valk"],custom_particle:{type:"block",block_state:"minecraft:air"}}
        execute if score @s aj.lance_biim_2.frame matches 5..71 run function animated_java_valk:valk/at_locator {name:"beam_end",command:"tp @n[type=area_effect_cloud,tag=Mns.BeamPos.Valk] ~ ~ ~ ~ 0"}

# 攻撃
    # ビーム
        execute if score @s aj.lance_biim_2.frame matches 5..36 run function animated_java_valk:valk/at_locator {name:"beam_start",command:"function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam"}
        execute if score @s aj.lance_biim_2.frame matches 37..70 run function animated_java_valk:valk/at_locator {name:"beam_start",command:"function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air"}
    # 爆発
        execute if score @s aj.lance_biim_2.frame matches 38 positioned ^ ^ ^10 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
        execute if score @s aj.lance_biim_2.frame matches 40 positioned ^ ^ ^25 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
        execute if score @s aj.lance_biim_2.frame matches 42 positioned ^ ^ ^35 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
        execute if score @s aj.lance_biim_2.frame matches 44 positioned ^ ^ ^45 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
        execute if score @s aj.lance_biim_2.frame matches 46 positioned ^ ^ ^55 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
        execute if score @s aj.lance_biim_2.frame matches 48 positioned ^ ^ ^65 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
    # 振り下ろし
        execute if score @s aj.lance_biim_2.frame matches 72 at @s positioned ^ ^ ^8 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish

# モデル演出
    execute if score @s aj.lance_biim_2.frame matches 87 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_biim_2.frame matches 155 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/end
