#> mhdp_core:player/data/remove_operation
#
# playerの操作の初期化
#
# @within function mhdp_core:player/tick

# スニーク
    tag @s remove Ply.Ope.IsSneaking
    tag @s remove Ply.Ope.StartSneak
    tag @s remove Ply.Ope.StartDoubleSneak

# エンダーアイ
    tag @s remove Ply.Adv.Using.EnderEye
    tag @s remove Ply.Ope.StartUsingEnderEye
    tag @s remove Ply.Ope.EndUsingEnderEye
    tag @s remove Ply.Ope.UsedEnderEye.Short
    tag @s remove Ply.Ope.UsedEnderEye.Long

# ニンジン棒

# 食べ物

# ジャンプ
    tag @s remove Ply.Ope.StartJump
