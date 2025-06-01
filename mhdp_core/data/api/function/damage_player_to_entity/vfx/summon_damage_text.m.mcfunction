#> api:damage_player_to_entity/vfx/summon_damage_text.m
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function api:damage_player_to_entity/vfx

# ダメージ表示用text_display召喚
    # 通常時
        $execute unless entity @s[tag=Ply.Temp.IsCrit] positioned ~ ~0.5 ~ positioned ^ ^ ^1 rotated ~$(RotY) ~$(RotX) run summon text_display ^ ^ ^0.$(Dist) {width:2f,height:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(Scale)f,$(Scale)f,$(Scale)f]},billboard:"center",Tags:["Other.Text.Vfx","Other.Text.Damage"],teleport_duration:10,brightness:{sky:15,block:15},text:{"text":"$(Damage)","color":"$(Color)","font":"ui/damage"},background:0,alignment:"center"}
    # 会心時
        $execute if entity @s[tag=Ply.Temp.IsCrit] positioned ~ ~0.5 ~ positioned ^ ^ ^1 rotated ~$(RotY) ~$(RotX) run summon text_display ^ ^ ^0.$(Dist) {width:2f,height:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(Scale)f,$(Scale)f,$(Scale)f]},billboard:"center",Tags:["Other.Text.Vfx","Other.Text.Damage"],teleport_duration:10,brightness:{sky:15,block:15},text:[{"text":"#","color":"white","font":"ui/damage"},{"text":"$(Damage)","color":"$(Color)","font":"ui/damage"}],background:0,alignment:"center"}
