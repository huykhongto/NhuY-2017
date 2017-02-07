object VisibleResources: TVisibleResources
  Left = 707
  Top = 215
  Caption = 'Visible Resources'
  ClientHeight = 328
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object clb_nhom: TCheckListBox
    Left = 16
    Top = 8
    Width = 225
    Height = 129
    TabOrder = 0
    OnMouseDown = clb_nhomMouseDown
  end
  object OKButton: TBitBtn
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object CancelButton: TBitBtn
    Left = 176
    Top = 256
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object b_them: TButton
    Left = 272
    Top = 32
    Width = 75
    Height = 25
    Caption = 'b_them'
    TabOrder = 3
    OnClick = b_themClick
  end
  object b_sua: TButton
    Left = 272
    Top = 63
    Width = 75
    Height = 25
    Caption = 'b_sua'
    TabOrder = 4
  end
  object e_nhom: TEdit
    Left = 16
    Top = 160
    Width = 121
    Height = 24
    TabOrder = 5
    Text = 'e_nhom'
  end
end
