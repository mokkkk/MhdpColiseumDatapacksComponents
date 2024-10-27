#> mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/main
#
# 武器チュートリアル 片手剣・天ノ型
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 対象武器を装備したプレイヤーを、説明対象に含める
    execute if entity @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.ShortSword,tag=Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial] run team join Team.WeaponTutorial @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial]

# 特徴
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/0_intro

# # コンボ
#     execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/1_sword_combo

# # ガード
#     execute if score @s Vlg.General.Counter matches 2 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/2_guard

# # 回転斬り
#     execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/3_spin

# # 剣盾コンボ
#     execute if score @s Vlg.General.Counter matches 4 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/4_rush

# # 翔蟲装備：飛影
#     execute if score @s Vlg.General.Counter matches 5 unless entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Itm.Sp.Wirebug] run scoreboard players add @s Vlg.General.Counter 1
#     execute if score @s Vlg.General.Counter matches 5 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/5_tobikage

# おわり
    execute if score @s Vlg.General.Counter matches 6 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/6_end

# 終了
    execute if score @s Vlg.General.Counter matches 7.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
