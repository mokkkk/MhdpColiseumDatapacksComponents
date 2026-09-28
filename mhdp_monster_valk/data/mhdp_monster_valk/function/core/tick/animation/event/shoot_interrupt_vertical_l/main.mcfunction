#> mhdp_monster_valk:core/tick/animation/event/shoot_interrupt_vertical_l/main
#
# アニメーションイベントハンドラ 割り込み 翼叩きつけ L
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 80..90 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 91..96 at @s run tp @s ^ ^ ^-0.05

# 演出
    # タメ
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 25..28 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # 終了後
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 73 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 94 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 94 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 110 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        execute if score @s aj.shoot_interrupt_vertical_l.frame matches 121 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 36 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"VerticalS.Left"}]
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 36 positioned ^-3 ^1 ^9 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/attack
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 38 positioned ^-3 ^1 ^9 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/particle_ring
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 37 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 122 run function mhdp_monster_valk:core/tick/animation/event/shoot_interrupt_vertical_l/end
