#> mhdp_core:phase/3_quest/change_phase/general/player/weapon/reset
#
# クエスト終了時 プレイヤーのリセット処理
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# 武器を消去
    clear @s ender_eye[custom_data~{IsMhdpWeapon:1b}]

# アイテムの用意
    item replace block 0 0 0 container.0 with ender_eye

# 個別ストレージの武器データをコピー
    function mhdp_core:player/data/load_data
    data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.Mainweapon.components

# プレイヤーに渡す
    execute unless items entity @s weapon.offhand * run tag @s add Ply.Temp.NoItemsInOffhand
    execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace entity @s weapon.offhand from block 0 0 0 container.0
    execute unless entity @s[tag=Ply.Temp.NoItemsInOffhand] run loot give @s mine 0 0 0 debug_stick
    tag @s remove Ply.Temp.NoItemsInOffhand

# 終了
    item replace block 0 0 0 container.0 with air
