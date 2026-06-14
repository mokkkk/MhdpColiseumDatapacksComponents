#> mhdp_monsters:core/switch/macro/m.end_attack
# 
# 分岐処理 モンスターtick処理 本体
#
# @within function mhdp_monsters:core/switch/end_attack
# 処理実行
    $execute store success score #mndp_temp_success MhdpCore run function mhdp_monster_$(Prefix):core/tick/on_battle/attack/end
    $execute unless score #mndp_temp_success MhdpCore matches 1.. run tellraw @a {"text":"【ERROR: 攻撃開始処理が見つかりませんでした： mhdp_monster_$(Prefix):core/tick/on_battle/attack/end】","color":"red"}
    $function animated_java_$(Prefix):$(Prefix)/as_all_locators {command:'function mhdp_monster_$(Prefix):core/tick/on_battle/attack/end'}
    scoreboard players reset #mndp_temp_success MhdpCore
