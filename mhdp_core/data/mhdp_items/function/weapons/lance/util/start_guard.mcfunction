#> mhdp_items:weapons/lance/util/start_guard
#
# 武器のガード開始時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# ガード値
    scoreboard players set #mhdp_temp_guard_strength MhdpCore 5

# 攻撃ベクトルによるガード成否判定
# ダミー用AEC召喚
    execute if data storage mhdp_core:temp Arg{VectorType:"Normal"} positioned as @s rotated ~ 0 positioned ^ ^ ^-1 run summon area_effect_cloud ~ ~ ~ {Tags:["Other.Temp.GuardVector"]}
    execute unless data storage mhdp_core:temp Arg{VectorType:"Normal"} positioned as @s facing entity @s feet rotated ~180 0 positioned ^ ^ ^1 run summon area_effect_cloud ~ ~ ~ {Tags:["Other.Temp.GuardVector"]}
# 判定
    # 通常時
        execute unless entity @s[tag=Wpn.Lc.Tec.PowerGuard] at @s rotated ~ 0 run function api:bounding/cake.m {Selector:"@e[type=area_effect_cloud,tag=Other.Temp.GuardVector]",Tag:"Other.Temp.GuardVector.Success",Radius:3.0,Height:3.0,Angle:90.0}
    # パワーガード時
        execute if entity @s[tag=Wpn.Lc.Tec.PowerGuard] at @s rotated ~ 0 run function api:bounding/cake.m {Selector:"@e[type=area_effect_cloud,tag=Other.Temp.GuardVector]",Tag:"Other.Temp.GuardVector.Success",Radius:3.0,Height:3.0,Angle:170.0}
# 攻撃元を向いていない場合、ガード失敗
    execute positioned as @s unless entity @n[type=area_effect_cloud,tag=Other.Temp.GuardVector,tag=Other.Temp.GuardVector.Success,distance=..5] run tag @s remove Ply.Weapon.Guard
# 終了
    kill @n[type=area_effect_cloud,tag=Other.Temp.GuardVector]
