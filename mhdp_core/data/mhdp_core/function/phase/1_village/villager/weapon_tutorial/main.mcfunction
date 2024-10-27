#> mhdp_core:phase/1_village/villager/weapon_tutorial/main
#
# 武器チュートリアル メイン処理
#
# @within function mhdp_core:tick

# 対象のプレイヤーが村を出た場合、チュートリアル中断
    execute unless entity @a[tag=Vlg.WeaponTutorial.TargetPlayer]

# 片手剣・地ノ型
    execute if entity @s[tag=Vlg.WeaponTutorial.ShortSword.Normal] run function mhdp_core:phase/1_village/villager/weapon_tutorial/short_sword_normal/main