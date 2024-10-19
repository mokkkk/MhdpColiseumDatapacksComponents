#> mhdp_monster_tutorial_01:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# # test
#     scoreboard players add @s Mns.General.DummyTimer 1
#     execute if score @s Mns.General.DummyTimer matches 2 run say チュートリアルです
#     execute if score @s Mns.General.DummyTimer matches 62 run say さようなら
#     execute if score @s Mns.General.DummyTimer matches 122 run function mhdp_monster_tutorial_01:core/death/death

# タイマー増加
    scoreboard players add @s Mns.General.DummyTimer 1

# BC
    execute if score @s Mns.General.DummyCounter matches ..0 run function mhdp_monster_tutorial_01:core/tick/0_bc/main

# UI
    execute if score @s Mns.General.DummyCounter matches 1 run function mhdp_monster_tutorial_01:core/tick/1_ui/main

# 武器基本動作
# 攻撃
# 特殊装具(翔蟲)
# 部位破壊
# 怒り状態
# 本番
# 剥ぎ取り

# 終了
    execute if score @s Mns.General.DummyCounter matches 2.. run function mhdp_monster_tutorial_01:core/death/death

# ループ
    # execute if score @s Mns.General.DummyTimer matches 1800.. run scoreboard players set @s Mns.General.DummyTimer 0
