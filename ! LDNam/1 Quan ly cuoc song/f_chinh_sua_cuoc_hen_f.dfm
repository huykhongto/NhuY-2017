object ApptEdit: TApptEdit
  Left = 218
  Top = 152
  Caption = 'Ch'#7881'nh s'#7917'a cu'#7897'c h'#7865'n'
  ClientHeight = 250
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 636
    Height = 37
    Align = alTop
    Shape = bsBottomLine
    ExplicitWidth = 373
  end
  object Bevel2: TBevel
    Left = 0
    Top = 37
    Width = 636
    Height = 60
    Align = alTop
    Shape = bsBottomLine
    ExplicitWidth = 373
  end
  object Label1: TLabel
    Left = 44
    Top = 44
    Width = 53
    Height = 13
    Caption = 'Start &Time:'
    FocusControl = StartDatePicker
  end
  object Label3: TLabel
    Left = 44
    Top = 68
    Width = 47
    Height = 13
    Caption = '&End Time:'
    FocusControl = EndDatePicker
  end
  object Label5: TLabel
    Left = 106
    Top = 126
    Width = 72
    Height = 13
    Caption = 'minutes before'
  end
  object Label6: TLabel
    Left = 4
    Top = 8
    Width = 46
    Height = 13
    Caption = '&N'#7897'i dung:'
    FocusControl = Edit1
  end
  object Image1: TImage
    Left = 8
    Top = 44
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      000020000000010004000000000000020000130B0000130B0000100000001000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00DDDDDDDDDDDD00000000DDDDDDDDDDDDDDDDDDDDD00077777777000DDDDD
      DDDDDDDDDDD007777777777777700DDDDDDDDDDDDD07777788888888777770DD
      DDDDDDDDD877778888888888887F770DDDDDDDDD87777800FFFFFFFF8888F770
      DDDDDDD8777880FFFFF00FFFFF888F770DDDDD8777880FFFFFF70FFFFFF88877
      70DDDD877880FF00FFFFFFFF00FF888770DDD877880FFF70FFFFFFFF70FFF888
      770DD87780FFFFFFFFFFFFFFFFFFFF88770DD87880F00FFFFFFFFFFFFF00FF88
      870D87780FF70FFFF0FF0FFFFF70FFF8877087780FFFFFFFFF0F0FFFFFFFFFF8
      877087780FFFFFFFFFF00FFFFFFFFFF8877087780F00FFFFFF00000000FF00F8
      877087780F70FFFFFFFF00FFFFFF70F8877087780FFFFFFFFFFF0F0FFFFFFFF8
      877087780FFFFFFFFFFF0FFFFFFFFFF8877087780FF00FFFFFFF0FFFFF00FFF8
      8770D87880F70FFFFFFF0FFFFF70FF88870DD87780FFFFFFFFFF0FFFFFFFFF88
      770DD877780FFF00FFFFFFFF00FFF887770DDD877880FF70FFFFFFFF70FF8887
      70DDDD877F880FFFFFF00FFFFFF8887770DDDDD877F880FFFFF70FFFFF888777
      0DDDDDDD877F8800FFFFFFFF88887778DDDDDDDDD877F788000000008877778D
      DDDDDDDDDD87777788888888777778DDDDDDDDDDDDD887777777777777788DDD
      DDDDDDDDDDDDD88877777777888DDDDDDDDDDDDDDDDDDDDD88888888DDDDDDDD
      DDDD}
    Transparent = True
  end
  object Image2: TImage
    Left = 0
    Top = 103
    Width = 25
    Height = 25
    AutoSize = True
    Picture.Data = {
      07544269746D617006020000424D060200000000000076000000280000001900
      000019000000010004000000000090010000320B0000320B0000100000001000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00DDDDDDDDDDDDDDDDDDDDDDDDD00000008DDDDDDDDDDDDDDDDDDDDDD8D000
      0000DDDDDDDDDDDDDDDDDDDDDDDDD0000000DD8DDDDDDDDDDDDDDDDDD8DDD000
      0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDD8DDDDDD88DDDDDD8DDDDD000
      0000DDDDDDDDDD0000DDDDDDDDDDD0000000DDDDDDD0007777000DDDDDDDD000
      0000DDDDD807FF7F7F77700DDDDDD0000000DDDDD8FFFFF77878780DDDDDD000
      0000DDDDDD878F77778880DDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
      0000DDDDDDD88F7777880DDDDDDDD00000008D888DD87FF778780DD888D8D000
      0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
      0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDDD87F77870DDDDDDDDD000
      0000DDDDDDDDD87F770DDDDDDDDDD0000000DDDDDD8DDD8770DDD8DDDDDDD000
      0000DDDDD8DDDDD88DDDDD8DDDDDD0000000DDDD8DDDDDD80DDDDDD8DDDDD000
      0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDDDDDDDDDDDDDDDDDDDDDDD000
      0000D8DDDDDDDDDDDDDDDDDDDD8DD0000000}
    Transparent = True
  end
  object StartDatePicker: TDateTimePicker
    Left = 104
    Top = 40
    Width = 129
    Height = 21
    Date = 42553.775961111100000000
    Time = 42553.775961111100000000
    TabOrder = 1
  end
  object StartTimePicker: TDateTimePicker
    Left = 236
    Top = 40
    Width = 129
    Height = 21
    Date = 42553.776266203700000000
    Time = 42553.776266203700000000
    Kind = dtkTime
    TabOrder = 2
  end
  object EndDatePicker: TDateTimePicker
    Left = 104
    Top = 68
    Width = 129
    Height = 21
    Date = 42553.776392129600000000
    Time = 42553.776392129600000000
    TabOrder = 3
  end
  object EndTimePicker: TDateTimePicker
    Left = 239
    Top = 67
    Width = 129
    Height = 21
    Date = 42553.776421990700000000
    Time = 42553.776421990700000000
    Kind = dtkTime
    TabOrder = 4
  end
  object AlarmEnabledCheck: TCheckBox
    Left = 31
    Top = 103
    Width = 69
    Height = 17
    Caption = '&Nh'#7855'c nh'#7903':'
    TabOrder = 5
  end
  object AlarmAdvanceEdit: TEdit
    Left = 104
    Top = 103
    Width = 37
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 141
    Top = 103
    Width = 15
    Height = 21
    Associate = AlarmAdvanceEdit
    Max = 60
    TabOrder = 7
    OnClick = UpDown1Click
  end
  object CancelButton: TButton
    Left = 422
    Top = 203
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object OKButton: TButton
    Left = 341
    Top = 203
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 56
    Top = 4
    Width = 309
    Height = 21
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 206
    Top = 103
    Width = 291
    Height = 70
    Caption = 'L'#7863'p l'#7841'i'
    TabOrder = 10
    object cbb_lap_lai: TComboBox
      Left = 15
      Top = 15
      Width = 98
      Height = 21
      TabOrder = 0
      Text = 'Kh'#244'ng'
      Items.Strings = (
        'Kh'#244'ng'
        'H'#224'ng ng'#224'y'
        'H'#224'ng th'#225'ng'
        'H'#224'ng n'#259'm')
    end
    object cb_t2: TCheckBox
      Left = 119
      Top = 16
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 2'
      TabOrder = 1
    end
    object cb_t3: TCheckBox
      Left = 119
      Top = 31
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 3'
      TabOrder = 2
    end
    object cb_t4: TCheckBox
      Left = 119
      Top = 48
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 4'
      TabOrder = 3
    end
    object cb_cn: TCheckBox
      Left = 33
      Top = 50
      Width = 67
      Height = 17
      Caption = 'Ch'#7911' nh'#7853't'
      TabOrder = 4
    end
    object cb_t5: TCheckBox
      Left = 191
      Top = 17
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 5'
      TabOrder = 5
    end
    object cb_t6: TCheckBox
      Left = 191
      Top = 32
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 6'
      TabOrder = 6
    end
    object cb_t7: TCheckBox
      Left = 191
      Top = 48
      Width = 50
      Height = 17
      Caption = 'Th'#7913' 7'
      TabOrder = 7
    end
  end
  object CheckBox1: TCheckBox
    Left = 408
    Top = 8
    Width = 97
    Height = 17
    Caption = #194'm l'#7883'ch'
    TabOrder = 11
  end
  object Edit2: TEdit
    Left = 44
    Top = 145
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 44
    Top = 172
    Width = 121
    Height = 21
    TabOrder = 13
    Text = 'Edit3'
  end
  object lb_nhom: TListBox
    Left = 512
    Top = 112
    Width = 105
    Height = 61
    ItemHeight = 13
    TabOrder = 14
  end
  object e_nhom: TEdit
    Left = 503
    Top = 179
    Width = 97
    Height = 21
    TabOrder = 15
    Text = 'e_nhom'
  end
  object b_them: TButton
    Left = 470
    Top = 56
    Width = 75
    Height = 25
    Caption = 'b_them'
    TabOrder = 16
  end
  object b_sua: TButton
    Left = 542
    Top = 56
    Width = 75
    Height = 25
    Caption = 'b_sua'
    TabOrder = 17
  end
end
