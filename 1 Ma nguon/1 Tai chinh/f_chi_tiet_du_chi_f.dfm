object f_chi_tiet_du_chi: Tf_chi_tiet_du_chi
  Left = 0
  Top = 0
  Caption = 'Chi ti'#7871't d'#7921' chi'
  ClientHeight = 241
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cbb_ten_khoan: TComboBox
    Left = 85
    Top = 8
    Width = 194
    Height = 21
    AutoComplete = False
    TabOrder = 0
  end
  object cbb_so_tien: TComboBox
    Left = 189
    Top = 35
    Width = 90
    Height = 21
    AutoComplete = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 1
  end
  object cbb_truc_thuoc: TComboBox
    Left = 150
    Top = 62
    Width = 129
    Height = 21
    AutoComplete = False
    TabOrder = 2
  end
  object m_mo_ta: TMemo
    Left = 14
    Top = 89
    Width = 265
    Height = 56
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object cbb_tien_them: TComboBox
    Left = 40
    Top = 151
    Width = 103
    Height = 21
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 4
    Text = '10000'
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
  object bt_cong: TButton
    Left = 149
    Top = 151
    Width = 49
    Height = 25
    Caption = '+'
    TabOrder = 5
    OnClick = bt_congClick
  end
  object bt_tru: TButton
    Left = 204
    Top = 151
    Width = 49
    Height = 25
    Caption = '-'
    TabOrder = 6
    OnClick = bt_truClick
  end
  object Button1: TButton
    Left = 204
    Top = 193
    Width = 62
    Height = 25
    Caption = 'Ho'#224'n t'#7845't'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 193
    Width = 62
    Height = 25
    Caption = 'H'#7911'y b'#7887
    TabOrder = 8
  end
end
