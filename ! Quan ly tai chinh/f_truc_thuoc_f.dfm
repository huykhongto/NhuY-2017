object f_truc_thuoc: Tf_truc_thuoc
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' tr'#7921'c thu'#7897'c'
  ClientHeight = 408
  ClientWidth = 426
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
  object p_1: TPanel
    Left = 8
    Top = 8
    Width = 329
    Height = 392
    TabOrder = 0
    object cbb_truc_thuoc_thu: TComboBox
      Left = 8
      Top = 9
      Width = 313
      Height = 21
      AutoComplete = False
      TabOrder = 0
    end
    object lb_truc_thuoc: TListBox
      Left = 0
      Top = 36
      Width = 25
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
    object lv_truc_thuoc: TListView
      Left = 8
      Top = 36
      Width = 313
      Height = 349
      Align = alCustom
      Checkboxes = True
      Columns = <
        item
          Caption = 'T'#234'n tr'#7921'c thu'#7897'c'
          Width = 300
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
  object p_2: TPanel
    Left = 343
    Top = 8
    Width = 66
    Height = 185
    TabOrder = 1
    object bt_xoa: TButton
      Left = 8
      Top = 37
      Width = 50
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 0
    end
    object bt_sua: TButton
      Left = 8
      Top = 68
      Width = 50
      Height = 25
      Caption = 'S'#7917'a'
      Enabled = False
      TabOrder = 1
    end
    object bt_them_thu: TButton
      Left = 8
      Top = 6
      Width = 49
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 2
    end
  end
end
