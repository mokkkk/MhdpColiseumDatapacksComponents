#> mhdp_items:player/weapon/sheathe/main
#
# 武器の納刀・抜刀状態取得
#
# @within function mhdp_items:player/weapon/tick

# 通常抜刀
    # 非抜刀中・メインハンドに武器・オフハンドが空
        execute if entity @s[tag=!Ply.Weapon.Drawing] if items entity @s weapon.mainhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:0b}] unless items entity @s weapon.offhand * run function mhdp_items:player/weapon/sheathe/normal_drawing

# 通常納刀
    # 抜刀中・サブ武器なし・メインハンドが空・オフハンドが武器
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Weapon.Drawing.Sub] if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:1b}] unless items entity @s weapon.mainhand * run tag @s add Ply.Flag.NormalSheathe
    # 抜刀中・サブ武器あり・メインハンドがサブ武器・オフハンドが武器(ダミーのサブ武器使用のため常に有効)
        execute if entity @s[tag=Ply.Weapon.Drawing] if items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsDrawing:1b}] if items entity @s weapon.mainhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsSubWeapon:1b,IsDrawing:1b}] run tag @s add Ply.Flag.NormalSheathe

# 強制納刀
    # 武器を投げ捨てた
        execute if entity @s[tag=Ply.Ope.DroppedEnderEye] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # 納刀中・オフハンドが武器じゃない
        execute if entity @s[tag=!Ply.Weapon.Drawing,tag=!Ply.Flag.NormalSheathe] unless items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsSubWeapon:0b}] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # メイン武器をカーソルに保持
        execute if entity @s[tag=!Ply.Flag.NormalSheathe] if items entity @s player.cursor ender_eye[custom_data~{IsMhdpWeapon:1b}] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # サブ武器をカーソルに保持
        execute if entity @s[tag=!Ply.Flag.NormalSheathe] if items entity @s player.cursor ender_eye[custom_data~{IsMhdpWeapon:1b,IsSubWeapon:1b}] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # 抜刀中・メイン武器がメインハンドにない
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Flag.NormalSheathe] unless items entity @s weapon.mainhand ender_eye[custom_data~{IsMhdpWeapon:1b}] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # 抜刀中・サブ武器あり・サブ武器がオフハンドにない
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Flag.NormalSheathe] unless items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b,IsSubWeapon:1b}] run function mhdp_items:player/weapon/sheathe/force_sheathe
    # 抜刀中・サブ武器なし・オフハンドが空じゃない(ダミーのサブ武器使用のため常に無効)
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Weapon.Drawing.Sub,tag=!Ply.Flag.NormalSheathe] if items entity @s weapon.offhand * run function mhdp_items:player/weapon/sheathe/force_sheathe

# その他処理
    # 一時的に武器無操作
        execute if entity @s[tag=Ply.Flag.NormalSheathe] run scoreboard players add @s Wpn.DeactivateTimer 5
        execute if entity @s[tag=!Ply.Weapon.Deactivated] if score @s Wpn.DeactivateTimer matches 1.. run tag @s add Ply.Weapon.Deactivated
