#> mhdp_monster_ranposu:core/tick/on_relax/start
#
# tick処理 非発見時 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 戦闘状態解除
    tag @s remove Mns.State.IsBattle
