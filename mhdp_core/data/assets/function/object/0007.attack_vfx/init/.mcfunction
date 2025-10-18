#> assets:object/0007.attack_vfx/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 相殺有無
    execute if data storage api: Arg.Override{IsCounter:true} run tag @s add 7.IsCounter

# データ設定
    function assets:object/0007.attack_vfx/init/apply.m with storage api: Arg.Override
