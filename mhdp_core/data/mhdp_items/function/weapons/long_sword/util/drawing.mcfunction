#> mhdp_items:weapons/long_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# サブ武器装備
    # タグ付与
        tag @s add Ply.Weapon.Drawing.Sub
    # サブ武器装備
        execute if items entity @s weapon.mainhand ender_eye[custom_data~{IsMhdpWeapon:1b}] unless items entity @s weapon.offhand * run item replace entity @s weapon.offhand from entity @s weapon.mainhand
    # 武器のデータ書き換え
        function api:weapon/draw_sub.m {Slot:"offhand", Cmd:"drawing_sub"}

# ステータス設定
    function mhdp_items:weapons/long_sword/util/set_status

# 効果音
    playsound minecraft:item.axe.scrape master @s ~ ~ ~ 1 1.5
    playsound minecraft:item.spear.lunge_1 master @s ~ ~ ~ 0.4 0.6
