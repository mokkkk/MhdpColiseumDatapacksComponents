#> mhdp_monster_ranposu:core/tick/on_caution/start
#
# tick処理 警戒中 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 1

# ? 表示
    kill @n[type=text_display,tag=9.Ranposu,distance=..10]
    data modify storage api: Arg.Override.Text set value "?"
    data modify storage api: Arg.Override.Tag set value "Ranposu"
    data modify storage api: Arg.Override.Scale set value 2
    data modify storage api: Arg.Override.Height set value 0.4
    execute positioned as @n[type=slime,tag=Mns.HitBox.Ranposu.Head] run function api:object/summon.m {ObjectId:9}
    execute as @n[type=text_display,tag=9.Ranposu,distance=..10] run ride @s mount @n[type=slime,tag=Mns.HitBox.Ranposu.Head]

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"caution"}

# アニメーション変更
    function mhdp_monster_ranposu:core/tick/animation/change/main
