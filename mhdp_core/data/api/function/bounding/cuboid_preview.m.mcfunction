#> api:bounding/cuboid_preview.m
#
# 直方体当たり判定プレビュー
# item_displayによるプレビューを表示する
#
# @input arg AttackName ストレージ検索に用いる攻撃名
# @input arg Player_Selector プレイヤー用Selector
# @input arg Player_Offset_X プレイヤー用攻撃基準位置オフセット
# @input arg Player_Offset_Y プレイヤー用攻撃基準位置オフセット
# @input arg Player_Offset_Z プレイヤー用攻撃基準位置オフセット
# @input arg Player_Scale_X プレイヤー用当たり判定サイズ
# @input arg Player_Scale_Y プレイヤー用当たり判定サイズ
# @input arg Player_Scale_Z プレイヤー用当たり判定サイズ
# @input arg Entity_Selector エンティティ用Selector、モンスターに使用
# @input arg Entity_Offset_X エンティティ用攻撃基準位置オフセット
# @input arg Entity_Offset_Y エンティティ用攻撃基準位置オフセット
# @input arg Entity_Offset_Z エンティティ用攻撃基準位置オフセット
# @input arg Entity_Scale_X エンティティ用当たり判定サイズ
# @input arg Entity_Scale_Y エンティティ用当たり判定サイズ
# @input arg Entity_Scale_Z エンティティ用当たり判定サイズ

# デバッグ有効ではない場合、プレビューは表示しない
    execute unless data storage mhdp_core:game_data {ShowDebugMessage:true} run return 0

# 対プレイヤー用プレビュー表示
    $data modify storage api: Arg.Override.X set value $(Player_Scale_X)
    $data modify storage api: Arg.Override.Y set value $(Player_Scale_Y)
    $data modify storage api: Arg.Override.Z set value $(Player_Scale_Z)
    data modify storage api: Arg.Override.Color set value "red"
    $execute positioned ^$(Player_Offset_X) ^$(Player_Offset_Y) ^$(Player_Offset_Z) run function api:object/summon.m {ObjectId:14}

# # 対エンティティ用プレビュー表示
    $data modify storage api: Arg.Override.X set value $(Entity_Scale_X)
    $data modify storage api: Arg.Override.Y set value $(Entity_Scale_Y)
    $data modify storage api: Arg.Override.Z set value $(Entity_Scale_Z)
    data modify storage api: Arg.Override.Color set value "blue"
    $execute positioned ^$(Entity_Offset_X) ^$(Entity_Offset_Y) ^$(Entity_Offset_Z) run function api:object/summon.m {ObjectId:14}
