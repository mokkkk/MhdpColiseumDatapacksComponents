#> mhdp_items:hunter_note/options/confirm
#
# ハンターノート操作 オプション
#
# @within function mhdp_core:player/tick

# 設定の適用

# カメラ効果
    scoreboard players operation @s Ply.Ope.HunterNote.Options %= #const_100 Const
    execute unless score @s Ply.Ope.HunterNote.Options matches 20.. run tag @s remove Ply.Option.DisableCameraEffect
    execute if score @s Ply.Ope.HunterNote.Options matches 20.. run tag @s add Ply.Option.DisableCameraEffect

# 移動ジャンプ
    scoreboard players operation @s Ply.Ope.HunterNote.Options %= #const_10 Const
    execute if score @s Ply.Ope.HunterNote.Options matches ..1 run tag @s remove Ply.Option.DisableMoveJump
    execute if score @s Ply.Ope.HunterNote.Options matches 2.. run tag @s add Ply.Option.DisableMoveJump

# メインメニューに戻る
    dialog show @s mhdp_items:hunter_note/general
