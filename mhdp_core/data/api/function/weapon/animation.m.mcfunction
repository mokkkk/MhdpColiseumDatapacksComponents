#> api:weapon/animation.m
#
# 武器アニメーション時の処理
#
# @input storage api: Arg.Slot 対象のSlot、mainhandまたはoffhand
# @input storage api: Arg.Cmd CusmonModelDataに指定する値

# 武器にのみ実行する
    execute unless entity @s[type=player] run return run function api:weapon/error {Message:"ERROR: 実行者がプレイヤーではありません"}
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run function api:weapon/error {Message:"ERROR: 対象のスロットが武器ではありません"}

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{function: set_custom_model_data, strings:{values :["$(Cmd)"], mode: replace_all}} ,{function: set_custom_data,tag:{IsDrawing:1b}}]

# attribute設定
    attribute @s attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s attack_speed modifier add mhdp_core:weapon_attack_speed -4.0 add_value
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s attack_damage modifier add mhdp_core:weapon_attack_damage -1.0 add_value

# 終了
    data remove storage mhdp_core:temp Args

