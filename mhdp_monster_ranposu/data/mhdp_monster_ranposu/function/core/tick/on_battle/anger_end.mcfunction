#> mhdp_monster_ranposu:core/tick/on_battle/anger_end
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 怒り状態終了
    tag @s remove Mns.State.IsAnger

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"battle"}
