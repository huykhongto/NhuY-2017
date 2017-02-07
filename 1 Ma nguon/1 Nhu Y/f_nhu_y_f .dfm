object f_nhu_y_f: Tf_nhu_y_f
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' ch'#7845'm c'#244'ng'
  ClientHeight = 499
  ClientWidth = 683
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
  object Splitter1: TSplitter
    Left = 0
    Top = 185
    Width = 683
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 118
    ExplicitWidth = 718
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 185
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 33
      Width = 32
      Height = 13
      Caption = 'H'#7885' t'#234'n'
    end
    object Label2: TLabel
      Left = 9
      Top = 9
      Width = 118
      Height = 18
      Caption = 'C'#212'NG TY LDNAM'
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 263
      Top = 13
      Width = 137
      Height = 13
      Caption = 'Ng'#432#7901'i qu'#7843'n l'#253': L'#234' '#272#259'ng Nam'
    end
    object Label6: TLabel
      Left = 87
      Top = 33
      Width = 48
      Height = 13
      Caption = 'Nh'#226'n vi'#234'n'
    end
    object Label7: TLabel
      Left = 159
      Top = 33
      Width = 41
      Height = 13
      Caption = 'N'#417'i sinh:'
    end
    object cbb_ten: TComboBox
      Left = 8
      Top = 48
      Width = 145
      Height = 21
      TabOrder = 0
      TextHint = 'H'#7885' v'#224' t'#234'n'
    end
    object m_ghi_nhan: TMemo
      Left = 263
      Top = 32
      Width = 282
      Height = 102
      Hint = 'Nh'#7919'ng ghi nh'#7853'n trong qua tr'#236'nh l'#224'm vi'#7879'c'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 31
      Top = 160
      Width = 386
      Height = 25
      TabOrder = 3
      Visible = False
      object b_xoa: TButton
        Left = 0
        Top = 0
        Width = 57
        Height = 25
        Caption = 'X'#243'a'
        TabOrder = 3
      end
      object b_sua: TButton
        Left = 63
        Top = 0
        Width = 58
        Height = 25
        Caption = 'S'#7917'a'
        TabOrder = 1
        OnClick = b_suaClick
      end
      object b_them: TButton
        Left = 127
        Top = 0
        Width = 58
        Height = 25
        Caption = 'Th'#234'm'
        TabOrder = 0
        OnClick = b_themClick
      end
      object b_xoa_muc: TButton
        Left = 176
        Top = 25
        Width = 82
        Height = 25
        Caption = 'X'#243'a m'#7909'c'
        TabOrder = 2
        OnClick = b_xoa_mucClick
      end
      object cbb_tim: TComboBox
        Left = 272
        Top = 4
        Width = 145
        Height = 21
        TabOrder = 4
        Text = 'T'#236'm ki'#7871'm'
      end
      object Button1: TButton
        Left = 167
        Top = 0
        Width = 75
        Height = 25
        Caption = 'T'#236'm'
        TabOrder = 5
        OnClick = Button1Click
      end
      object Edit2: TEdit
        Left = 8
        Top = 4
        Width = 63
        Height = 21
        TabOrder = 6
        Text = '31'
      end
    end
    object cbb_noi_sinh: TComboBox
      Left = 159
      Top = 48
      Width = 98
      Height = 21
      Hint = 'N'#417'i sinh theo gi'#7845'y khai sinh'
      TabOrder = 1
      TextHint = 'N'#417'i sinh'
    end
  end
  object sttb1: TStatusBar
    Left = 0
    Top = 480
    Width = 683
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 188
    Width = 683
    Height = 292
    Align = alClient
    TabOrder = 2
    object lv_cham_cong: TListView
      Left = 1
      Top = 1
      Width = 681
      Height = 290
      Align = alClient
      Columns = <
        item
          Caption = 'M'#227
          MinWidth = 2
        end
        item
          Caption = 'H'#7885
          Width = 60
        end
        item
          Caption = 'T'#234'n'
        end
        item
          Caption = 'N'#417'i sinh'
          Width = 100
        end
        item
          Caption = 'Ghi nh'#7853'n'
          Width = 100
        end
        item
          Caption = 'B'#7843'ng ch'#7845'm c'#244'ng'
          Width = 100
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lv_cham_congColumnClick
      OnCompare = lv_cham_congCompare
      OnMouseDown = lv_cham_congMouseDown
    end
  end
  object tm1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tm1Timer
    Left = 416
    Top = 8
  end
  object PrintDialog1: TPrintDialog
    Left = 209
    Top = 5
  end
end
