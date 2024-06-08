#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon
#
# クエスト開始処理 プレイヤー実行 武器のセットアップ
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# アイテムの用意
    item replace block 0 0 0 container.0 with ender_eye

# 個別ストレージの武器データをコピー
    function mhdp_core:player/data/load_data
    data modify block 0 0 0 Items[{Slot:0b}].components set from storage mhdp_core:temp PlayerData.Item.MainWeapon.components
    # 斬れ味の取得
        data modify storage mhdp_core:temp Args.SharpnessArray set from storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".Sharpness
        execute if entity @s[tag=!Skill.Extra.Handicraft] run data modify storage mhdp_core:temp Args.CurrentSharpness set from storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".SharpnessMax
        execute if entity @s[tag=Skill.Extra.Handicraft] run data modify storage mhdp_core:temp Args.CurrentSharpness set from storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".SharpnessMaxCraft
        data modify storage mhdp_core:temp Result.CurrentSharpness set from storage mhdp_core:temp Args.CurrentSharpness
        function mhdp_items:core/util/calc_sharpness_color
    # クエスト中独自のデータ付与
        function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/macro/m.set_weapondata with storage mhdp_core:temp Result
    # 終了
        data remove storage mhdp_core:temp Result

# プレイヤーに渡す
    # オフハンドが空でない場合、オフハンドのアイテムを退避
        execute if items entity @s weapon.offhand * run tag @s add Ply.Temp.NoItemsInOffhand
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run say オフハンド空じゃない
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.1 from entity @s weapon.offhand
    # 武器装備
        item replace entity @s weapon.offhand from block 0 0 0 container.0
    # 退避したオフハンドアイテムを渡す
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run item replace block 0 0 0 container.0 with air
        execute if entity @s[tag=Ply.Temp.NoItemsInOffhand] run loot give @s mine 0 0 0 debug_stick
        tag @s remove Ply.Temp.NoItemsInOffhand

# 武器データを保存
    data modify storage mhdp_core:temp PlayerData.Item.UsingWeapon set from entity @s Inventory[{Slot:-106b}]
    function mhdp_core:player/data/save_data

# 武器ごとの初期化処理
    function mhdp_items:core/switch/weapon_init

# その他初期化
    tag @s remove Ply.Weapon.Deactivated
    scoreboard players set @s Wpn.DeactivateTimer 0

# 終了
    item replace block 0 0 0 container.1 with air
