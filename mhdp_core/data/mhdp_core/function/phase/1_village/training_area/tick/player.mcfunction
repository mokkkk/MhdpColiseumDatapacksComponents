#> mhdp_core:phase/1_village/training_area/tick/player
#
# 訓練所のtick処理
#
# @within function 

# 特殊装具のクールタイムを減らす
    execute if entity @s[tag=Itm.Sp.Wirebug,tag=Itm.Sp.Wirebug.Using] if score @s Itm.Wirebug.GeneralTimer matches 15.. run scoreboard players set @s Itm.Wirebug.CoolTime 0
    execute if entity @s[tag=Itm.Sp.Wirebug,tag=!Itm.Sp.Wirebug.Using] if score @s Itm.Wirebug.CoolTime matches 2.. run scoreboard players set @s Itm.Wirebug.CoolTime 0
    execute if entity @s[tag=Itm.Sp.ImmovableCloth] if score @s Itm.ImmovableCloth.CoolTime matches 2.. run scoreboard players set @s Itm.ImmovableCloth.CoolTime 0
