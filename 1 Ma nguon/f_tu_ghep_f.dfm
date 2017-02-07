object f_tu_ghep: Tf_tu_ghep
  Left = 0
  Top = 0
  Caption = 'T'#7915' gh'#233'p'
  ClientHeight = 416
  ClientWidth = 341
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
    Left = 0
    Top = 81
    Width = 341
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -421
    ExplicitTop = 153
    ExplicitWidth = 663
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 81
    Align = alTop
    TabOrder = 0
    object b_tim: TButton
      Left = 170
      Top = 8
      Width = 65
      Height = 21
      Caption = 'T'#236'm'
      TabOrder = 0
      OnClick = b_timClick
    end
    object cbb_tu: TComboBox
      Left = 8
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 1
      OnKeyPress = cbb_tuKeyPress
    end
    object bt_xoa: TButton
      Left = 71
      Top = 35
      Width = 56
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 2
      OnClick = bt_xoaClick
    end
    object bt_them: TButton
      Left = 8
      Top = 35
      Width = 57
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 3
      OnClick = bt_themClick
    end
    object bt_sua: TButton
      Left = 133
      Top = 35
      Width = 55
      Height = 25
      Caption = 'S'#7917'a'
      TabOrder = 4
      OnClick = bt_suaClick
    end
    object lb_danh_sach_tu: TListBox
      Left = 241
      Top = 8
      Width = 64
      Height = 70
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 84
    Width = 341
    Height = 332
    Align = alClient
    TabOrder = 1
    object lv_tu_ghep: TListView
      Left = 1
      Top = 1
      Width = 339
      Height = 330
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'T'#7915
          MinWidth = 2
          Width = 150
        end
        item
          Caption = 'V'#7883' tr'#237
          Width = 60
        end
        item
          Caption = 'T'#7927' l'#7879
          Width = 100
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnMouseDown = lv_tu_ghepMouseDown
    end
  end
end
