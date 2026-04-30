#> assets:field/0001.colliseum/tick/move_to_battlefield
#
# フィールドtick処理

tellraw @a {text:"【WARN】非推奨のメソッド(assets:field/0001.colliseum/tick/move_to_battlefield)が呼び出されています",color:gold}

# 移動
    tp @s -20 66 87

# 移動直後の被弾対策で、1秒間だけダメージを軽減する
    effect give @s resistance 1 3 true

# 状態の更新
    tag @s add Ply.State.MnsTarget
    tag @s add Ply.State.EnableDamage

# ボスバーの表示
    execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/show_bossbar

# 制限時間カウントダウン開始
    execute if data storage mhdp_core:game_data ActiveQuest{IsCountDown:false} run data modify storage mhdp_core:game_data ActiveQuest.IsCountDown set value true
