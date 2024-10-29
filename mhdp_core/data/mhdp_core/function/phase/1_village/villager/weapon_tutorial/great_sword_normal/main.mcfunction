#> mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/main
#
# 武器チュートリアル 大剣・地ノ型
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 対象武器を装備したプレイヤーを、説明対象に含める
    execute if entity @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.GreatSword,tag=!Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial] run team join Team.WeaponTutorial @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.GreatSword,tag=!Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial]

# 特徴
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/0_intro

# 溜め斬り
    execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/1_charge_slash

# タックル
    # 地の型からタックルを削除したため、スキップ
        execute if score @s Vlg.General.Counter matches 2 run scoreboard players add @s Vlg.General.Counter 1
    # execute if score @s Vlg.General.Counter matches 2 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/2_tackle

# ガード
    execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/3_guard

# 大溜め斬り
    execute if score @s Vlg.General.Counter matches 4 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/4_charge_great

# 翔蟲装備：ハンティングエッジ
    execute if score @s Vlg.General.Counter matches 5 unless entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Itm.Sp.Wirebug] run scoreboard players add @s Vlg.General.Counter 1
    execute if score @s Vlg.General.Counter matches 5 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/5_hunting_edge

# おわり
    execute if score @s Vlg.General.Counter matches 6 run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/6_end

# 終了
    execute if score @s Vlg.General.Counter matches 7.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
