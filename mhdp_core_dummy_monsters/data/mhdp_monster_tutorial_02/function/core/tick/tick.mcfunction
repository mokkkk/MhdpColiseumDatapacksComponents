#> mhdp_monster_tutorial_02:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.General.DummyTimer 1

# BC
# 一定時間後
    execute if score @s Mns.General.DummyTimer matches 30.. run function mhdp_monster_tutorial_02:core/tick/00_bc/start
    execute if score @s Mns.General.DummyCounter matches 1 run function mhdp_monster_tutorial_02:core/tick/00_bc/main

# 武器の抜刀
# フィールドに移動した後

# 武器の攻撃
# 武器の抜刀の説明後

# 回復
# 攻撃に被弾した後

# 怒り状態
# 怒り状態になった後

# 怯み
# モンスターが怯んだ後

# 訓練所・チュートリアル
# モンスター討伐後

# 終了
    execute if score @s Mns.General.DummyCounter matches 14.. run function mhdp_monster_tutorial_02:core/death/death

# ループ
    # execute if score @s Mns.General.DummyTimer matches 1800.. run scoreboard players set @s Mns.General.DummyTimer 0
