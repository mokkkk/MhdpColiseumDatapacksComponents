#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/main
#
# 武器チュートリアル 大剣・天ノ型
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 対象武器を装備したプレイヤーを、説明対象に含める
    execute if entity @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.GreatSword,tag=Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial] run team join Team.WeaponTutorial @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.GreatSword,tag=Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial]

# 特徴
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/0_intro

# 溜め斬り
    execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/1_charge_slash

# 強溜め斬り・真溜め斬り
    execute if score @s Vlg.General.Counter matches 2 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/2_charge_slash_high

# タックル
    execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/3_tackle

# ガード
    execute if score @s Vlg.General.Counter matches 4 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/4_guard

# 相殺斬り上げ
    execute if score @s Vlg.General.Counter matches 5 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/5_counter_upper

# 翔蟲装備：ハンティングエッジ
    execute if score @s Vlg.General.Counter matches 6 unless entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Itm.Sp.Wirebug] run scoreboard players add @s Vlg.General.Counter 1
    execute if score @s Vlg.General.Counter matches 6 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/6_hunting_edge

# おわり
    execute if score @s Vlg.General.Counter matches 7 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_tec/7_end

# 終了
    execute if score @s Vlg.General.Counter matches 8.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
