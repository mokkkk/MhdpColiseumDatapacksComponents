#> mhdp_core:player/damage/player_to_entity/macro/m.summon_damage_text
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# ダメージ表示用text_display召喚
    $execute positioned ~ ~0.5 ~ rotated ~$(RotY) ~-$(RotX) run summon text_display ^ ^ ^0.$(Dist) {width:2f,height:2f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(Scale)f,$(Scale)f,$(Scale)f]},billboard:"center",Tags:["Other.Text.Damage"],teleport_duration:10,brightness:{sky:15,block:15},text:'{"color":"$(Color)","text":"$(Damage)","font":"ui/damage"}',background:0}
