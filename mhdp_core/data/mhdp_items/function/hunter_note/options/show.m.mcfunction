#> mhdp_items:hunter_note/options/show.m
#
# ハンターノート操作 オプション
#
# @within function mhdp_core:player/tick

# 表示
    $return run dialog show @s {\
        type:"minecraft:confirmation",title:{translate:"ui.hunter_note.options",bold:1b},body:[],can_close_with_escape:1b,inputs:[\
            {type:"minecraft:single_option",key:"OptMoveJump",label:{translate:"ui.hunter_note.options.move_jump",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.tooltip"}}},options:[\
                {id:"1",display:{translate:"ui.hunter_note.single_action_on",color:"#7bff6c"},initial:$(MoveJumpOn)},\
                {id:"2",display:{translate:"ui.hunter_note.single_action_off",color:"#ff6c70"},initial:$(MoveJumpOff)}\
            ]},\
            {type:"minecraft:single_option",key:"OptCameraEffect",label:{translate:"ui.hunter_note.options.camera_effect",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.camera_effect.tooltip"}}},options:[\
                {id:"1",display:{translate:"ui.hunter_note.single_action_on",color:"#7bff6c"},initial:$(CameraEffectOn)},\
                {id:"2",display:{translate:"ui.hunter_note.single_action_off",color:"#ff6c70"},initial:$(CameraEffectOff)}\
            ]}\
        ],\
        yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{type:"minecraft:dynamic/run_command",template:"$(ConfirmCommand)"}},\
        no:{label:{translate:"ui.hunter_note.button_cancel"}}\
    }

# 保持
    dialog show @s {\
        type:"minecraft:confirmation",title:{translate:"ui.hunter_note.options",bold:1b},body:[],can_close_with_escape:1b,inputs:[\
            {type:"minecraft:single_option",key:"OptMoveJump",label:{translate:"ui.hunter_note.options.move_jump"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.single_action_on",color:"#7bff6c",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.on.tooltip"}}},initial:0b},\
                {id:"2",display:{translate:"ui.hunter_note.single_action_off",color:"#ff6c70",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.off.tooltip"}}},initial:0b}\
            ]},\
            {type:"minecraft:single_option",key:"OptCameraEffect",label:{translate:"ui.hunter_note.options.camera_effect"},options:[\
                {id:"1",display:{translate:"ui.hunter_note.single_action_on",color:"#7bff6c",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.camera_effect.on.tooltip"}}},initial:0b},\
                {id:"2",display:{translate:"ui.hunter_note.single_action_off",color:"#ff6c70",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.camera_effect.off.tooltip"}}},initial:0b}\
            ]}\
        ],\
        yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{type:"minecraft:dynamic/run_command",template:"trigger Ply.Ope.HunterNote.Options set $(OptCameraEffect)$(OptMoveJump)"}},\
        no:{label:{translate:"ui.hunter_note.button_cancel"},action:{type:"minecraft:run_command",command:"trigger Ply.Ope.HunterNote.General set 1"}}\
    }
