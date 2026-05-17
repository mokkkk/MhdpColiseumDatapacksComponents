#> mhdp_monster_ranposu:core/tick/on_battle/anger_start
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 怒り状態開始
    tag @s add Mns.State.IsAnger
    scoreboard players operation @s Mns.Anger.Timer = @s Mns.Anger.Timer.Max

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"anger"}
