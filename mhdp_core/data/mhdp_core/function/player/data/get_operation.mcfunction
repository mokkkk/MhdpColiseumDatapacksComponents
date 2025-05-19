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
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Ope.StartSneak] if score @s Ply.Ope.EnderEyeTimer matches ..1 run tag @s add Ply.Ope.StartUsingEnderEye.WithSneak
        # 同時押し判定の場合、長押し判定をスキップする
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] run scoreboard players set @s Ply.Ope.EnderEyeTimer 5
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] run tag @s add Ply.Ope.StartUsingEnderEye.NotSneak
    # 投げ捨て
        execute if score @s Ply.Ope.DropEnderEye matches 1.. run tag @s add Ply.Ope.DroppedEnderEye

# スニーク・時間管理
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Ope.SneakTimer 1
    execute if entity @s[tag=Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Ope.SneakInterval 0
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players add @s Ply.Ope.SneakInterval 1
    execute if entity @s[tag=!Ply.Ope.IsSneaking] run scoreboard players set @s Ply.Ope.SneakTimer 0

# ニンジン棒
    execute if score @s Ply.Ope.UsedCoas matches 1.. run tag @s add Ply.Ope.StartUsingCoas
    execute if score @s Ply.Ope.DropCoas matches 1.. run tag @s add Ply.Ope.DroppedCoas

# 食べ物・時間管理
    execute if entity @s[tag=!Ply.Adv.Using.Paper] run scoreboard players set @s Ply.Ope.EatingTimer 0
    execute if entity @s[tag=Ply.Adv.Using.Paper] run scoreboard players add @s Ply.Ope.EatingTimer 1

# ジャンプ
    # execute if score @s Ply.Ope.Jump matches 1.. run tag @s add Ply.Ope.StartJump
    # execute if entity @s[tag=Ply.Ope.StartJump] run scoreboard players set @s Ply.Ope.Jump 0

# ダッシュ
    execute if predicate {condition:entity_properties,entity:this,predicate:{flags:{is_sprinting:true}}} run tag @s add Ply.Ope.IsSprinting

# キー入力
    # 前移動
        execute if entity @s[tag=!Ply.Ope.IsKeyForward] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true}}}} run tag @s add Ply.Ope.StartKeyForward
        execute if entity @s[tag=Ply.Ope.StartKeyForward,tag=!Ply.Ope.IsKeyForward] run tag @s add Ply.Ope.IsKeyForward
        execute if entity @s[tag=Ply.Ope.IsKeyForward] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":false}}}} run tag @s remove Ply.Ope.IsKeyForward
    # 左移動
        execute if entity @s[tag=!Ply.Ope.IsKeyLeft] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"left":true}}}} run tag @s add Ply.Ope.StartKeyLeft
        execute if entity @s[tag=Ply.Ope.StartKeyLeft,tag=!Ply.Ope.IsKeyLeft] run tag @s add Ply.Ope.IsKeyLeft
        execute if entity @s[tag=Ply.Ope.IsKeyLeft] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"left":false}}}} run tag @s remove Ply.Ope.IsKeyLeft
    # 後移動
        execute if entity @s[tag=!Ply.Ope.IsKeyBack] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"backward":true}}}} run tag @s add Ply.Ope.StartKeyBack
        execute if entity @s[tag=Ply.Ope.StartKeyBack,tag=!Ply.Ope.IsKeyBack] run tag @s add Ply.Ope.IsKeyBack
        execute if entity @s[tag=Ply.Ope.IsKeyBack] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"backward":false}}}} run tag @s remove Ply.Ope.IsKeyBack
    # 右移動
        execute if entity @s[tag=!Ply.Ope.IsKeyRight] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"right":true}}}} run tag @s add Ply.Ope.StartKeyRight
        execute if entity @s[tag=Ply.Ope.StartKeyRight,tag=!Ply.Ope.IsKeyRight] run tag @s add Ply.Ope.IsKeyRight
        execute if entity @s[tag=Ply.Ope.IsKeyRight] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"right":false}}}} run tag @s remove Ply.Ope.IsKeyRight
    # ジャンプ
        execute if entity @s[tag=!Ply.Ope.IsKeyJump] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"jump":true}}}} run tag @s add Ply.Ope.StartKeyJump
        execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeyJump] run tag @s add Ply.Ope.IsKeyJump
        execute if entity @s[tag=Ply.Ope.IsKeyJump] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"jump":false}}}} run tag @s remove Ply.Ope.IsKeyJump
    # スプリント
        execute if entity @s[tag=!Ply.Ope.IsKeySprint] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sprint":true}}}} run tag @s add Ply.Ope.StartKeySprint
        execute if entity @s[tag=Ply.Ope.StartKeySprint,tag=!Ply.Ope.IsKeySprint] run tag @s add Ply.Ope.IsKeySprint
        execute if entity @s[tag=Ply.Ope.IsKeySprint] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sprint":false}}}} run tag @s remove Ply.Ope.IsKeySprint

# 着地するまで有効
    execute if entity @s[tag=Ply.Ope.IsAir,nbt={OnGround:1b}] run tag @s remove Ply.Ope.IsAir

# # デバッグ用操作表示
#     # スニーク
#         execute if entity @s[tag=Ply.Ope.StartSneak] run say スニーク
#         execute if entity @s[tag=Ply.Ope.StartDoubleSneak] run say 連続スニーク
#     # エンダーアイ
#         execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run say エンダーアイ使用開始
#         # execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run say エンダーアイ使用中
#         execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run say エンダーアイ使用終了
#         execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.NotSneak] run say エンダーアイ使用開始・スニークなし
#         execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] run say エンダーアイ使用開始・スニーク同時押し
#         execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short] run say エンダーアイ使用・短押し
#         execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long] run say エンダーアイ使用・長押し
#     # ニンジン棒
#         execute if entity @s[tag=Ply.Ope.StartUsingCoas] run say ニンジン棒使用    
#     # ジャンプ
#         execute if entity @s[tag=Ply.Ope.StartJump] run say ジャンプ
#     # キー入力
#         execute if entity @s[tag=Ply.Ope.StartKeyForward] run say 前移動
#         execute if entity @s[tag=Ply.Ope.StartKeyLeft] run say 左移動
#         execute if entity @s[tag=Ply.Ope.StartKeyBack] run say 後移動
#         execute if entity @s[tag=Ply.Ope.StartKeyRight] run say 右移動
#         execute if entity @s[tag=Ply.Ope.StartKeyJump] run say ジャンプ
#         execute if entity @s[tag=Ply.Ope.StartKeySprint] run say スプリント
