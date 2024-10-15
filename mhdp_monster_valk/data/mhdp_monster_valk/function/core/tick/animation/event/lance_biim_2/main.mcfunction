#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_2.frame matches 50..58 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_2.frame matches 50..58 run function mhdp_monsters:core/util/other/turn_to_target_accurate

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

    execute if score @s aj.lance_biim_2.frame matches 4..8 run playsound entity.warden.sonic_boom master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 4..8 run playsound entity.warden.sonic_boom master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_biim_2.frame matches 10..66 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^1 0.3 0.8 0.3
    execute if score @s aj.lance_biim_2.frame matches 70..74 run playsound entity.warden.sonic_boom master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 70..74 run playsound entity.warden.sonic_boom master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_biim_2.frame matches 70 run playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    
# 演出
    execute if score @s aj.lance_biim_2.frame matches 5 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 17 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 29 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 70 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/effect_beam
    execute if score @s aj.lance_biim_2.frame matches 5..36 at @s run particle dust_pillar{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0.2 3
    # 召喚
        execute if score @s aj.lance_biim_2.frame matches 4 run summon text_display ^ ^2 ^8 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
        execute if score @s aj.lance_biim_2.frame matches 4 run summon text_display ^ ^2 ^8 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Beam","Mns.Shot.Valk.Vfx.RedFlash.Long"],view_range:1000f,default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,teleport_duration:1,billboard:"center",start_interpolation:-1,interpolation_duration:4,text_opacity:255,alignment:"center"}
        execute if score @s aj.lance_biim_2.frame matches 4 run summon area_effect_cloud ~ ~0.1 ~ {Duration:70,DurationOnUse:0,Tags:["Mns.BeamPos.Valk"]}
    # 移動
        execute if score @s aj.lance_biim_2.frame matches 5 as @e[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] run data modify entity @s transformation.scale set value [6f,6f,6f]
        execute if score @s aj.lance_biim_2.frame matches 5..71 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick
        execute if score @s aj.lance_biim_2.frame matches 5..71 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/m.tp_vfx_beam with entity @s data.locators.beam_start
        execute if score @s aj.lance_biim_2.frame matches 4 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet]
        execute if score @s aj.lance_biim_2.frame matches 71 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]
        execute if score @s aj.lance_biim_2.frame matches 5..71 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/m.tp_aec with entity @s data.locators.beam_end

# 攻撃
    # ビーム
        execute if score @s aj.lance_biim_2.frame matches 5..36 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam with entity @s data.locators.beam_start
        execute if score @s aj.lance_biim_2.frame matches 37..70 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air with entity @s data.locators.beam_start
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
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_biim_2.frame matches 155 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/end
