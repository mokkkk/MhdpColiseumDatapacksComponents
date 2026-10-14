#> mhdp_items:weapons/bow/type_tec/10_flying_shot/attack
#
# 飛翔睨み撃ち 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/10_flying_shot/main

# 矢を召喚
    function mhdp_items:weapons/bow/shot/normal/summon_flying

# 演出
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

# 移動
    tp @s @s
    execute rotated ~180 -60 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:true, IsAdjust:false}

# 終了
    scoreboard players add @s Wpn.Bw.FlyingShot.Count 1
 
# カメラ演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.Bw.FlyingShot.Count matches ..2 run data modify storage api: Arg.Override.Type set value "weak"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.Bw.FlyingShot.Count matches 3 run data modify storage api: Arg.Override.Type set value "medium"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:3}
