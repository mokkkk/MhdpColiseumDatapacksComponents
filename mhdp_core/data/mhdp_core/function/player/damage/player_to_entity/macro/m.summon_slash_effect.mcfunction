#> mhdp_core:player/damage/player_to_entity/macro/m.summon_slash_effect
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 斬撃エフェクト表示用item_display召喚
    $execute if entity @s[tag=!Ply.Temp.IsCounterDamage] positioned ~ ~$(OffsetY) ~ rotated as @s positioned ^ ^ ^2000 facing entity @s eyes positioned ^ ^ ^2000 run summon text_display ^ ^ ^$(OffsetZ) {billboard:"center",width:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[4f,4f,4f]},Tags:["Other.Text.Vfx","Other.Text.Vfx.Slash","Start"],teleport_duration:0,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/slash"}',background:0,alignment:"center"}
    # 相殺
        $execute if entity @s[tag=Ply.Temp.IsCounterDamage] positioned ~ ~$(OffsetY) ~ rotated as @s positioned ^ ^ ^0.1 run summon text_display ^ ^ ^ {billboard:"center",width:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[20f,20f,20f]},Tags:["Other.Text.Vfx","Other.Text.Vfx.Slash","Other.Text.Vfx.Counter","Start"],teleport_duration:0,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/slash_counter"}',background:0,alignment:"center"}
    
# データ設定
    $data modify entity @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] transformation.left_rotation set value {axis:[0f,0f,1f],angle:$(VfxRotation)f}
    execute if entity @s[tag=!Ply.Temp.IsCounterDamage] if data storage mhdp_core:temp Damage.VfxScale run data modify entity @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] transformation.scale set from storage mhdp_core:temp Damage.VfxScale
    execute if data storage mhdp_core:temp Damage{IsVfxStrong:true} run tag @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] add Other.Text.Vfx.Strong
    execute facing entity @s eyes as @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] positioned as @s run tp @s ~ ~ ~ ~ ~

# 終了
    tag @e[type=text_display,tag=Other.Text.Vfx.Slash,tag=Start,limit=1] remove Start
 