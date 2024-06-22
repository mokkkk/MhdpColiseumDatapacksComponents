#> mhdp_core:player/damage/player_to_entity/macro/m.summon_slash_effect
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 斬撃エフェクト表示用item_display召喚
    summon text_display ^ ^ ^ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.8f,0f,0f],scale:[5f,10f,5f]},Tags:["Other.Text.Vfx","Other.Text.Vfx.Slash","Start"],teleport_duration:0,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/slash"}',background:0}
    $data modify entity @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] transformation.left_rotation set value {axis:[0f,0f,1f],angle:$(VfxRotation)f}
    execute facing entity @s eyes as @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] positioned as @s run tp @s ~ ~ ~ ~ ~
    tag @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] remove Start
