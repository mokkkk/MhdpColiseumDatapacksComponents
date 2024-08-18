#> mhdp_items:sp_items/carving_knife/main
#
# 剥ぎ取りナイフメイン処理
#
# @within function mhdp_items:sp_items/carving_knife/util/use

# アイテムを召喚
    execute if entity @s[tag=!Mns.Root] run function mhdp_monsters:core/switch/loot_item
    execute if entity @s[tag=Mns.Root] on passengers if entity @s[tag=aj.data] run function mhdp_items:sp_items/carving_knife/main_monster with entity @s data.locators.shadow

# 演出
    playsound minecraft:entity.player.hurt_sweet_berry_bush master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8

# 制限回数
    scoreboard players remove @s Mns.General.Carving.Count 1
    execute if score @s Mns.General.Carving.Count matches ..0 run tag @s add Mns.State.IsEndCarving
