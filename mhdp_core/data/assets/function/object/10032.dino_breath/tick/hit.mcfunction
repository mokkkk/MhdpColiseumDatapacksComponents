#> assets:object/10032.dino_breath/tick/hit
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# 攻撃実行
    execute at @s as @n[type=item_display,tag=Mns.Root.Dino] run function assets:object/10032.dino_breath/tick/attack

# 終了
    tag @s add 10032.IsAttacked
    kill @s
