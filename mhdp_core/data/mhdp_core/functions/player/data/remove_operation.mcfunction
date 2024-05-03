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

# ニンジン棒

# 食べ物

# ジャンプ
    execute if entity @s[tag=Ply.Ope.StartJump] run tag @s remove Ply.Ope.StartJump
