object f_xem_truoc_bao_gia: Tf_xem_truoc_bao_gia
  Left = 29
  Top = 235
  Caption = 'Xem tr'#432#7899'c b'#225'o gi'#225
  ClientHeight = 451
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 145
    Top = 0
    Height = 451
    ExplicitLeft = 152
    ExplicitTop = 248
    ExplicitHeight = 100
  end
  object PaintBox1: TPaintBox
    Left = 304
    Top = 104
    Width = 313
    Height = 305
  end
  object PageControl1: TPageControl
    Left = 148
    Top = 0
    Width = 530
    Height = 451
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = 'B'#225'o gi'#225
      ImageIndex = 3
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 522
        Height = 422
        HorzScrollBar.Range = 5555
        HorzScrollBar.Size = 1000
        VertScrollBar.Range = 5555
        VertScrollBar.Size = 11111
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        object p_v: TPaintBox
          Left = 56
          Top = 19
          Width = 385
          Height = 366
          OnPaint = p_vPaint
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 451
    Align = alLeft
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 0
      Top = 148
      Width = 138
      Height = 22
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 1
      Width = 138
      Height = 146
      Caption = 'Export graph as:'
      Items.Strings = (
        'copy to clipboard'
        'print in low res.'
        'print in high res.'
        'bitmap file (.bmp)'
        'metafile, low res.'
        'metafile, med res.'
        'metafile, high res.')
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 65
      Top = 198
      Width = 73
      Height = 23
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn2: TBitBtn
      Left = 65
      Top = 176
      Width = 73
      Height = 23
      Caption = 'Printer SetUp'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 0
      Top = 176
      Width = 59
      Height = 45
      Caption = 'GO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object CheckBox1: TCheckBox
      Left = -16
      Top = 272
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 5
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 304
      Width = 104
      Height = 22
      TabOrder = 6
      Text = 'A4'
    end
    object Button2: TButton
      Left = 0
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 7
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 81
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 8
    end
    object Edit2: TEdit
      Left = 21
      Top = 258
      Width = 121
      Height = 22
      TabOrder = 9
      Text = '1'
      OnChange = Edit2Change
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 104
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 36
    Top = 80
  end
end
