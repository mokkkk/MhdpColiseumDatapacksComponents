#> mhdp_core:phase/1_village/change_phase/check_player
#
# 次Phaseへ遷移できるか確認する プレイヤーごとの処理
#
# @within function mhdp_core:phase/1_village/bell/click

# ゲームモード変更
    gamemode adventure @s

# カーソルアイテムに関するチェック
    function mhdp_core:phase/1_village/change_phase/player/check_cursor

# 武器に関するチェック
    function mhdp_core:phase/1_village/change_phase/player/check_weapon

# 特殊装具に関するチェック
    function mhdp_core:phase/1_village/change_phase/player/check_sp_item
