#> mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/main
#
# アニメーションイベントハンドラ 3連ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.fly_breath_triple.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/turn_start
    execute if score @s aj.fly_breath_triple.frame matches 6 run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/turn_start
    execute if score @s aj.fly_breath_triple.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 演出
    execute if score @s aj.fly_breath_triple.frame matches 2 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s aj.fly_breath_triple.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_breath_triple.frame matches 20 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_breath_triple.frame matches 70 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 発射位置決定
    execute if score @s aj.fly_breath_triple.frame matches 28 run summon area_effect_cloud ^ ^1 ^16 {Duration:30,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.fly_breath_triple.frame matches 28 unless entity @n[tag=Mns.Target.Reus,distance=..8] at @n[tag=Mns.Target.Reus,limit=1] run tp @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] ~ ~1 ~
    execute if score @s aj.fly_breath_triple.frame matches 44 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] at @s facing entity @n[type=item_display,tag=Mns.Root.Reus] feet rotated ~ 0 positioned ^10 ^ ^6 run tp @s ~ ~ ~ ~ ~
    execute if score @s aj.fly_breath_triple.frame matches 54 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] at @s positioned ^-20 ^ ^ run tp @s ~ ~ ~ ~ ~

# 攻撃
    execute if score @s aj.fly_breath_triple.frame matches 35 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/shot with entity @s data.locators.pos_head
    execute if score @s aj.fly_breath_triple.frame matches 45 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/shot with entity @s data.locators.pos_head
    execute if score @s aj.fly_breath_triple.frame matches 55 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/shot with entity @s data.locators.pos_head

# 接地
    execute at @s if block ~ ~-2.8 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute at @s unless block ~ ~-2.7 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_breath_triple.frame matches 79 run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/end
