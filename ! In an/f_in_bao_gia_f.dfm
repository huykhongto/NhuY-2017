object f_in_bao_gia: Tf_in_bao_gia
  Left = 191
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'In b'#225'o gi'#225
  ClientHeight = 721
  ClientWidth = 735
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
    Top = 631
    Width = 735
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 589
    ExplicitWidth = 680
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 274
    Width = 735
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = 8
    ExplicitTop = 484
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
      '- H'#224'ng m'#7899'i 100%, xu'#7845't x'#7913' ch'#237'nh h'#227'ng'#9
      '- Thanh to'#225'n tr'#432#7899'c 100% b'#7857'ng chuy'#7875'n kho'#7843'n'#9#9
      '- Hi'#7879'u l'#7921'c b'#225'o gi'#225' trong v'#242'ng 1 tu'#7847'n'#9
      '- B'#7843'o h'#224'nh 12 th'#225'ng do l'#7895'i c'#7911'a nh'#224' s'#7843'n xu'#7845't')
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
    Top = 634
    Width = 735
    Height = 87
    Align = alBottom
    TabOrder = 2
    object lv_kh: TListView
      Left = 1
      Top = 1
      Width = 733
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
    Left = 423
    Top = 8
    Width = 119
    Height = 73
    TabOrder = 3
    object cbb_kt_f: TComboBox
      Left = 20
      Top = 12
      Width = 77
      Height = 22
      TabOrder = 0
      Text = '10'
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
    Top = 440
    Width = 735
    Height = 191
    Align = alBottom
    TabOrder = 4
    object lv_thau_kinh_tim: TListView
      Left = 1
      Top = 88
      Width = 733
      Height = 102
      Align = alBottom
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
    object lv_vat_tu_tim: TListView
      Left = 1
      Top = 1
      Width = 733
      Height = 87
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
      TabOrder = 1
      ViewStyle = vsReport
      OnMouseDown = lv_vat_tu_timMouseDown
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 277
    Width = 735
    Height = 144
    Align = alBottom
    TabOrder = 5
    object lv_bao_gia: TListView
      Left = 1
      Top = 1
      Width = 733
      Height = 142
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
        end
        item
          Caption = 'Ghi ch'#250
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = ppm1
      TabOrder = 0
      ViewStyle = vsReport
      OnMouseDown = lv_bao_giaMouseDown
    end
  end
  object Panel8: TPanel
    Left = 8
    Top = 158
    Width = 625
    Height = 113
    TabOrder = 6
    DesignSize = (
      625
      113)
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
      Left = 378
      Top = 64
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
      Left = 441
      Top = 64
      Width = 59
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 5
      OnClick = b_themClick
    end
    object dtp_ngay_xuat: TDateTimePicker
      Left = 503
      Top = 24
      Width = 96
      Height = 22
      Date = 42662.334696736110000000
      Time = 42662.334696736110000000
      TabOrder = 6
    end
    object cbb_bao_gia: TComboBox
      Left = 40
      Top = 77
      Width = 114
      Height = 22
      TabOrder = 7
      Text = 'BG00001'
      OnChange = cbb_bao_giaChange
      Items.Strings = (
        'BG00001'
        'BG00002'
        'BG00003'
        'BG00004'
        'BG00005'
        'BG00006'
        'BG00007'
        'BG00008'
        'BG00009')
    end
    object m_ghi_chu: TMemo
      Left = 187
      Top = 49
      Width = 185
      Height = 43
      TabOrder = 8
    end
    object b_sua: TButton
      Left = 503
      Top = 64
      Width = 57
      Height = 25
      Caption = 'S'#7917'a'
      TabOrder = 9
      OnClick = b_suaClick
    end
    object b_xoa: TButton
      Left = 566
      Top = 64
      Width = 51
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 10
      OnClick = b_xoaClick
    end
    object cbb_chon: TComboBox
      Left = 40
      Top = 49
      Width = 114
      Height = 22
      ItemIndex = 0
      TabOrder = 11
      Text = 'Th'#7845'u k'#237'nh'
      Items.Strings = (
        'Th'#7845'u k'#237'nh'
        'N'#259'ng l'#432#7907'ng')
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
  object sttb1: TStatusBar
    Left = 0
    Top = 421
    Width = 735
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Button2: TButton
    Left = 472
    Top = 120
    Width = 75
    Height = 25
    Caption = 'b_lam_moi'
    TabOrder = 9
    OnClick = Button2Click
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
    end
  end
end
