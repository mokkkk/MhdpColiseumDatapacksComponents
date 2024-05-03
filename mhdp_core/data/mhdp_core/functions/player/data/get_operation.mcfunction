#> mhdp_core:player/data/get_operation
#
# playerの操作の取得
#
# @within function mhdp_core:player/tick

# スニーク・開始
    execute as @s if predicate {condition:entity_properties,entity:this,predicate:{flags:{is_sneaking:true}}} run tag @s add Ply.Ope.IsSneaking
    execute if entity @s[tag=Ply.Ope.IsSneaking] unless score @s Ply.Ope.SneakTimer matches 1.. run tag @s add Ply.Ope.StartSneak
    execute if entity @s[tag=Ply.Ope.StartSneak] if score @s Ply.Ope.SneakInterval matches ..3 run tag @s add Ply.Ope.StartDoubleSneak

# エンダーアイ
    # 使用開始・終了
        execute if entity @s[tag=Ply.Adv.Using.EnderEye,tag=!Ply.Ope.IsUsingEnderEye] run tag @s add Ply.Ope.StartUsingEnderEye
        execute if entity @s[tag=!Ply.Adv.Using.EnderEye,tag=Ply.Ope.IsUsingEnderEye] run tag @s add Ply.Ope.EndUsingEnderEye
    # 使用中
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run tag @s add Ply.Ope.IsUsingEnderEye
        execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run tag @s remove Ply.Ope.IsUsingEnderEye
    # 短押し・長押し
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run scoreboard players add @s Ply.Ope.EnderEyeTimer 1
        execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] if score @s Ply.Ope.EnderEyeTimer matches ..3 run tag @s add Ply.Ope.UsedEnderEye.Short
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Ply.Ope.EnderEyeTimer matches 4 run tag @s add Ply.Ope.UsedEnderEye.Long
        execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run scoreboard players set @s Ply.Ope.EnderEyeTimer 0
    # スニーク同時押し
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Ply.Ope.SneakTimer matches ..1 run tag @s add Ply.Ope.StartUsingEnderEye.WithSneak
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] run tag @s add Ply.Ope.StartUsingEnderEye.NotSneak

# スニーク・時間管理
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Ope.SneakTimer 1
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Ope.SneakInterval 0
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Ope.SneakInterval 1
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Ope.SneakTimer 0

# ニンジン棒

# 食べ物

# ジャンプ
    execute if score @s Ply.Ope.Jump matches 1.. run tag @s add Ply.Ope.StartJump
    execute if entity @s[tag=Ply.Ope.StartJump] run scoreboard players set @s Ply.Ope.Jump 0

# デバッグ用操作表示
    # スニーク
        # execute if entity @s[tag=Ply.Ope.StartSneak] run say スニーク
        execute if entity @s[tag=Ply.Ope.StartDoubleSneak] run say 連続スニーク
    # エンダーアイ
        # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run say エンダーアイ使用開始
        # execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run say エンダーアイ使用中
        # execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run say エンダーアイ使用終了
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.NotSneak] run say エンダーアイ使用開始・スニークなし
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] run say エンダーアイ使用開始・スニーク同時押し
        # execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short] run say エンダーアイ使用・短押し
        # execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long] run say エンダーアイ使用・長押し
    # ジャンプ
        # execute if entity @s[tag=Ply.Ope.StartJump] run say ジャンプ
