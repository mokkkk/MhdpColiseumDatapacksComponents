#> assets:object/10047.valk_red_flash/summon/
#
# 龍閃 赤フラッシュ VFX 召喚（旧 mhdp_monster_valk:core/tick/shot/vfx_red_flash）

# 召喚 (text_display)。scale はデフォルト 7、init で Override.Scale があれば上書き
    summon text_display ^ ^ ^ {Tags:["Asset.Object","Asset.Object.Init","Asset.Object.Valk"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax/red_flash"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
