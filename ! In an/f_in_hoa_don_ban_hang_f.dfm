object f_in_hoa_don_ban_hang: Tf_in_hoa_don_ban_hang
  Left = 191
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'In h'#243'a '#273#417'n'
  ClientHeight = 673
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 0
    Top = 583
    Width = 680
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -1
    ExplicitTop = 555
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 487
    Width = 680
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 456
  end
  object m_cam_on: TMemo
    Left = 7
    Top = 58
    Width = 410
    Height = 95
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'LDNam ch'#226'n th'#224'nh c'#7843'm '#417'n B'#7841'n '#273#227' tin d'#249'ng s'#7843'n ph'#7849'm c'#7911'a LDNam. '
      
        'V'#7899'i m'#7895'i s'#7843'n ph'#7849'm B'#7841'n '#273'ang c'#249'ng LDNam g'#243'p ph'#7847'n kh'#244'i ph'#7909'c v'#224' ph'#225't ' +
        'tri'#7875'n m'#244'i tr'#432#7901'ng'
      's'#7889'ng ng'#224'y c'#224'ng tr'#7903' n'#234'n t'#7889't '#273#7865'p h'#417'n. LDNAM CO., LTD')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 3
    Width = 417
    Height = 50
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 4
      Width = 26
      Height = 14
      Caption = 'T'#234'n:'
    end
    object Label2: TLabel
      Left = 127
      Top = 4
      Width = 35
      Height = 14
      Caption = #272#7883'a ch'#7881
    end
    object Label3: TLabel
      Left = 247
      Top = 4
      Width = 55
      Height = 14
      Caption = #272'i'#7879'n tho'#7841'i'
    end
    object cbb_ten: TComboBox
      Left = 8
      Top = 24
      Width = 113
      Height = 22
      TabOrder = 0
      OnChange = cbb_tenChange
      OnKeyPress = cbb_tenKeyPress
    end
    object cbb_dia_chi: TComboBox
      Left = 127
      Top = 24
      Width = 114
      Height = 22
      TabOrder = 1
      OnChange = cbb_dia_chiChange
    end
    object cbb_dien_thoai: TComboBox
      Left = 247
      Top = 24
      Width = 92
      Height = 22
      TabOrder = 2
      OnChange = cbb_dien_thoaiChange
    end
    object b_tim: TButton
      Left = 345
      Top = 24
      Width = 57
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 3
      OnClick = b_timClick
    end
    object cb_tim_nang_cao: TCheckBox
      Left = 345
      Top = 1
      Width = 57
      Height = 17
      Caption = 'NC'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 586
    Width = 680
    Height = 87
    Align = alBottom
    TabOrder = 2
    object lv_kh: TListView
      Left = 1
      Top = 1
      Width = 678
      Height = 85
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'T'#234'n kh'#225'ch h'#224'ng'
          MinWidth = 2
          Width = 150
        end
        item
          Caption = #272#7883'a ch'#7881
          Width = 100
        end
        item
          Caption = #272'i'#7879'n tho'#7841'i'
          Width = 70
        end
        item
          Caption = 'M'#7913'c'
        end
        item
          Caption = 'TL'
        end
        item
          Caption = 'VT'
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lv_khColumnClick
      OnCompare = lv_khCompare
      OnMouseDown = lv_khMouseDown
    end
  end
  object Panel5: TPanel
    Left = 434
    Top = 8
    Width = 149
    Height = 82
    TabOrder = 3
    object cbb_kt_f: TComboBox
      Left = 20
      Top = 12
      Width = 77
      Height = 22
      TabOrder = 0
      Text = '13'
      Items.Strings = (
        '11'
        '12'
        '13'
        '14'
        '15'
        '16')
    end
    object Button3: TButton
      Left = 17
      Top = 39
      Width = 77
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Print'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 490
    Width = 680
    Height = 93
    Align = alBottom
    TabOrder = 4
    object lv_thau_kinh_tim: TListView
      Left = 1
      Top = 1
      Width = 678
      Height = 91
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
          Caption = 'L'#7907'i nhu'#7853'n'
        end
        item
          Caption = 'M'#7913'c'
        end
        item
          Caption = #272'V-T'#237'nh'
        end
        item
          Caption = 'T'#7927' l'#7879
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnMouseDown = lv_thau_kinh_timMouseDown
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 370
    Width = 680
    Height = 117
    Align = alBottom
    TabOrder = 5
    object lv_danh_sach_thau_kinh: TListView
      Left = 1
      Top = 1
      Width = 678
      Height = 115
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
          Caption = #272#417'n v'#7883' t'#237'nh'
        end
        item
          Caption = 'S'#7889' l'#432#7907'ng'
          Width = 40
        end
        item
          Caption = #272#417'n gi'#225
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = ppm1
      TabOrder = 0
      ViewStyle = vsReport
      OnMouseDown = lv_danh_sach_thau_kinhMouseDown
    end
  end
  object Panel8: TPanel
    Left = 8
    Top = 158
    Width = 625
    Height = 99
    TabOrder = 6
    DesignSize = (
      625
      99)
    object Label4: TLabel
      Left = 10
      Top = 4
      Width = 26
      Height = 14
      Caption = 'T'#234'n:'
    end
    object Label5: TLabel
      Left = 127
      Top = 4
      Width = 59
      Height = 14
      Caption = #272#417'n v'#7883' t'#237'nh'
    end
    object Label6: TLabel
      Left = 247
      Top = 4
      Width = 49
      Height = 14
      Caption = 'S'#7889' l'#432#7907'ng'
    end
    object Label7: TLabel
      Left = 358
      Top = 0
      Width = 41
      Height = 14
      Caption = #272#417'n gi'#225
    end
    object cbb_ten_thau_kinh: TComboBox
      Left = 41
      Top = 21
      Width = 113
      Height = 22
      TabOrder = 0
      OnChange = cbb_ten_thau_kinhChange
      OnKeyPress = cbb_ten_thau_kinhKeyPress
    end
    object cbb_don_vi_tinh: TComboBox
      Left = 160
      Top = 21
      Width = 114
      Height = 22
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 1
      Text = '1'
      OnChange = cbb_dia_chiChange
    end
    object cbb_so_luong: TComboBox
      Left = 280
      Top = 21
      Width = 92
      Height = 22
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 2
      Text = '1'
      OnChange = cbb_dien_thoaiChange
    end
    object b_tim_thau_kinh: TButton
      Left = 476
      Top = 73
      Width = 57
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 3
      OnClick = b_tim_thau_kinhClick
    end
    object cbb_don_gia: TComboBox
      Left = 378
      Top = 21
      Width = 119
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 4
      Text = '1'
      OnChange = cbb_dien_thoaiChange
      OnKeyDown = cbb_don_giaKeyDown
      OnKeyPress = cbb_don_giaKeyPress
    end
    object b_them: TButton
      Left = 539
      Top = 71
      Width = 59
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 5
      OnClick = b_themClick
    end
    object cbb_cu: TComboBox
      Left = 9
      Top = 68
      Width = 151
      Height = 22
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 6
      Text = '1'
    end
    object dtp_ngay_xuat: TDateTimePicker
      Left = 503
      Top = 24
      Width = 96
      Height = 22
      Date = 42662.334696736110000000
      Time = 42662.334696736110000000
      TabOrder = 7
    end
  end
  object Button1: TButton
    Left = 576
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 7
    OnClick = Button1Click
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 608
    Top = 56
  end
  object PrintDialog1: TPrintDialog
    Left = 608
    Top = 8
  end
  object ppm1: TPopupMenu
    Left = 608
    Top = 432
    object Xa1: TMenuItem
      Caption = 'X'#243'a'
      OnClick = Xa1Click
    end
  end
end
