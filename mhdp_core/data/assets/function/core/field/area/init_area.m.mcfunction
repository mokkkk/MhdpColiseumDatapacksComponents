#> assets:core/field/area/move_area.m
#
# フィールド共通処理 エリア移動

# 中心座標にMarker召喚
    $execute positioned $(X) $(Y) $(Z) run summon marker ~ ~ ~ {Tags:["Mk.Field.AreaCenter","Mk.Field.Area$(AreaId)"]}

# CurrentAreaId設定
    $execute positioned $(X) $(Y) $(Z) run scoreboard players set @n[type=marker,tag=Mk.Field.AreaCenter] Fld.CurrentAreaId $(AreaId)

# 高度設定
    $execute positioned $(X) $(Y) $(Z) run scoreboard players set @n[type=marker,tag=Mk.Field.AreaCenter] Fld.Height $(Height)
