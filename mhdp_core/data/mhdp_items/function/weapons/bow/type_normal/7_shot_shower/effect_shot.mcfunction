#> mhdp_items:weapons/bow/type_normal/7_shot_shower/effect_shot
#
# 竜の千々矢 演出
#
# @within function mhdp_items:weapons/bow/type_normal/7_shot_shower/main

# 効果音再生
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
