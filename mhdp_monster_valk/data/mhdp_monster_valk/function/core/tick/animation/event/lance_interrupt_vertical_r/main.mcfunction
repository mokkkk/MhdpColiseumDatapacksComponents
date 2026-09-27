#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r/main
#
# アニメーションイベントハンドラ 割り込み 翼槍叩きつけ R
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 106..116 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 117..122 at @s run tp @s ^ ^ ^-0.05

# 演出
    # タメ
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..42 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 40..50 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    # 終了後
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 101 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 122 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 122 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 135 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        execute if score @s aj.lance_interrupt_vertical_r.frame matches 150 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 64 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Vertical.Right"}]
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 64 positioned ^-1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r/attack
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 68 positioned ^-1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/particle_ring
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 68 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_interrupt_vertical_r.frame matches 151 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r/end
