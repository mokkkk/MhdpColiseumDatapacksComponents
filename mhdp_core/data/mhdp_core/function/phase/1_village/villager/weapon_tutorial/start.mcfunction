#> mhdp_core:phase/1_village/villager/weapon_tutorial/start
#
# 村のtick処理
#
# @within function mhdp_core:tick

# 効果音
    playsound ui.button.click master @s ~ ~ ~ 1 1

# 既にチュートリアル再生中はキャンセル
    # クリック者がチュートリアル対象の場合
        # チュートリアル再生停止
            execute if entity @s[tag=Vlg.WeaponTutorial.TargetPlayer] run tellraw @s {"text":"【武器説明を中断しました】"}
            execute if entity @s[tag=Vlg.WeaponTutorial.TargetPlayer] run return run function mhdp_core:phase/1_village/villager/weapon_tutorial/end
    # それ以外の場合
        # 利用中の警告表示
            execute if entity @n[type=item_display,tag=Vlg.WeaponTutorial] if entity @s[tag=!Vlg.WeaponTutorial.TargetPlayer] run return run tellraw @s {"text":"【他のプレイヤーが武器説明を聞いています】\n【終了までお待ちください】","color":"red"}

# チュートリアル対象タグ排除
    tag @a[tag=Vlg.WeaponTutorial.TargetPlayer] remove Vlg.WeaponTutorial.TargetPlayer

# チュートリアル再生用エンティティ召喚
    tellraw @s {"text":"【武器の説明を開始します...】"}
    summon item_display ~ ~10 ~ {Tags:["Vlg.Root","Vlg.WeaponTutorial"]}
    scoreboard players set @n[type=item_display,tag=Vlg.WeaponTutorial] Vlg.General.Counter 0

# 対象のプレイヤーを取得
    scoreboard players operation @n[type=item_display,tag=Vlg.WeaponTutorial] Vlg.WeaponTutorial.TargetPlayerUid = @s Ply.Uid
    tag @s add Vlg.WeaponTutorial.TargetPlayer

# 説明対象の武器種を設定
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=!Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.ShortSword.Normal
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword,tag=Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.ShortSword.Tec
    execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=!Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.GreatSword.Normal
    execute if entity @s[tag=Ply.Weapon.Equip.GreatSword,tag=Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.GreatSword.Tec
    execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=!Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.Bow.Normal
    execute if entity @s[tag=Ply.Weapon.Equip.Bow,tag=Ply.Weapon.Type.Tech] run tag @n[type=item_display,tag=Vlg.WeaponTutorial] add Vlg.WeaponTutorial.Bow.Tec
