#> api:damage_player_to_entity/vfx/summon_blow_effect.m
#
# ヒット演出
#
# @within function api:damage_player_to_entity/vfx

# 打撃エフェクト表示用item_display召喚
    $execute positioned ~ ~$(OffsetY) ~ rotated as @s positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^2000 run summon text_display ^ ^ ^$(OffsetZ) {billboard:"center",width:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[4f,4f,4f]},Tags:["Other.Text.Vfx","Other.Text.Vfx.Blow","Start"],teleport_duration:0,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/blow"},background:0,alignment:"center"}
    $data modify entity @e[type=text_display,tag=Other.Text.Vfx.Blow,tag=Start,limit=1] transformation.left_rotation set value {axis:[0f,0f,1f],angle:$(VfxRotation)f}
    execute if data storage api: Arg.VfxScale run data modify entity @e[type=text_display,tag=Other.Text.Vfx.Blow,tag=Start,limit=1] transformation.scale set from storage api: Arg.VfxScale
    execute if data storage api: Arg{IsVfxStrong:true} run tag @e[type=text_display,tag=Other.Text.Vfx.Blow,tag=Start,limit=1] add Other.Text.Vfx.Strong
    execute facing entity @s eyes as @e[type=text_display,tag=Other.Text.Vfx.Blow,tag=Start,limit=1] positioned as @s run tp @s ~ ~ ~ ~ ~
    tag @e[type=text_display,tag=Other.Text.Vfx.Blow,tag=Start,limit=1] remove Start
