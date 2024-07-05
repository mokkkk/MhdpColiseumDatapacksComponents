#> mhdp_monsters:core/util/other/turn_to_target_accurate
# 
# 汎用処理 軸合わせ
#
# @within function mhdp_monsters:/**
# @input score #mhdp_temp_rotate_tick MhdpCore 回転にかける時間

# 対象の方を向く
    execute rotated ~ 0 positioned ^ ^ ^-1 facing entity @n[tag=Temp.Rotate.Target] feet rotated ~ 0 positioned ^ ^ ^-1 facing entity @s feet positioned as @s positioned ^ ^ ^-1 rotated as @s rotated ~ 0 positioned ^ ^ ^-1 facing entity @s feet positioned as @s run tp @s ^ ^ ^ ~ 0

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
