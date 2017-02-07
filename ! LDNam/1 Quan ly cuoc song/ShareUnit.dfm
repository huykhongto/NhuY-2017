object Share: TShare
  Left = 738
  Top = 285
  Caption = 'Share'
  ClientHeight = 177
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ResourcesCheckList: TCheckListBox
    Left = 16
    Top = 8
    Width = 225
    Height = 129
    TabOrder = 0
  end
  object OKButton: TBitBtn
    Left = 40
    Top = 152
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object CancelButton: TBitBtn
    Left = 152
    Top = 152
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
