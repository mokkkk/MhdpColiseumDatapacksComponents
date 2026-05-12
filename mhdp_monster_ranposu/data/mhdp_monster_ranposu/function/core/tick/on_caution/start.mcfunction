#> mhdp_monster_ranposu:core/tick/on_caution/start
#
# tick処理 警戒中 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 1

# ? 表示
    data modify storage api: Arg.Override.Text set value "?"
    data modify storage api: Arg.Override.Color set value "#2EC0FF"
    data modify storage api: Arg.Override.Scale set value 4
    execute positioned ~ ~4 ~ run function api:object/summon.m {ObjectId:9}

# アニメーション変更
    function mhdp_monster_ranposu:core/tick/animation/change/main
