#> mhdp_items:sp_items/wirebug/util/use
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# クールタイムが終わっていない場合、中断
    execute if score @s Itm.Wirebug.CoolTime matches 1.. run tellraw @s {"text":"【翔蟲はまだ使用できません】","color": "red"}
    execute if score @s Itm.Wirebug.CoolTime matches 1.. run return 0

# クールタイム設定
    scoreboard players set @s Itm.Wirebug.CoolTime 40

# 使用開始
    scoreboard players set @s Itm.Wirebug.GeneralTimer 0
    tag @s add Itm.Sp.Wirebug.Using
