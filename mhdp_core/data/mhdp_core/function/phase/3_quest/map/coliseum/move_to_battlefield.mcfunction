#> mhdp_core:phase/3_quest/map/coliseum/move_to_battlefield
#
# クエスト中のtick処理 大闘技場 戦闘フィールドへの移動
#
# @within function mhdp_core:phase/3_quest/tp/1_colliseum

# 移動
    tp @s -20 66 87

# 1秒間だけダメージを軽減する
    effect give @s resistance 1 3 true

# 状態の更新
    tag @s add Ply.State.MnsTarget
    tag @s add Ply.State.EnableDamage

# ボスバーの表示
    execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/show_bossbar
