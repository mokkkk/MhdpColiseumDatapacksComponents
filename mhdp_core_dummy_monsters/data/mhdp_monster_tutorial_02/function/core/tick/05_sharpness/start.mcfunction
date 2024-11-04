#> mhdp_monster_tutorial_02:core/tick/05_sharpness/start
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    tag @s add Mns.Tutorial02.Sharpness

# カウンター設定
    scoreboard players set @s Mns.General.DummyCounter 6

# タイマーリセット
    scoreboard players set @s Mns.General.DummyTimer 0
