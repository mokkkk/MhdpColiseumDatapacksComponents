#> mhdp_core:phase/1_village/villager/weapon_tutorial/main
#
# 武器チュートリアル メイン処理
#
# @within function mhdp_core:tick

# 対象のプレイヤーが村を出た場合、チュートリアル中断
    execute unless entity @a[tag=Vlg.WeaponTutorial.TargetPlayer]

# 片手剣・地ノ型
    execute if entity @s[tag=Vlg.WeaponTutorial.ShortSword.Normal] run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/main

# 片手剣・天ノ型
    execute if entity @s[tag=Vlg.WeaponTutorial.ShortSword.Tec] run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_tec/main

# 片手剣・地ノ型
    execute if entity @s[tag=Vlg.WeaponTutorial.GreatSword.Normal] run function mhdp_core:phase/1_village/villager/weapon_tutorial/great_sword_normal/main

# 対象プレイヤー更新
    tag @a[tag=Ply.State.IsTraining,team=!Team.WeaponTutorial,tag=Vlg.WeaponTutorial.TargetPlayer] remove Vlg.WeaponTutorial.TargetPlayer
    tag @a[tag=Ply.State.IsTraining,team=Team.WeaponTutorial,tag=!Vlg.WeaponTutorial.TargetPlayer] add Vlg.WeaponTutorial.TargetPlayer
