#> mhdp_monsters:core/super/tick/post_tick
# 
# 共通処理 tick終了時

# バグ対策
    # forceload範囲外に出た場合、強制的にremove処理を行う
        execute at @s unless function mhdp_monsters:core/util/tick/check_force_load run function mhdp_monsters:core/util/tick/force_remove

# 埋まり防止処理: 
    # ブロック内にいる場合
        execute at @s unless block ~ ~ ~ #mhdp_core:no_collision run function mhdp_monsters:core/util/tick/move/adjust_position
    # 建築内にいる場合
        execute if entity @s[tag=Mns.State.OnObject] at @s if entity @n[type=shulker,dx=0.1,dy=0.1,dz=0.1] run function mhdp_monsters:core/util/tick/move/back_to_rear.m

# モンスター用の一時storageを消去
    data remove storage mhdp_core:temp MonsterTemp

# タグ消去
    tag @s remove Mns.Temp.IsTick
