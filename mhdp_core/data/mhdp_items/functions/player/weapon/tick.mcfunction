#> mhdp_items:player/weapon/tick
#
# 武器操作可能時のみのtick処理
#
# @within function mhdp_items:player/tick

# 武器の納刀・抜刀状態取得
    function mhdp_items:player/weapon/sheathe/main

# スタミナ処理
    function mhdp_items:player/weapon/stamina/main

# UI表示
    function mhdp_items:player/ui/main

# 直接攻撃処理の実行

# 各武器のメイン処理実行
    function mhdp_items:core/switch/weapon_main

# 納刀フラグ付与時、納刀処理実行
    execute if entity @s[tag=Ply.Flag.NormalSheathe] run function mhdp_items:player/weapon/sheathe/normal_sheathe
