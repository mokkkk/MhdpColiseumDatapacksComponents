#> mhdp_monster_tutorial_02:core/tick/00_bc/start
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    tag @s add Mns.Tutorial02.Bc

# カウンター設定
    scoreboard players set @s Mns.General.DummyCounter 1

# タイマーリセット
    scoreboard players set @s Mns.General.DummyTimer 0

# チュートリアル用タグ付与
    tag @n[tag=Mns.Root.Ranposu] add Mns.State.Tutorial.IsBroken
    tag @n[tag=Mns.Root.Ranposu] add Mns.State.IsDisableAnger
