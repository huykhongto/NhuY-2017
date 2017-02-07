object f_bang_cham_cong: Tf_bang_cham_cong
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' ch'#7845'm c'#244'ng'
  ClientHeight = 453
  ClientWidth = 718
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
    Width = 718
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -1
    ExplicitTop = 177
    ExplicitWidth = 687
  end
  object Panel2: TPanel
    Left = 0
    Top = 188
    Width = 718
    Height = 246
    Align = alClient
    TabOrder = 1
    object lv_cham_cong: TListView
      Left = 1
      Top = 1
      Width = 716
      Height = 244
      Align = alClient
      Checkboxes = True
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
          Caption = 'Gi'#7899'i'
          Width = 40
        end
        item
          Caption = 'Ng'#224'y sinh'
          Width = 70
        end
        item
          Caption = 'N'#417'i sinh'
          Width = 100
        end
        item
          Caption = 'H'#244'n nh'#226'n'
          Width = 100
        end
        item
          Caption = #272#7883'a ch'#7881
          Width = 40
        end
        item
          Caption = 'T'#7841'm tr'#250
        end
        item
          Caption = #272'i'#7879'n tho'#7841'i'
        end
        item
          Caption = 'Email'
        end
        item
          Caption = 'Ch'#7913'c v'#7909
        end
        item
          Caption = 'Ng'#224'y v'#224'o l'#224'm'
        end
        item
          Caption = 'Chuy'#234'n m'#244'n'
        end
        item
          Caption = 'S'#7903' th'#237'ch'
        end
        item
          Caption = 'Chi'#7873'u cao'
        end
        item
          Caption = 'C'#226'n n'#7863'ng'
        end
        item
          Caption = 'Th'#244'ng tin th'#234'm'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 185
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 32
      Height = 13
      Caption = 'H'#7885' t'#234'n'
    end
    object Label2: TLabel
      Left = 159
      Top = 35
      Width = 17
      Height = 13
      Caption = 'Gi'#7899'i'
    end
    object Label4: TLabel
      Left = 159
      Top = 84
      Width = 37
      Height = 13
      Caption = 'T'#7841'm tr'#250
    end
    object lb_so_kh: TLabel
      Left = 615
      Top = 35
      Width = 42
      Height = 13
      Caption = 'lb_so_kh'
    end
    object Label3: TLabel
      Left = 8
      Top = 81
      Width = 32
      Height = 13
      Caption = #272#7883'a ch'#7881
    end
    object Label7: TLabel
      Left = 241
      Top = 35
      Width = 47
      Height = 13
      Caption = 'Ng'#224'y sinh'
    end
    object Label5: TLabel
      Left = 303
      Top = 81
      Width = 62
      Height = 13
      Caption = 'S'#7889' '#273'i'#7879'n tho'#7841'i'
    end
    object cbb_tim: TComboBox
      Left = 8
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 18
      Text = 'T'#236'm ki'#7871'm'
    end
    object Button1: TButton
      Left = 183
      Top = 4
      Width = 75
      Height = 25
      Caption = 'T'#236'm'
      TabOrder = 0
    end
    object cbb_ten: TComboBox
      Left = 8
      Top = 54
      Width = 145
      Height = 21
      TabOrder = 1
      TextHint = 'H'#7885' v'#224' t'#234'n'
    end
    object cbb_gioi: TComboBox
      Left = 161
      Top = 54
      Width = 74
      Height = 21
      TabOrder = 2
      TextHint = 'Gi'#7899'i t'#237'nh'
      Items.Strings = (
        'Nam'
        'N'#7919)
    end
    object m_thong_tin: TMemo
      Left = 535
      Top = 82
      Width = 145
      Height = 88
      Hint = 'Nh'#7919'ng th'#244'ng tin kh'#225'c'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object cbb_dien_thoai: TComboBox
      Left = 310
      Top = 100
      Width = 145
      Height = 21
      TabOrder = 8
      TextHint = 'S'#7889' '#273'i'#7879'n tho'#7841'i'
    end
    object Panel3: TPanel
      Left = 387
      Top = 4
      Width = 279
      Height = 25
      TabOrder = 17
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
        Left = 191
        Top = 0
        Width = 82
        Height = 25
        Caption = 'X'#243'a m'#7909'c'
        TabOrder = 2
        OnClick = b_xoa_mucClick
      end
    end
    object dtp_ngay_vao_lam: TDateTimePicker
      Left = 310
      Top = 127
      Width = 99
      Height = 22
      Hint = 'Ng'#224'y v'#224'o l'#224'm'
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object cbb_dia_chi: TComboBox
      Left = 8
      Top = 100
      Width = 145
      Height = 21
      Hint = #272#7883'a ch'#7881' tr'#234'n h'#7897' kh'#7849'u'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TextHint = #272#7883'a ch'#7881
      OnChange = cbb_dia_chiChange
    end
    object cbb_email: TComboBox
      Left = 8
      Top = 131
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      TextHint = 'Email'
      OnChange = cbb_emailChange
    end
    object cbb_chuc_vu: TComboBox
      Left = 159
      Top = 128
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      TextHint = 'Ch'#7913'c v'#7909
      OnChange = cbb_emailChange
    end
    object cbb_noi_sinh: TComboBox
      Left = 346
      Top = 54
      Width = 98
      Height = 21
      Hint = 'N'#417'i sinh theo gi'#7845'y khai sinh'
      TabOrder = 4
      TextHint = 'N'#417'i sinh'
    end
    object dtp_ngay_sinh: TDateTimePicker
      Left = 241
      Top = 53
      Width = 99
      Height = 22
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      TabOrder = 3
    end
    object cbb_hon_nhan: TComboBox
      Left = 450
      Top = 55
      Width = 88
      Height = 21
      Hint = 'H'#244'n nh'#226'n '#273#227' c'#243' gia '#273#236'nh ho'#7863'c ch'#432'a ho'#7863'c li'#234'n quan'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TextHint = 'H'#244'n nh'#226'n'
    end
    object cbb_tam_tru: TComboBox
      Left = 159
      Top = 101
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TextHint = #272#7883'a ch'#7881' t'#7841'm tr'#250
      OnChange = cbb_dia_chiChange
    end
    object cbb_chuyen_mon: TComboBox
      Left = 8
      Top = 158
      Width = 145
      Height = 21
      Hint = 'Chuy'#234'n m'#244'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      TextHint = 'Chuy'#234'n m'#244'n'
      OnChange = cbb_emailChange
    end
    object cbb_so_thich: TComboBox
      Left = 159
      Top = 155
      Width = 145
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      TextHint = 'S'#7903' th'#237'ch'
      OnChange = cbb_emailChange
    end
    object cbb_cao: TComboBox
      Left = 346
      Top = 155
      Width = 56
      Height = 21
      Hint = 'Chi'#7873'u cao'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      Text = '1.65'
      TextHint = 'Cao'
      OnChange = cbb_emailChange
    end
    object cbb_nang: TComboBox
      Left = 430
      Top = 158
      Width = 59
      Height = 21
      Hint = 'C'#226'n n'#7863'ng'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Text = '50.1'
      TextHint = 'N'#7863'ng'
      OnChange = cbb_emailChange
      Items.Strings = (
        '50.1')
    end
    object cbb_dan_toc: TComboBox
      Left = 427
      Top = 127
      Width = 81
      Height = 21
      ParentShowHint = False
      ShowHint = False
      TabOrder = 19
      TextHint = 'D'#226'n t'#7897'c'
      OnChange = cbb_emailChange
    end
  end
  object sttb1: TStatusBar
    Left = 0
    Top = 434
    Width = 718
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object tm1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tm1Timer
    Left = 640
    Top = 56
  end
end
