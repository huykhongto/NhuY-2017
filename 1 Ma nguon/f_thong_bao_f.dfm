object f_thong_bao: Tf_thong_bao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Th'#244'ng b'#225'o'
  ClientHeight = 306
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object lb_thong_bao: TListBox
    Left = 600
    Top = 8
    Width = 25
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = lb_thong_baoClick
  end
  object lv_thong_bao: TListView
    Left = 8
    Top = 8
    Width = 545
    Height = 290
    Checkboxes = True
    Columns = <
      item
        Caption = 'STT'
        MinWidth = 2
        Width = 150
      end
      item
        Caption = 'Thu'#244'c'
        MinWidth = 2
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = 'M'#7913'c'
        MaxWidth = 130
        MinWidth = 2
        Width = 130
      end
      item
        Caption = 'Th'#244'ng tin'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
end
