#> mhdp_monster_dino:core/tick/animation/event/polish/main
#
# アニメーションイベントハンドラ 研ぎ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.polish.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.polish.frame matches 16 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.polish.frame matches 16..65 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.polish.frame matches 66 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.polish.frame matches 16..65 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/polish/particle_head_polish"}
    execute if score @s aj.polish.frame matches 78..105 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/polish/particle_head_flame"}
    execute if score @s aj.polish.frame matches 115 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態変更
    execute if score @s aj.polish.frame matches 66 run function mhdp_monster_dino:core/util/phase/tail_rust_end
    execute if score @s aj.polish.frame matches 78 run function mhdp_monster_dino:core/util/phase/head_heat_start

# 終了
    execute if score @s aj.polish.frame matches 127 run function mhdp_monster_dino:core/tick/animation/event/polish/end
