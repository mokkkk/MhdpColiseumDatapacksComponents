#> assets:core/monster/quest_setup/
#
# クエスト初期化時のモンスター配置処理

# データ取り出し
    function assets:core/monster/quest_setup/get

# チェック
    function assets:core/monster/quest_setup/check.m with storage mhdp_core:temp Arg

# 出現条件 = Initialの場合、配置処理を行う
    execute if data storage mhdp_core:temp Arg{Timing:"Initial"} run function assets:core/monster/quest_setup/summon.m with storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp Arg

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:monster/quest_setup

# データが残っている限り繰り返す
    execute if data storage mhdp_core:game_data ActiveQuest.TargetMonsters[0] run function assets:core/monster/quest_setup/get
