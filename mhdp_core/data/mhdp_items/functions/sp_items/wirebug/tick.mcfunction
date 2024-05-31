#> mhdp_items:sp_items/wirebug/tick
#
# 翔蟲のメイン処理
#
# @within function mhdp_items:sp_items/tick

# クールタイム減少
    execute if entity @s[tag=!Itm.Sp.Wirebug.Using] if score @s Itm.Wirebug.CoolTime matches 1 run tellraw @s {"text": "【翔蟲が使用可能になった】","color": "green"}
    execute if entity @s[tag=!Itm.Sp.Wirebug.Using] if score @s Itm.Wirebug.CoolTime matches 1.. run scoreboard players remove @s Itm.Wirebug.CoolTime 1
    execute if entity @s[tag=Itm.Sp.Wirebug.UsedSkill] if score @s Itm.Wirebug.CoolTime matches ..0 run tag @s remove Itm.Sp.Wirebug.UsedSkill

# 使用中処理
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run function mhdp_items:sp_items/wirebug/using/tick
