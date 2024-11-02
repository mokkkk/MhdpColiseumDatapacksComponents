#> mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/main
#
# 武器チュートリアル 弓・天ノ型
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 対象武器を装備したプレイヤーを、説明対象に含める
    execute if entity @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.Bow,tag=Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial] run team join Team.WeaponTutorial @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.Bow,tag=Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial]

# 特徴
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/0_intro

# 射撃・剛射
    execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/1_shot

# チャージステップ
    execute if score @s Vlg.General.Counter matches 2 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/2_cs

# 竜の一矢
    execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/3_pierce

# # 翔蟲装備：飛翔にらみ撃ち
#     execute if score @s Vlg.General.Counter matches 3 unless entity @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=Itm.Sp.Wirebug] run scoreboard players add @s Vlg.General.Counter 1
#     execute if score @s Vlg.General.Counter matches 3 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/3_flying_shot

# おわり
    execute if score @s Vlg.General.Counter matches 4 run function mhdp_core:phase/1_village/villager/weapon_tutorial/bow_tec/4_end

# 終了
    execute if score @s Vlg.General.Counter matches 5.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
