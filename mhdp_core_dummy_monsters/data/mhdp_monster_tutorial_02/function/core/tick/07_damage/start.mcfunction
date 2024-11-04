#> mhdp_monster_tutorial_02:core/tick/07_damage/start
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    tag @s add Mns.Tutorial02.Damage

# カウンター設定
    scoreboard players set @s Mns.General.DummyCounter 8

# タイマーリセット
    scoreboard players set @s Mns.General.DummyTimer 0

# チュートリアル用タグ削除
    tag @n[tag=Mns.Root.Ranposu] remove Mns.State.IsDisableAnger
