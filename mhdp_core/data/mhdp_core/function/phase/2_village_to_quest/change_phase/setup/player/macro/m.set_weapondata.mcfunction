#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/macro/m.set_weapondata
#
# クエスト開始処理 プレイヤー実行 武器のセットアップ
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon

# データ付与
    $item modify block 0 0 0 container.0 {function:minecraft:set_custom_data,tag:{IsUsing:1b,IsSubWeapon:0b,IsDrawing:0b,CurrentSharpness:$(CurrentSharpness),CurrentSharpnessColor:$(SharpnessColor)}}