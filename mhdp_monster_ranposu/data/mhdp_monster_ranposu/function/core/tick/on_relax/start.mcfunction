#> mhdp_monster_ranposu:core/tick/on_relax/start
#
# tick処理 非発見時 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 0

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"relax"}

# 戦闘状態解除
    tag @s remove Mns.State.IsBattle
