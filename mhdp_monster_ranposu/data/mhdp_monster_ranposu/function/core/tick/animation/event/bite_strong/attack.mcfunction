#> mhdp_monster_ranposu:core/tick/animation/event/bite_strong/attack
#
# アニメーションイベントハンドラ 強嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# ヒット確認
    # 対プレイヤー
        function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:1001, Name:"BiteStrong"}
        execute positioned ^ ^1.6 ^5 run function api:bounding/cuboid_with_preview.m {Selector:"@a[tag=Ply.State.EnableDamage,distance=..20]",Tag:"Temp.Hit",X:"1.8",Y:"1.9",Z:"2"}
        execute as @a[tag=Temp.Hit] run function api:damage_entity_to_player
        tag @a remove Temp.Hit
    # 対建築物
        function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:1001, Name:"BiteStrong"}
        tag @s add Temp.ObjectAttacker
        execute positioned ^ ^1.6 ^4.1 run function api:bounding/cuboid_with_preview_blue.m {Selector:"@e[type=shulker,tag=Entity.EnableDamage,distance=..20]",Tag:"Temp.Hit",X:"2",Y:"3",Z:"3"}
        execute as @e[type=shulker,tag=Temp.Hit,distance=..50] run function api:damage_entity_to_object
        data remove storage api: Arg
        tag @e[type=shulker,tag=Temp.Hit,distance=..50] remove Temp.Hit
        tag @s remove Temp.ObjectAttacker
    # 対モンスター
        function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:1001, Name:"BiteStrong"}
        tag @s add Temp.Attacker
        execute positioned ^ ^1.6 ^4.1 run function api:bounding/cuboid.m {Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.Hitbox.Ranposu,distance=..20]",Tag:"Temp.Hit",X:"2",Y:"3",Z:"3"}
        execute as @e[type=shulker,tag=Temp.Hit,distance=..50] run function api:damage_entity_to_entity
        data remove storage api: Arg
        tag @e[type=shulker,tag=Temp.Hit,distance=..50] remove Temp.Hit
        tag @s remove Temp.Attacker

# 終了
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
