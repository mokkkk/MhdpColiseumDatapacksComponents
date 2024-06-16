#> mhdp_core:phase/1_village/quest/accept/macro/m.notify
#
# クエスト受注処理 受注内容の表示
#
# @within function mhdp_core:phase/1_village/quest/accept/notify

# クエスト名
    $tellraw @a [{"text":" - $(Name) - "}]

# 難易度
    $tellraw @a [{"text":"難易度："},{"text":"$(Level)","bold":false,"color":"gold"}]

# 出現モンスター
    $data modify storage mhdp_core:temp Data.Monster1Tellraw set value '$(Monster1)'
    $data modify storage mhdp_core:temp Data.Monster2Tellraw set value '$(Monster2)'
    $data modify storage mhdp_core:temp Data.Monster3Tellraw set value '$(Monster3)'
    $data modify storage mhdp_core:temp Data.Monster4Tellraw set value '$(Monster4)'
    $data modify storage mhdp_core:temp Data.Monster5Tellraw set value '$(Monster5)'
    tellraw @a [{"text":"ターゲット：\n\n  "},{"interpret":true,"nbt":"Data.Monster1Tellraw","storage":"mhdp_core:temp"},{"text":"  "},{"interpret":true,"nbt":"Data.Monster2Tellraw","storage":"mhdp_core:temp"},{"text":"  "},{"interpret":true,"nbt":"Data.Monster3Tellraw","storage":"mhdp_core:temp"},{"text":"  "},{"interpret":true,"nbt":"Data.Monster4Tellraw","storage":"mhdp_core:temp"},{"text":"  "},{"interpret":true,"nbt":"Data.Monster5Tellraw","storage":"mhdp_core:temp"}]

# 制限時間
    $tellraw @a [{"text":"制限時間："},{"text":"$(TimeLimit)"},{"text":"分"}]

# 失敗条件
    $tellraw @a [{"text":"失敗条件："},{"text":"$(DeathCount)"},{"text":"回力尽きる"}]
