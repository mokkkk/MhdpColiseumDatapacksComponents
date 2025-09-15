#> mhdp_items:pickaxes/tick
#
# ツルハシのtick処理
#
# @within function mhdp_items:player/tick

# 建築物Idの取得
    function mhdp_items:pickaxes/util/get_build_id

# 視点位置でのコマンド実行
    # 通常：バリデートのみ
        data modify storage api: Arg.Command set value "assets:core/object/validate.m"
    # 右クリック時：使用
        execute if entity @s[tag=Ply.Ope.StartUsingCoas,tag=!Ply.Weapon.Deactivated] run data modify storage api: Arg.Command set value "api:object/build.m"
    function mhdp_items:pickaxes/util/check_look_pos
    data remove storage api: Return
