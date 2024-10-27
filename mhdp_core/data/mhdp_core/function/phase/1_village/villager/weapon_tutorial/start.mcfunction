#> mhdp_core:phase/1_village/villager/weapon_tutorial/start
#
# 村のtick処理
#
# @within function mhdp_core:tick

# チュートリアル再生用エンティティ召喚
    tellraw @s {"text":"【武器の説明を開始します...】"}
    summon item_display ~ ~10 ~ {Tags:["Vlg.Root","Vlg.WeaponTutorial"]}

# 対象のプレイヤーを取得
    scoreboard players operation @n[tag=Vlg.WeaponTutorial] Vlg.WeaponTutorial.TargetPlayerUid = @s Ply.Uid
