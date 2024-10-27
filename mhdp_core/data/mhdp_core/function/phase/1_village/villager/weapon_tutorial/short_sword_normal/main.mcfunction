#> mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/main
#
# 武器チュートリアル 片手剣・地ノ型
#
# @within function mhdp_core:tick

# タイマー増加
    scoreboard players add @s Vlg.General.Timer 1

# 対象武器を装備したプレイヤーを、説明対象に含める
    execute if entity @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial] run team join Team.WeaponTutorial @a[tag=Ply.State.IsTraining,tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech,team=!Team.WeaponTutorial]

# 特徴
    execute if score @s Vlg.General.Counter matches ..0 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/0_intro

# 通常コンボ
    execute if score @s Vlg.General.Counter matches 1 run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/1_sword_combo

# ガード

# 回転斬り

# 剣盾コンボ

# 翔蟲装備：飛影

# 終了

# 終了
    execute if score @s Vlg.General.Counter matches 11.. run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
