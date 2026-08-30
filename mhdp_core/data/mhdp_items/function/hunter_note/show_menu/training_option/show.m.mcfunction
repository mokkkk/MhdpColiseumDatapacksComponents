#> mhdp_items:hunter_note/show_menu/quest/training_option.m
#
# ハンターノート操作 メインメニュー 訓練所オプション
#
# @within function mhdp_core:player/tick

# 表示
    $return run dialog show @s {\
        type:"minecraft:confirmation",\
        title:{translate:"ui.hunter_note.menu.training.show_option",bold:1b},external_title:{translate:"ui.hunter_note.menu.training.show_option"},body:[],can_close_with_escape:1b,after_action:"wait_for_response",\
        inputs:[\
            {type:"minecraft:single_option",key:"OptArtsGaugeInfinity",label:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity.off",color:"#ffbf6c"},initial:$(ArtsGaugeInfinityOff)},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity.on",color:"#ffbf6c"},initial:$(ArtsGaugeInfinityOn)}\
            ]},\
            {type:"minecraft:single_option",key:"OptSpItemInfinity",label:{translate:"ui.hunter_note.menu.training.sp_item_infinity"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.sp_item_infinity.off",color:"#ffbf6c"},initial:$(SpItemInfinityOff)},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.sp_item_infinity.on",color:"#ffbf6c"},initial:$(SpItemInfinityOn)}\
            ]},\
            {type:"minecraft:single_option",key:"OptKarakuriMode",label:{translate:"ui.hunter_note.menu.training.karakuri_mode"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.karakuri_mode.stay",color:"#ffbf6c"},initial:$(KarakuriModeStay)},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.karakuri_mode.attack",color:"#ffbf6c"},initial:$(KarakuriModeAttack)}\
            ]}\
        ],\
        yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{type:"minecraft:dynamic/run_command",template:"$(ConfirmCommand)"}},\
        no:{label:{translate:"ui.hunter_note.button_cancel"},action:{type:"minecraft:run_command",command:"trigger Ply.Ope.HunterNote.General set 1"}}\
    }

# 保持
    dialog show @s {\
        type:"minecraft:confirmation",\
        title:{translate:"ui.hunter_note.menu.training",bold:1b},external_title:{translate:"ui.hunter_note.menu.training"},body:[],can_close_with_escape:1b,after_action:"wait_for_response",\
        inputs:[\
            {type:"minecraft:single_option",key:"OptArtsGaugeInfinity",label:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity.off",color:"#ffbf6c",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.on.tooltip"}}},initial:0b},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.arts_gauge_infinity.on",color:"#ffbf6c",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.off.tooltip"}}},initial:0b}\
            ]},\
            {type:"minecraft:single_option",key:"OptSpItemInfinity",label:{translate:"ui.hunter_note.menu.training.sp_item_infinity"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.sp_item_infinity.off",color:"#ffbf6c"},initial:0b},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.sp_item_infinity.on",color:"#ffbf6c"},initial:0b}\
            ]},\
            {type:"minecraft:single_option",key:"OptKarakuriMode",label:{translate:"ui.hunter_note.menu.training.karakuri_mode"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.menu.training.karakuri_mode.stay",color:"#ffbf6c"},initial:0b},\
                {id:"2",display:{translate:"ui.hunter_note.menu.training.karakuri_mode.attack",color:"#ffbf6c"},initial:0b}\
            ]}\
        ],\
        yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{type:"minecraft:dynamic/run_command",template:"trigger Ply.Ope.HunterNote.TrainingOptions set $(OptArtsGaugeInfinity)"}},\
        no:{label:{translate:"ui.hunter_note.button_cancel"},action:{type:"minecraft:run_command",command:"trigger Ply.Ope.HunterNote.General set 1"}}\
    }
