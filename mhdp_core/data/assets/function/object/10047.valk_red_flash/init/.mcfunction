#> assets:object/10047.valk_red_flash/init/
#
# 龍閃 赤フラッシュ VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# ロング版（ループ・追従。呼び出し側が kill するまで生存）
    execute if data storage api: Arg.Override{IsLong:true} run tag @s add 10047.Long

# スケール上書き（Override.Scale が整数で渡された場合。旧 lance_upper は 7 → 12）
    execute if data storage api: Arg.Override.Scale run function assets:object/10047.valk_red_flash/init/apply_scale.m with storage api: Arg.Override
