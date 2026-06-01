#> mhdp_monsters:core/switch/macro/m.start_attack
# 
# 分岐処理 モンスターtick処理 本体
#
# @within function mhdp_monsters:core/switch/start_attack

# 処理実行
    $execute store success score #mndp_temp_success MhdpCore run function mhdp_monster_$(Prefix):core/tick/on_battle/attack/$(Part)
    $execute unless score #mndp_temp_success MhdpCore matches 1.. run tellraw @a {"text":"【ERROR: 攻撃開始処理が見つかりませんでした： mhdp_monster_$(Prefix):core/tick/on_battle/attack/$(Part)】","color":"red"}
    $function animated_java:$(Prefix)/as_all_locators {command:'function mhdp_monster_$(Prefix):core/tick/on_battle/attack/$(Part)'}
    scoreboard players reset #mndp_temp_success MhdpCore
