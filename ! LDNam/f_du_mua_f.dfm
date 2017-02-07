object f_du_mua: Tf_du_mua
  Left = 0
  Top = 0
  Caption = 'D'#7921' t'#237'nh c'#7847'n mua'
  ClientHeight = 473
  ClientWidth = 727
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
  object Splitter2: TSplitter
    Left = 0
    Top = 170
    Width = 727
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -32
    ExplicitTop = 161
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 173
    Width = 727
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -48
    ExplicitTop = 395
    ExplicitWidth = 680
  end
  object m_1: TMemo
    Left = 495
    Top = 0
    Width = 232
    Height = 170
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = m_1Change
  end
  object Panel8: TPanel
    Left = 0
    Top = 241
    Width = 552
    Height = 99
    TabOrder = 1
    DesignSize = (
      552
      99)
    object Label4: TLabel
      Left = 10
      Top = 4
      Width = 22
      Height = 13
      Caption = 'T'#234'n:'
    end
    object Label5: TLabel
      Left = 127
      Top = 4
      Width = 52
      Height = 13
      Caption = #272#417'n v'#7883' t'#237'nh'
    end
    object Label6: TLabel
      Left = 247
      Top = 4
      Width = 42
      Height = 13
      Caption = 'S'#7889' l'#432#7907'ng'
    end
    object Label7: TLabel
      Left = 358
      Top = 0
      Width = 37
      Height = 13
      Caption = #272#417'n gi'#225
    end
    object cbb_ten_thau_kinh: TComboBox
      Left = 41
      Top = 21
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object cbb_don_vi_tinh: TComboBox
      Left = 160
      Top = 21
      Width = 114
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 1
      Text = '1'
    end
    object cbb_so_luong: TComboBox
      Left = 280
      Top = 21
      Width = 92
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 2
      Text = '1'
    end
    object b_tim_thau_kinh: TButton
      Left = 467
      Top = 24
      Width = 57
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 459
      Top = 1
      Width = 57
      Height = 17
      Caption = 'NC'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbb_don_gia: TComboBox
      Left = 378
      Top = 21
      Width = 92
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 5
      Text = '1'
    end
    object b_them: TButton
      Left = 467
      Top = 55
      Width = 59
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 6
    end
    object cbb_cu: TComboBox
      Left = 9
      Top = 68
      Width = 151
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 7
      Text = '1'
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 356
    Width = 727
    Height = 117
    Align = alBottom
    TabOrder = 2
    object lv_danh_sach_thau_kinh: TListView
      Left = 1
      Top = 1
      Width = 725
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
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 263
    Width = 727
    Height = 93
    Align = alBottom
    TabOrder = 3
    object lv_thau_kinh_tim: TListView
      Left = 1
      Top = 1
      Width = 725
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
    end
  end
  object Button2: TButton
    Left = 423
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
  end
  object Button1: TButton
    Left = 530
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
  end
  object Panel5: TPanel
    Left = 483
    Top = 177
    Width = 149
    Height = 82
    TabOrder = 6
    object cbb_kt_f: TComboBox
      Left = 20
      Top = 12
      Width = 77
      Height = 21
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 176
    Width = 727
    Height = 87
    Align = alBottom
    TabOrder = 7
    object lv_kh: TListView
      Left = 1
      Top = 1
      Width = 725
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 3
    Width = 417
    Height = 50
    TabOrder = 8
    object Label1: TLabel
      Left = 11
      Top = 4
      Width = 22
      Height = 13
      Caption = 'T'#234'n:'
    end
    object Label2: TLabel
      Left = 127
      Top = 4
      Width = 32
      Height = 13
      Caption = #272#7883'a ch'#7881
    end
    object Label3: TLabel
      Left = 247
      Top = 4
      Width = 49
      Height = 13
      Caption = #272'i'#7879'n tho'#7841'i'
    end
    object cbb_ten: TComboBox
      Left = 8
      Top = 24
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object cbb_dia_chi: TComboBox
      Left = 127
      Top = 24
      Width = 114
      Height = 21
      TabOrder = 1
    end
    object cbb_dien_thoai: TComboBox
      Left = 247
      Top = 24
      Width = 92
      Height = 21
      TabOrder = 2
    end
    object b_tim: TButton
      Left = 345
      Top = 24
      Width = 57
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 3
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
  object Panel1: TPanel
    Left = 1
    Top = 55
    Width = 273
    Height = 35
    TabOrder = 9
    object cb_thu_ho: TCheckBox
      Left = 8
      Top = 8
      Width = 58
      Height = 17
      Caption = 'Thu h'#7897
      TabOrder = 0
    end
    object e_tien_thu_ho: TEdit
      Left = 72
      Top = 6
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '100.000'#273
    end
    object cb_phi_vc: TCheckBox
      Left = 159
      Top = 8
      Width = 106
      Height = 17
      Caption = 'Ph'#237' v'#7853'n chuy'#7875'n'
      TabOrder = 2
    end
  end
  object m_ten_hang: TMemo
    Left = 359
    Top = 55
    Width = 138
    Height = 35
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Bo m'#7841'ch')
    ParentFont = False
    TabOrder = 10
  end
  object m_to: TMemo
    Left = -1
    Top = 95
    Width = 418
    Height = 113
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
      'L'#234' '#272#7863'ng Nam'
      '217/2 Nguy'#7877' V'#259'n Nghi - P7 - G'#242' V'#7845'p - TP.HCM'
      'Tel: 01292726419')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 11
  end
  object ppm1: TPopupMenu
    Left = 604
    Top = 370
    object Xa1: TMenuItem
      Caption = 'X'#243'a'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 544
    Top = 16
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 604
    Top = 48
  end
end
