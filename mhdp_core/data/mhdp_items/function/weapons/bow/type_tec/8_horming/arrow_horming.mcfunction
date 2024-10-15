#> mhdp_items:weapons/bow/type_tec/8_horming/arrow_horming
#
# 導ノ矢 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# ターゲットに向かって移動
    execute rotated ~ 0 positioned ^ ^ ^-1 facing entity @n[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] feet rotated ~ ~ positioned ^ ^ ^-1 facing entity @s feet positioned as @s positioned ^ ^ ^-1 rotated as @s rotated ~ ~ positioned ^ ^ ^-1 facing entity @s feet positioned as @s run tp @s ^ ^ ^ ~ ~
