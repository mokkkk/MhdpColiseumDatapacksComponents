#> mhdp_monster_ranposu:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.show_bossbar

# 当たり判定を消去
    execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run function mhdp_monsters:core/util/other/remove_hitbox

# クエストの死亡時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death
