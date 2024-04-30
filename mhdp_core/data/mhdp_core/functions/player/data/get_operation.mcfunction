#> mhdp_core:player/data/get_operation
#
# playerの操作の取得
#
# @within function mhdp_core:player/tick

# スニーク
    execute as @s if predicate {condition:entity_properties,entity:this,predicate:{flags:{is_sneaking:true}}} run tag @s add Ply.Ope.IsSneaking
    execute if entity @s[tag=Ply.Ope.IsSneaking] unless score @s Ply.Event.SneakTimer matches 1.. run tag @s add Ply.Ope.StartSneak
    execute if entity @s[tag=Ply.Ope.StartSneak] if score @s Ply.Event.SneakInterval matches ..3 run tag @s add Ply.Ope.StartDoubleSneak
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Event.SneakTimer 1
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Event.SneakInterval 0
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Event.SneakInterval 1
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Event.SneakTimer 0

# エンダーアイ
    execute if entity @s[tag=Ply.Adv.Using.EnderEye,tag=!Ply.Ope.IsUsingEnderEye] run tag @s add Ply.Ope.StartUsingEnderEye
    execute if entity @s[tag=!Ply.Adv.Using.EnderEye,tag=Ply.Ope.IsUsingEnderEye] run tag @s add Ply.Ope.EndUsingEnderEye
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run tag @s add Ply.Ope.IsUsingEnderEye
    execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run tag @s remove Ply.Ope.IsUsingEnderEye
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run scoreboard players add @s Ply.Event.EnderEyeTimer 1
    execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] if score @s Ply.Event.EnderEyeTimer matches ..3 run tag @s add Ply.Ope.UsedEnderEye.Short
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Ply.Event.EnderEyeTimer matches 4 run tag @s add Ply.Ope.UsedEnderEye.Long
    execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run scoreboard players set @s Ply.Event.EnderEyeTimer 0

# ニンジン棒

# 食べ物

# ジャンプ
    execute if score @s Ply.Event.Jump matches 1.. run tag @s add Ply.Ope.StartJump
    execute if entity @s[tag=Ply.Ope.StartJump] run scoreboard players set @s Ply.Event.Jump 0

# デバッグ用操作表示
    # execute if entity @s[tag=Ply.Ope.StartSneak] run say スニーク
    execute if entity @s[tag=Ply.Ope.StartDoubleSneak] run say 連続スニーク
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run say エンダーアイ使用開始
    # execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run say エンダーアイ使用中
    # execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run say エンダーアイ使用終了
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short] run say エンダーアイ使用・短
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long] run say エンダーアイ使用・長
    # execute if entity @s[tag=Ply.Ope.StartJump] run say ジャンプ
