#> mhdp_items:hunter_note/info/weapon_guide/short_sword_tec.m
#
# ハンターノート操作 武器操作説明 片手剣 天ノ型
#
# @within function mhdp_core:player/tick

# 表示
    # $return run dialog show @s {\
    #     type:"minecraft:notice",title:{translate:"ui.hunter_note.weapon_guide.short_sword.tec",bold:1b},can_close_with_escape:1b,after_action:"wait_for_response",inputs:[],body:[\
    #     ],\
    #     action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:run_command",command:"trigger $(Trigger) set $(Value)"}}\
    # }

# 保持
    dialog show @s {\
        type:"minecraft:notice",title:{translate:"ui.hunter_note.weapon_guide.short_sword.tec",bold:1b},can_close_with_escape:1b,after_action:"wait_for_response",inputs:[],body:[\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◎ ",color:"#ffffff"},{translate:"weapon.short_sword.guide.normal_combo",bold:true}," : ",{keybind:"key.attack"},"\n"],\
                [{text:"・",color:"#afafaf"},{translate:"weapon.short_sword.action.normal_combo_1"}," > ",{translate:"weapon.short_sword.action.normal_combo_2"}," > ",{translate:"weapon.short_sword.action.normal_combo_3"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◎ ",color:"#ffffff"},{translate:"weapon.short_sword.guide.horizon_combo",bold:true}," : ",{keybind:"key.use"},"\n"],\
                [{text:"・",color:"#afafaf"},{translate:"weapon.short_sword.action.horizontal_combo_1"}," > ",{translate:"weapon.short_sword.action.horizontal_combo_2"}," > ",{translate:"weapon.short_sword.action.horizontal_combo_3"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◎ ",color:"#ffffff"},{translate:"weapon.short_sword.guide.shield_combo",bold:true}," : ",{translate:"operation.holding",with:[{keybind:"key.sneak"},{keybind:"key.use"}]},"\n"],\
                [{text:"・",color:"#afafaf"},{translate:"weapon.short_sword.action.shield_combo_1"}," > ",{translate:"weapon.short_sword.action.shield_combo_2"}," > ",{translate:"weapon.short_sword.action.shield_combo_3"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"weapon.short_sword.action.spin",bold:true}," : ",{translate:operation.after,with:["◎",{translate:operation.short,with:[{translate:"operation.same_time",with:[{keybind:"key.sneak"},{keybind:"key.use"}]}]}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.spin.detail",with:[{translate:"weapon.short_sword.action.strong_spin"}]}}},"\n"],\
                [{text:"・",color:"#afafaf"},"..."," > ",{translate:"weapon.short_sword.action.spin"},"\n"],\
                [{text:"・",color:"#afafaf"},"..."," > ",{translate:"weapon.short_sword.action.strong_spin"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"weapon.short_sword.action.charged_plunge",bold:true}," : ",{translate:operation.after,with:[{translate:operation.or,with:["◎",{translate:weapon.short_sword.action.spin}]},{translate:operation.long,with:[{translate:"operation.same_time",with:[{keybind:"key.sneak"},{keybind:"key.use"}]}]}]}],{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.charged_plunge.detail",with:[{translate:"weapon.short_sword.action.strong_spin"}]}}}\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"weapon.short_sword.action.guard",bold:true}," : ",{keybind:"key.sneak"},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.guard.detail",with:[{translate:"weapon.short_sword.action.guard_just"},{translate:"weapon.short_sword.action.guard_just"},{keybind:"key.attack"},{translate:"weapon.short_sword.action.counter_slash"}]}}},"\n"],\
                [{text:"・",color:"#afafaf"},{translate:"weapon.short_sword.action.guard"}," > ",{translate:"weapon.short_sword.action.guard_just"}," > ",{translate:"weapon.short_sword.action.counter_slash"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"weapon.short_sword.action.guard_slash",bold:true}," : ",{translate:"operation.holding",with:[{keybind:"key.sneak"},{keybind:"key.attack"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.guard_slash.detail"}}}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"weapon.short_sword.action.backstep",bold:true}," : ",{translate:"operation.any_after",with:[{translate:operation.holding,with:[{keybind:"key.back"},{keybind:"key.jump"}]}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.backstep.detail",with:[\
                    {translate:"weapon.short_sword.action.backstep"},{translate:"weapon.short_sword.action.moving_slash"},{translate:operation.or,with:[{keybind:"key.attack"},{translate:operation.short,with:[{keybind:"key.use"}]}]},{translate:"weapon.short_sword.action.justrush_1"},{translate:operation.long,with:[{keybind:"key.use"}]},{translate:"weapon.short_sword.action.charge_slash"}\
                ]}}}]\
            ],width:500},\
            \
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"operation.air",with:[{translate:"weapon.short_sword.action.falling_spear"}],bold:true}," : ",{translate:"operation.air_key",with:[{keybind:"key.use"}]}],\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"operation.sp_air",with:[{translate:"weapon.short_sword.action.falling_shadow"}],bold:true}," : ",{translate:"operation.sp_air_key",with:[{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.falling_shadow.detail",with:[{keybind:"key.use"}]}}},"\n"],\
                [{text:"・",color:"#afafaf"},{translate:"weapon.short_sword.action.falling_shadow"}," > ",{translate:"weapon.short_sword.action.rising_slash"}," > ",{translate:"weapon.short_sword.action.fallbash_high"}]\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"operation.arts1",with:[{translate:"weapon.short_sword.action.blade_dance"}],bold:true}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.attack"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.blade_dance.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:500},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff"},{translate:"operation.arts2",with:[{translate:"weapon.short_sword.action.metsu_shoryugeki"}],bold:true}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.metsu_shoryugeki.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:500}\
        ],\
        action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:run_command",command:"trigger Ply.Ope.HunterNote.General set 99"}}\
    }
