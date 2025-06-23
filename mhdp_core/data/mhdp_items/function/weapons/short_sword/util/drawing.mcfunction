#> mhdp_items:weapons/short_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    # say TODO:片手剣抜刀処理

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
    function mhdp_items:weapons/short_sword/util/set_status
