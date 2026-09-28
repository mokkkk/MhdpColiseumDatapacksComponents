#> assets:object/10047.valk_red_flash/init/
#
# 龍閃 赤フラッシュ VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# ロング版（ループ。呼び出し側が kill するまで生存）
    execute if data storage api: Arg.Override{IsLong:true} run tag @s add 10047.Long

# 追従版（呼び出し側が 10047.IsFollow タグで対象を特定し tp で追従させる）
    execute if data storage api: Arg.Override{IsFollow:true} run tag @s add 10047.IsFollow

# ビームVFX用（true で tick/beam を実行し、経過tickに応じてスケールを拡大させる）
    execute if data storage api: Arg.Override{IsBeamVfx:true} run tag @s add 10047.IsBeamVfx

# スケール上書き（Override.Scale が整数で渡された場合。旧 lance_upper は 7 → 12）
    execute if data storage api: Arg.Override.Scale run function assets:object/10047.valk_red_flash/init/apply_scale.m with storage api: Arg.Override
