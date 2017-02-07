object f_quan_ly_vat_tu: Tf_quan_ly_vat_tu
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' v'#7853't t'#432
  ClientHeight = 527
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 185
    Width = 844
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 217
    ExplicitWidth = 718
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 401
    Width = 844
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 329
    ExplicitWidth = 179
  end
  object Panel2: TPanel
    Left = 0
    Top = 188
    Width = 844
    Height = 213
    Align = alTop
    TabOrder = 1
    object lv_vat_tu: TListView
      Left = 1
      Top = 1
      Width = 842
      Height = 211
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'M'#227
          MinWidth = 2
          Width = 150
        end
        item
          Caption = 'T'#234'n'
          Width = 60
        end
        item
          Caption = 'M'#227' hi'#7879'u'
        end
        item
          Caption = 'Ng'#224'y c'#7853'p nh'#7853't'
          Width = 100
        end
        item
          Caption = 'Th'#244'ng tin'
          Width = 70
        end
        item
          Caption = 'L'#7883'ch s'#7917
          Width = 100
        end
        item
          Caption = 'Gi'#225' v'#7889'n'
          Width = 100
        end
        item
          Caption = 'Gi'#225' b'#225'n'
          Width = 40
        end
        item
          Caption = 'S'#7889' l'#432#7907'ng'
        end
        item
          Caption = 'M'#7913'c'
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lv_vat_tuColumnClick
      OnCompare = lv_vat_tuCompare
      OnMouseDown = lv_vat_tuMouseDown
    end
    object Button1: TButton
      Left = 720
      Top = -72
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object Button2: TButton
      Left = 776
      Top = -72
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
    end
    object Button3: TButton
      Left = 736
      Top = -56
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 185
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 51
      Height = 13
      Caption = 'T'#234'n v'#7853't t'#432
    end
    object Label2: TLabel
      Left = 159
      Top = 35
      Width = 37
      Height = 13
      Caption = 'M'#227' hi'#7879'u'
    end
    object Label4: TLabel
      Left = 326
      Top = 57
      Width = 20
      Height = 13
      Caption = 'M'#7913'c'
    end
    object lb_so_kh: TLabel
      Left = 709
      Top = 37
      Width = 42
      Height = 13
      Caption = 'lb_so_kh'
    end
    object Label3: TLabel
      Left = 175
      Top = 109
      Width = 36
      Height = 13
      Caption = 'Gi'#225' v'#7889'n'
    end
    object Label5: TLabel
      Left = 386
      Top = 109
      Width = 36
      Height = 13
      Caption = 'Gi'#225' b'#225'n'
    end
    object Label6: TLabel
      Left = 273
      Top = 170
      Width = 42
      Height = 13
      Caption = 'S'#7889' l'#432#7907'ng'
    end
    object l_ma: TLabel
      Left = 359
      Top = 32
      Width = 22
      Height = 13
      Caption = 'l_ma'
    end
    object cbb_tim: TComboBox
      Left = 8
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'T'#236'm ki'#7871'm'
      OnChange = cbb_timChange
      OnKeyPress = cbb_timKeyPress
    end
    object b_tim: TButton
      Left = 434
      Top = 4
      Width = 75
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 1
      OnClick = b_timClick
    end
    object cbb_ten: TComboBox
      Left = 8
      Top = 54
      Width = 161
      Height = 21
      TabOrder = 2
    end
    object cbb_ma: TComboBox
      Left = 175
      Top = 54
      Width = 145
      Height = 21
      TabOrder = 3
    end
    object m_thong_tin: TMemo
      Left = 8
      Top = 81
      Width = 161
      Height = 98
      ScrollBars = ssBoth
      TabOrder = 4
    end
    object cbb_muc: TComboBox
      Left = 321
      Top = 76
      Width = 145
      Height = 21
      TabOrder = 5
    end
    object Panel3: TPanel
      Left = 515
      Top = 3
      Width = 279
      Height = 25
      TabOrder = 6
      object b_xoa: TButton
        Left = 0
        Top = 0
        Width = 57
        Height = 25
        Caption = 'X'#243'a'
        TabOrder = 0
      end
      object b_sua: TButton
        Left = 63
        Top = 0
        Width = 58
        Height = 25
        Caption = 'S'#7917'a'
        TabOrder = 1
        OnClick = b_suaClick
      end
      object b_them: TButton
        Left = 127
        Top = 0
        Width = 58
        Height = 25
        Caption = 'Th'#234'm'
        TabOrder = 2
        OnClick = b_themClick
      end
      object b_xoa_muc: TButton
        Left = 191
        Top = 0
        Width = 82
        Height = 25
        Caption = 'X'#243'a m'#7909'c'
        TabOrder = 3
        OnClick = b_xoa_mucClick
      end
    end
    object ttp_ngay_cn: TDateTimePicker
      Left = 175
      Top = 81
      Width = 99
      Height = 22
      Date = 42608.000000000000000000
      Time = 42608.000000000000000000
      TabOrder = 7
    end
    object cbb_gia_von: TComboBox
      Left = 175
      Top = 128
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = cbb_gia_vonChange
    end
    object cbb_gia_ban: TComboBox
      Left = 321
      Top = 128
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnChange = cbb_gia_banChange
    end
    object m_khac: TMemo
      Left = 472
      Top = 54
      Width = 221
      Height = 125
      ScrollBars = ssBoth
      TabOrder = 10
    end
    object cbb_so_luong: TComboBox
      Left = 321
      Top = 162
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnChange = cbb_gia_banChange
    end
    object b_nhap: TButton
      Left = 387
      Top = 35
      Width = 58
      Height = 25
      Caption = 'Nh'#7853'p'
      TabOrder = 12
      OnClick = b_nhapClick
    end
    object cb_tim_nang_cao: TCheckBox
      Left = 472
      Top = 31
      Width = 57
      Height = 17
      Caption = 'NC'
      Checked = True
      State = cbChecked
      TabOrder = 13
    end
    object Panel5: TPanel
      Left = 699
      Top = 56
      Width = 145
      Height = 119
      TabOrder = 14
      object Label7: TLabel
        Left = 10
        Top = 5
        Width = 55
        Height = 13
        Caption = 'V'#7889'n v'#7853't t'#432':'
      end
      object l_von: TLabel
        Left = 71
        Top = 5
        Width = 24
        Height = 13
        Caption = '2000'
        OnClick = l_vonClick
      end
    end
    object cbb_nhom_vat_tu: TComboBox
      Left = 202
      Top = 27
      Width = 145
      Height = 21
      TabOrder = 15
      Text = 'V'#7853't t'#432' '#273'i'#7879'n t'#7917
      OnChange = cbb_nhom_vat_tuChange
      Items.Strings = (
        'V'#7853't t'#432' '#273'i'#7879'n t'#7917
        'V'#7853't t'#432' '#273'i'#7879'n c'#244'ng nghi'#7879'p')
    end
  end
  object sttb1: TStatusBar
    Left = 0
    Top = 508
    Width = 844
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 404
    Width = 844
    Height = 104
    Align = alClient
    TabOrder = 3
    object lv_vat_tu_tim: TListView
      Left = 1
      Top = 1
      Width = 842
      Height = 102
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'M'#227
          MinWidth = 2
          Width = 150
        end
        item
          Caption = 'T'#234'n'
          Width = 60
        end
        item
          Caption = 'M'#227' hi'#7879'u'
        end
        item
          Caption = 'Ng'#224'y c'#7853'p nh'#7853't'
          Width = 100
        end
        item
          Caption = 'Th'#244'ng tin'
          Width = 70
        end
        item
          Caption = 'L'#7883'ch s'#7917
          Width = 100
        end
        item
          Caption = 'Gi'#225' v'#7889'n'
          Width = 100
        end
        item
          Caption = 'Gi'#225' b'#225'n'
          Width = 40
        end
        item
          Caption = 'S'#7889' l'#432#7907'ng'
        end
        item
          Caption = 'M'#7913'c'
        end
        item
          Caption = 'T'#7927' l'#7879
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lv_vat_tuColumnClick
      OnCompare = lv_vat_tuCompare
      OnMouseDown = lv_vat_tu_timMouseDown
    end
  end
  object b_chuyen_gia: TButton
    Left = 326
    Top = 97
    Width = 43
    Height = 25
    Caption = '>>'
    TabOrder = 4
    OnClick = b_chuyen_giaClick
  end
  object cbb_pt: TComboBox
    Left = 261
    Top = 101
    Width = 54
    Height = 21
    ItemIndex = 1
    TabOrder = 5
    Text = '8'
    Items.Strings = (
      '5'
      '8'
      '10'
      '11'
      '20')
  end
  object tm1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tm1Timer
    Left = 800
  end
end
