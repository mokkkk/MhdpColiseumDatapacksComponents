#> mhdp_monsters:core/super/init/get_area_data.m
# 
# 共通処理 召喚

# データ取得
    $scoreboard players set @s Fld.CurrentAreaId $(AreaId)
    $scoreboard players operation @s Fld.Height = @e[type=marker,tag=Mk.Field.AreaCenter,tag=Mk.Field.Area$(AreaId),limit=1] Fld.Height
