object f_ldnam: Tf_ldnam
  Left = 0
  Top = 0
  Caption = 'LDNam'
  ClientHeight = 430
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'M'#7909'c ti'#234'u'
    TabOrder = 0
    OnClick = tm1Timer
  end
  object Panel1: TPanel
    Left = 8
    Top = 237
    Width = 657
    Height = 185
    TabOrder = 1
    object lv_thong_diep: TListView
      Left = 1
      Top = 1
      Width = 655
      Height = 183
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'T'#234'n'
          MinWidth = 2
          Width = 150
        end
        item
          Caption = 'M'#244' t'#7843
          MinWidth = 2
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'Quan tr'#7885'ng'
          MaxWidth = 68
          MinWidth = 2
          Width = 30
        end
        item
          Caption = 'Th'#7901'i gian'
          MaxWidth = 65
          MinWidth = 2
          Width = 65
        end
        item
          Caption = 'Th'#7921'c thi'
          MaxWidth = 130
          MinWidth = 2
          Width = 130
        end
        item
          Caption = 'Ng'#224'y ho'#224'n th'#224'nh'
          MinWidth = 2
        end
        item
          Caption = 'Ho'#224'n th'#224'nh'
          MaxWidth = 69
          MinWidth = 2
          Width = 20
        end
        item
          Caption = 'Th'#432' m'#7909'c'
          MinWidth = 2
          Width = 170
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object lb_dl_cong_viec: TListBox
    Left = 450
    Top = 176
    Width = 70
    Height = 39
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object ScrollBox1: TScrollBox
    Left = 542
    Top = 8
    Width = 137
    Height = 102
    TabOrder = 3
    object i_anh_vao: TImage
      Left = 2
      Top = 2
      Width = 87
      Height = 79
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      AutoSize = True
      Stretch = True
    end
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ScrollBox2: TScrollBox
    Left = 542
    Top = 116
    Width = 133
    Height = 102
    TabOrder = 5
    object i_mau: TImage
      Left = 3
      Top = 3
      Width = 84
      Height = 79
    end
  end
  object mp_1: TMediaPlayer
    Left = 476
    Top = 61
    Width = 29
    Height = 30
    VisibleButtons = [btPlay]
    AutoEnable = False
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 6
  end
  object m_mo_ta: TMemo
    Left = 56
    Top = 64
    Width = 337
    Height = 145
    Lines.Strings = (
      'm_mo_ta')
    TabOrder = 7
  end
  object tm1: TTimer
    Enabled = False
    OnTimer = tm1Timer
    Left = 504
    Top = 8
  end
  object SQLDataSet1: TSQLDataSet
    DataSource = DataSource1
    Params = <>
    Left = 208
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 296
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 48
  end
end
