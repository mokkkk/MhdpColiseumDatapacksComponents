#> mhdp_core:phase/1_village/change_phase/check
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/bell/click

# 条件確認
    data modify storage mhdp_core:temp IsError set value false
    # クエストの受注確認
        function mhdp_core:phase/1_village/change_phase/check_quest
    # TODO: プレイヤーの状態確認

# エラーがある場合、エラー内容を表示
    execute if data storage mhdp_core:temp {IsError:true} run function mhdp_core:phase/1_village/change_phase/show_error

# フェーズ変更
    execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:phase/1_village/change_phase/change

# 終了
    data remove storage mhdp_core:temp IsError
    data remove storage mhdp_core:temp Errors
