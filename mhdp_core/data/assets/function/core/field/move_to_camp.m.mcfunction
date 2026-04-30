#> assets:core/field/move_to_camp.m
#
# フィールドinit共通処理

# 移動
    $tp @s $(X) $(Y) $(Z)
    $spawnpoint @s $(X) $(Y) $(Z)

# 状態の更新
    scoreboard players set @s Fld.CurrentAreaId 0
    tag @s remove Ply.State.MnsTarget
    tag @s remove Ply.State.EnableDamage
    function mhdp_monsters:core/util/other/remove_target_tag

# ボスのプレイヤー取得処理
    execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/fetch_player
    # execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/show_bossbar
