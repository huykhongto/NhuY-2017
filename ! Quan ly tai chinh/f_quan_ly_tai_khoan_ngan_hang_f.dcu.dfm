object f_quan_ly_tai_khoan_ngan_hang: Tf_quan_ly_tai_khoan_ngan_hang
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' t'#224'i kho'#7843'n ng'#226'n h'#224'ng'
  ClientHeight = 449
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 156
    Top = 8
    Height = 449
    Align = alNone
  end
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 97
    Height = 13
    Caption = 'Danh s'#225'ch t'#224'i kho'#7843'n'
  end
  object Label2: TLabel
    Left = 436
    Top = 8
    Width = 31
    Height = 13
    Caption = 'M'#244' t'#7843':'
  end
  object Label3: TLabel
    Left = 161
    Top = 8
    Width = 59
    Height = 13
    Caption = 'S'#7889' t'#224'i kho'#7843'n'
  end
  object lb_ds_tk: TListBox
    Left = 8
    Top = 254
    Width = 25
    Height = 20
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object m_mo_ta: TMemo
    Left = 473
    Top = 8
    Width = 184
    Height = 62
    TabOrder = 1
  end
  object cbb_stk: TComboBox
    Left = 161
    Top = 27
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object lv_cac_khoan_ngan_hang: TListView
    Left = 165
    Top = 175
    Width = 504
    Height = 236
    Columns = <
      item
        AutoSize = True
        Caption = 'T'#234'n kho'#7843'n'
      end
      item
        Caption = 'S'#7889' ti'#7873'n'
      end
      item
        AutoSize = True
        Caption = 'Thu / Chi'
      end
      item
        AutoSize = True
        Caption = 'Th'#7901'i gian'
      end
      item
        Caption = 'Tr'#7921'c thu'#7897'c'
      end
      item
        Caption = 'M'#244' t'#7843
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    OnMouseDown = lv_cac_khoan_ngan_hangMouseDown
  end
  object ttp_ngay_du_tinh: TDateTimePicker
    Left = 353
    Top = 49
    Width = 98
    Height = 21
    Align = alCustom
    Date = 42033.000000000000000000
    Time = 42033.000000000000000000
    TabOrder = 4
  end
  object p_nut_nhan: TPanel
    Left = 465
    Top = 130
    Width = 177
    Height = 39
    BevelOuter = bvNone
    Color = clCream
    Ctl3D = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 5
    object bt_them_thu: TButton
      Left = 8
      Top = 8
      Width = 49
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 0
      OnClick = bt_them_thuClick
    end
    object bt_xoa: TButton
      Left = 63
      Top = 8
      Width = 50
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 1
      OnClick = bt_xoaClick
    end
    object bt_sua: TButton
      Left = 119
      Top = 8
      Width = 50
      Height = 25
      Caption = 'S'#7917'a'
      Enabled = False
      TabOrder = 2
    end
  end
  object CheckBox1: TCheckBox
    Left = 592
    Top = 71
    Width = 77
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 6
  end
  object cbb_ten_khoan: TComboBox
    Left = 165
    Top = 94
    Width = 116
    Height = 21
    AutoComplete = False
    TabOrder = 7
  end
  object cbb_ngay_cn: TComboBox
    Left = 447
    Top = 94
    Width = 100
    Height = 21
    AutoComplete = False
    TabOrder = 8
  end
  object cbb_tien: TComboBox
    Left = 287
    Top = 94
    Width = 90
    Height = 21
    AutoComplete = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 9
    Items.Strings = (
      '500'
      '1000'
      '2000'
      '5000'
      '10000'
      '20000'
      '50000'
      '100000'
      '200000'
      '500000')
  end
  object Panel1: TPanel
    Left = -3
    Top = 296
    Width = 153
    Height = 39
    BevelOuter = bvNone
    Color = clCream
    Ctl3D = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 10
    object bt_them_tk: TButton
      Left = 8
      Top = 8
      Width = 41
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 0
      OnClick = bt_them_tkClick
    end
    object Button2: TButton
      Left = 55
      Top = 8
      Width = 42
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 1
      OnClick = Button2Click
    end
    object bt_sua_tk: TButton
      Left = 103
      Top = 8
      Width = 41
      Height = 25
      Caption = 'S'#7917'a'
      Enabled = False
      TabOrder = 2
      OnClick = bt_sua_tkClick
    end
  end
  object cbb_ten_tk: TComboBox
    Left = 8
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object lv_ds_tk: TListView
    Left = 4
    Top = 94
    Width = 155
    Height = 154
    Columns = <
      item
        AutoSize = True
        Caption = 'T'#234'n t'#224'i kho'#7843'n'
        WidthType = (
          -49)
      end
      item
        Caption = 'S'#7889' t'#224'i kho'#7843'n'
      end
      item
        AutoSize = True
        Caption = 'Ng'#226'n h'#224'ng'
      end
      item
        Caption = 'M'#244' t'#7843
      end
      item
        Caption = 'File'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 12
    ViewStyle = vsReport
    OnMouseDown = lv_ds_tkMouseDown
  end
  object cbb_ngan_hang: TComboBox
    Left = 8
    Top = 57
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object lb_cac_khoan_ngan_hang: TListBox
    Left = 39
    Top = 254
    Width = 25
    Height = 20
    ItemHeight = 13
    TabOrder = 14
    Visible = False
  end
  object cbb_thu_chi: TComboBox
    Left = 383
    Top = 94
    Width = 58
    Height = 21
    AutoComplete = False
    TabOrder = 15
    Text = 'Thu'
    Items.Strings = (
      'Thu'
      'Chi')
  end
  object sttb1: TStatusBar
    Left = 0
    Top = 430
    Width = 677
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object cbb_truc_thuoc: TComboBox
    Left = 553
    Top = 94
    Width = 90
    Height = 21
    AutoComplete = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 17
    Items.Strings = (
      '500'
      '1000'
      '2000'
      '5000'
      '10000'
      '20000'
      '50000'
      '100000'
      '200000'
      '500000')
  end
end
