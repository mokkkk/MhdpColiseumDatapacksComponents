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
    execute if score @s Mns.General.DummyCounter matches ..0 run function mhdp_monster_tutorial_01:core/tick/00_bc

# UI
    execute if score @s Mns.General.DummyCounter matches 1 run function mhdp_monster_tutorial_01:core/tick/01_ui

# 武器基本動作
    execute if score @s Mns.General.DummyCounter matches 2 run function mhdp_monster_tutorial_01:core/tick/02_weapon_base
    execute if score @s Mns.General.DummyCounter matches 3 run function mhdp_monster_tutorial_01:core/tick/03_weapon_base_drawing

# 攻撃
    execute if score @s Mns.General.DummyCounter matches 4 run function mhdp_monster_tutorial_01:core/tick/04_weapon_base_attack

# ガードと回避
# モンスターの攻撃のダメージは大きいので、できれば避ける
# 攻撃をガード、回避成功できるまで待つ
    execute if score @s Mns.General.DummyCounter matches 5 run function mhdp_monster_tutorial_01:core/tick/05_monster_attack
    execute if score @s Mns.General.DummyCounter matches 6 run function mhdp_monster_tutorial_01:core/tick/06_monster_attack_guard
    execute if score @s Mns.General.DummyCounter matches 7 run function mhdp_monster_tutorial_01:core/tick/07_monster_attack_avoid

# モンスターの部位と部位破壊
# モンスターの部位ごとに与えられるダメージが違う
# 頭を集中して攻撃すると破壊できる
# 一部モンスターは、部位破壊することで有利に戦える  
    execute if score @s Mns.General.DummyCounter matches 8 run function mhdp_monster_tutorial_01:core/tick/08_monster_defence
    execute if score @s Mns.General.DummyCounter matches 9 run function mhdp_monster_tutorial_01:core/tick/09_monster_break

# 怒り状態
# 怒り状態は非常に危険
# 回避に専念しても良い
    execute if score @s Mns.General.DummyCounter matches 10 run function mhdp_monster_tutorial_01:core/tick/10_monster_anger

# アイテムと特殊装具(翔蟲)
# アイテムの効果は説明文に書かれている
# 特殊装具のUI例と、鉄蟲糸技の使い方
    execute if score @s Mns.General.DummyCounter matches 11 run function mhdp_monster_tutorial_01:core/tick/11_item

# 本番
    execute if score @s Mns.General.DummyCounter matches 12 run function mhdp_monster_tutorial_01:core/tick/12_battle

# 剥ぎ取り
# 訓練所
    execute if score @s Mns.General.DummyCounter matches 13 run function mhdp_monster_tutorial_01:core/tick/13_end

# 終了
    execute if score @s Mns.General.DummyCounter matches 14.. run function mhdp_monster_tutorial_01:core/death/death

# ループ
    # execute if score @s Mns.General.DummyTimer matches 1800.. run scoreboard players set @s Mns.General.DummyTimer 0
