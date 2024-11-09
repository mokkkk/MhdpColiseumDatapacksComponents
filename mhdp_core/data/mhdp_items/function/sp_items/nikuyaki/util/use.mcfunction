#> mhdp_items:sp_items/nikuyaki/util/use
#
# 砥石使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 使用中の場合、中断
    execute if entity @s[tag=Itm.Sp.Nikuyaki.Using] run return 0

# 使用開始
    scoreboard players set @s Itm.Nikuyaki.GeneralTimer 0
    tag @s add Itm.Sp.Nikuyaki.Using

# モデル召喚
    execute at @s rotated ~ 0 positioned ^ ^ ^2 run function animated_java:nikuyaki/summon {args: {animation: 'baking'}}

# 紐づけ
    scoreboard players operation @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] Ply.Uid = @s Ply.Uid
    execute as @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] at @s run function animated_java:nikuyaki/animations/baking/play

# ride
    ride @s mount @n[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=!Itm.Nikuyaki.Chair.IsRode]

# 終了
    tag @n[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=!Itm.Nikuyaki.Chair.IsRode] add Itm.Nikuyaki.Chair.IsRode
    tag @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] remove Itm.Root.Nikuyaki.Start
