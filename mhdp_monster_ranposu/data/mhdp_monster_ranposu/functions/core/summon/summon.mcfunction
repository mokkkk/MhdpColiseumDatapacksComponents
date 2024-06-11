#> mhdp_monster_ranposu:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# モデル召喚
    function animated_java:ranposu_aj/summon
    # summon armor_stand ~ ~ ~ {Tags:["Test.Ranposu"]}

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Ranposu] at @s run function mhdp_monster_ranposu:core/summon/summon_init
    # テスト用にアマスタ対象で実行
        # execute as @e[type=armor_stand,tag=Test.Ranposu] at @s run function mhdp_monster_ranposu:core/summon/summon_init

say ドスランポス召喚処理