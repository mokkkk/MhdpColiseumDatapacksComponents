#> mhdp_items:weapons/bow/type_normal/10_flying_11_moving_shotshot/attack
#
# 飛翔睨み撃ち 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/10_flying_shot/main

# 矢を召喚
    function mhdp_items:weapons/bow/type_normal/11_moving_shot/summon

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Wpn.Bw.ChargeCount = @s Wpn.Bw.ChargeCount
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] add Wpn.Bw.Shot.Normal.Flying

# 演出
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
