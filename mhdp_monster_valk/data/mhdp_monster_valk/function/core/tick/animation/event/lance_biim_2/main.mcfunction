#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_2.frame matches 50..61 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_2.frame matches 50..61 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.lance_biim_2.frame matches 4..9 at @s run tp @s ^ ^ ^-0.6
    execute if score @s aj.lance_biim_2.frame matches 10..25 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_biim_2.frame matches 68..77 at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_biim_2.frame matches 78..87 at @s run tp @s ^ ^ ^-0.2

# 効果音
    execute if score @s aj.lance_biim_2.frame matches 67 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 67 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_2.frame matches 87 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_2.frame matches 87 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_2.frame matches 117 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 117 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 117 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_biim_2.frame matches 117 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7

# 演出
    execute if score @s aj.lance_biim_2.frame matches 4 run summon text_display ^ ^2 ^8 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    # 召喚
        execute if score @s aj.lance_biim_2.frame matches 5 positioned ^ ^2 ^8 run summon text_display ~ ~ ~ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Jet"],view_range:1000f,default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,teleport_duration:1,billboard:"center",start_interpolation:-1,interpolation_duration:4,text_opacity:255,alignment:"center"}
        execute if score @s aj.lance_biim_2.frame matches 5 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk,tag=Mns.Shot.Valk.Vfx.Thunder,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] transformation.scale set value [6f,6f,6f]
        execute if score @s aj.lance_biim_2.frame matches 5..71 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.tp_vfx_jet with entity @s data.locators.beam_start
        execute if score @s aj.lance_biim_2.frame matches 71 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.Jet]
        execute if score @s aj.lance_biim_2.frame matches 71 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]

# モデル演出
    execute if score @s aj.lance_biim_2.frame matches 87 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_biim_2.frame matches 130 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/end
