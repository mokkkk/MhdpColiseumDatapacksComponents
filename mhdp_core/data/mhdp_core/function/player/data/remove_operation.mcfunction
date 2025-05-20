#> mhdp_core:player/data/remove_operation
#
# playerの操作の初期化
#
# @within function mhdp_core:player/tick

# ダメージ関連  
    execute if entity @s[tag=Ply.Adv.Hurt.EntityHurtPlayer] run tag @s remove Ply.Adv.Hurt.EntityHurtPlayer
    execute if entity @s[tag=Ply.Adv.Hurt.PlayerHurtEntity] run tag @s remove Ply.Adv.Hurt.PlayerHurtEntity

# スニーク
    execute if entity @s[tag=Ply.Ope.IsSneaking] run tag @s remove Ply.Ope.IsSneaking
    execute if entity @s[tag=Ply.Ope.StartSneak] run tag @s remove Ply.Ope.StartSneak
    execute if entity @s[tag=Ply.Ope.StartDoubleSneak] run tag @s remove Ply.Ope.StartDoubleSneak

# エンダーアイ
    execute if entity @s[tag=Ply.Adv.Using.EnderEye] run tag @s remove Ply.Adv.Using.EnderEye
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run tag @s remove Ply.Ope.StartUsingEnderEye
    execute if entity @s[tag=Ply.Ope.EndUsingEnderEye] run tag @s remove Ply.Ope.EndUsingEnderEye
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.NotSneak] run tag @s remove Ply.Ope.StartUsingEnderEye.NotSneak
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] run tag @s remove Ply.Ope.StartUsingEnderEye.WithSneak
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short] run tag @s remove Ply.Ope.UsedEnderEye.Short
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long] run tag @s remove Ply.Ope.UsedEnderEye.Long
    scoreboard players set @s Ply.Ope.DropEnderEye 0
    execute if entity @s[tag=Ply.Ope.DroppedEnderEye] run tag @s remove Ply.Ope.DroppedEnderEye

# ニンジン棒
    execute if entity @s[tag=Ply.Ope.StartUsingCoas] run tag @s remove Ply.Ope.StartUsingCoas
    scoreboard players set @s Ply.Ope.UsedCoas 0
    execute if entity @s[tag=Ply.Ope.DroppedCoas] run tag @s remove Ply.Ope.DroppedCoas
    scoreboard players set @s Ply.Ope.DropCoas 0

# 食べ物
    execute if entity @s[tag=Ply.Adv.Using.Paper] run tag @s remove Ply.Adv.Using.Paper

# ダッシュ
    execute if entity @s[tag=Ply.Ope.IsSprinting] run tag @s remove Ply.Ope.IsSprinting

# キー入力
    execute if entity @s[tag=Ply.Ope.StartKeyForward] run tag @s remove Ply.Ope.StartKeyForward
    execute if entity @s[tag=Ply.Ope.StartKeyLeft] run tag @s remove Ply.Ope.StartKeyLeft
    execute if entity @s[tag=Ply.Ope.StartKeyBack] run tag @s remove Ply.Ope.StartKeyBack
    execute if entity @s[tag=Ply.Ope.StartKeyRight] run tag @s remove Ply.Ope.StartKeyRight
    execute if entity @s[tag=Ply.Ope.StartKeyJump] run tag @s remove Ply.Ope.StartKeyJump
    execute if entity @s[tag=Ply.Ope.StartKeySprint] run tag @s remove Ply.Ope.StartKeySprint
    execute if entity @s[tag=Ply.Ope.StartKeySneak] run tag @s remove Ply.Ope.StartKeySneak
