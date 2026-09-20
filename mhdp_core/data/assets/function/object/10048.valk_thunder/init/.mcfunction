#> assets:object/10048.valk_thunder/init/
#
# 雷 VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# 識別タグ付与（呼び出し側が Override.Tag で個体を区別する。例: WingR0, WingL2 等）
    execute if data storage api: Arg.Override.Tag run function assets:object/10048.valk_thunder/init/apply_tag.m with storage api: Arg.Override

# スケール上書き（Override.Scale が整数で渡された場合。旧 lance_biim_1 は 2）
    execute if data storage api: Arg.Override.Scale run function assets:object/10048.valk_thunder/init/apply_scale.m with storage api: Arg.Override

# 開始フレームをランダム化（複数体が同期して点滅しないように。旧 Mns.Shot.Timer = random 0..2）
    execute store result score @s MhdpCore run random value 0..2
