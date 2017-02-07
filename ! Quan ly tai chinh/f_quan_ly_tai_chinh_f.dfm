object f_quan_ly_tai_chinh: Tf_quan_ly_tai_chinh
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' t'#224'i ch'#237'nh'
  ClientHeight = 541
  ClientWidth = 773
  Color = clCream
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    000001002000000000004004000000000000000000000000000000000000FEFE
    FEEFFEFEFEFFFEFEFEFFFEFEFEFFFCFCFCFFBFD7BFFFAAB6ABFF66AB66FF95B2
    95FFA0C6A0FFDCE8DCFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEEFFEFE
    FEEFFEFEFEFFFEFEFEFFCFDCCFFF718371FF317031FF197519FF707B71FF4781
    47FF198A19FF769576FF81B581FFEFF3EFFFFEFEFEFFFEFEFEFFFEFEFEEFFEFE
    FEEFFEFEFEFFC7CFC7FF206820FF516551FF346634FF2F6A2FFF407140FF3E77
    3EFF378237FF6B946BFF6FAD6FFF58B458FFF1F1F1FFFEFEFEFFFEFEFEEFFEFE
    FEEFDFE8DFFF586C57FF286528FF0A650AFF656565FF4C654CFF006800FF266F
    26FF797979FF528C52FF31BA31FFB2CAB2FF83B383FFFBFBFBFFFEFEFEEFFEFE
    FEEF619561FF536553FF386538FF366536FF1D651DFF2C652CFF556455FF4667
    46FF1A6E1AFF367A35FF619761FF88B588FF64AB63FFA9D3A9FFFEFEFEEFECEF
    ECEF3F663FFF036503FF656565FF476547FF006500FF266527FF616464FF4963
    4CFF026703FF217021FF7E7E7EFF4E8F4EFF249724FF8CA88CFFFEFEFEEFB8C8
    B8EF43674CFF097743FF258585FF108E8BFF059592FF029A9AFF029C9CFF019C
    9CFF039999FF089492FF1A9090FF1C8D74FF128B40FF749477FFECF5ECEF94BE
    B1EF079081FF009D9DFF099287FF038D75FF03907EFF04968FFF029997FF009D
    9DFF009D9DFF009D9DFF009D9DFF009D9DFF009D9DFF0D9890FFD0E8D9EFCDE8
    E8EF199B90FF009D9DFF25785CFF2E8667FF34856CFF2A6B3AFF36815BFF2474
    42FF218272FF05896BFF128D84FF04845DFF009D9DFF269D8DFFF2F8F8EFFBFC
    FBEF91B994FFB6DFDFFF558B70FF3EA696FF2FACACFF2D7146FF15A1A1FF347D
    6BFF2C734DFF279472FF307853FF4C9467FFCAE7E7FFDBE6DBFFFEFEFEEFF8FA
    F8EFAEC9AEFFFEFEFEFF819E82FFD0E0D0FFFEFEFEFF588357FFFCFCFCFF8EAB
    8EFF789677FF548C54FFAAB9AAFF7BA77BFFFEFEFEFFA3C5A3FFFEFEFEEFFFFF
    FFEFE1EAE1FF99C099FFC8CEC8FFE7EDE7FFFEFEFEFF93A893FF6C946CFF96B7
    96FFB2BBB2FF77A277FFD3D4D3FF81A781FFEDF2EDFFBED4BEFFFEFEFEEFFEFE
    FEEFFDFDFDFFC2D7C2FFDBE7DBFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
    FEFFFEFEFEFFFEFEFEFFF9F9F9FFF6F6F6FF88B588FFFEFEFEFFFEFEFEEFFFFF
    FFEFFEFEFEFFFEFEFEFF7CB07CFFDFEBDFFFFBFCFBFFFEFEFEFFFEFEFEFFFEFE
    FEFFFEFEFEFFFEFEFEFFF0F5F0FFABCAACFFE7EEE7FFFEFEFEFFFEFEFEEFFEFE
    FEEFFEFEFEFFFEFEFEFFF8FAF8FFE3ECE3FF77B277FFDEE8DEFFEFF4EFFFFCFD
    FCFFE5EDE5FF9BC39BFFC7DAC7FFE4EEE4FFFEFEFEFFFEFEFEFFFEFEFEEFFEFE
    FEEFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF2F6F2FFECF4ECFFAED2AEFFB5D3
    B5FFEEF5EEFFDCE8DCFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEEF0000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 170
    Width = 773
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    ExplicitTop = 180
    ExplicitWidth = 765
  end
  object Splitter2: TSplitter
    AlignWithMargins = True
    Left = 2792
    Top = 2943
    Width = 521
    Height = 20
    Align = alCustom
    Beveled = True
    ExplicitLeft = 38
    ExplicitTop = 189
  end
  object sttb1: TStatusBar
    Left = 0
    Top = 522
    Width = 773
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object p_du_lieu: TPanel
    Left = 469
    Top = 138
    Width = 116
    Height = 26
    TabOrder = 2
    Visible = False
    object lb_thu: TListBox
      Left = 47
      Top = 0
      Width = 18
      Height = 17
      ItemHeight = 13
      TabOrder = 0
      Visible = False
    end
    object lb_chi: TListBox
      Left = 23
      Top = 0
      Width = 18
      Height = 17
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
    object lb_so_tien: TListBox
      Left = 0
      Top = 0
      Width = 17
      Height = 17
      ItemHeight = 13
      TabOrder = 2
      Visible = False
    end
    object lb_du_chi: TListBox
      Left = 71
      Top = 0
      Width = 20
      Height = 17
      ItemHeight = 13
      TabOrder = 3
    end
    object lb_du_thu: TListBox
      Left = 97
      Top = 0
      Width = 20
      Height = 17
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object p_chi_tiet: TPanel
    Left = 8
    Top = 0
    Width = 553
    Height = 121
    Align = alCustom
    BevelOuter = bvNone
    TabOrder = 3
    object l_ten: TLabel
      Left = 0
      Top = 7
      Width = 61
      Height = 14
      Caption = 'Kho'#7843'n thu:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object l_so_tien: TLabel
      Left = 200
      Top = 7
      Width = 43
      Height = 14
      Caption = 'So tien:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 296
      Top = 7
      Width = 83
      Height = 14
      Caption = 'Ng'#224'y c'#7853'p nh'#7853't:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 424
      Top = 7
      Width = 66
      Height = 14
      Caption = 'Tr'#7921'c thu'#7897'c:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 0
      Top = 52
      Width = 35
      Height = 14
      Caption = 'M'#244' t'#7843':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object m_mo_ta: TMemo
      Left = 0
      Top = 65
      Width = 553
      Height = 56
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object cbb_ten_khoan: TComboBox
      Left = 0
      Top = 25
      Width = 194
      Height = 21
      AutoComplete = False
      TabOrder = 1
    end
    object cbb_tien_thu: TComboBox
      Left = 200
      Top = 25
      Width = 90
      Height = 21
      AutoComplete = False
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 2
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
    object cbb_truc_thuoc_thu: TComboBox
      Left = 424
      Top = 25
      Width = 129
      Height = 21
      AutoComplete = False
      TabOrder = 3
      OnDblClick = cbb_truc_thuoc_thuDblClick
    end
    object cbb_ngay_cn: TComboBox
      Left = 296
      Top = 25
      Width = 122
      Height = 21
      AutoComplete = False
      TabOrder = 4
    end
  end
  object p_nut_nhan: TPanel
    Left = 238
    Top = 127
    Width = 233
    Height = 41
    BevelOuter = bvNone
    Color = clCream
    Ctl3D = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 4
    object bt_them_thu: TButton
      Left = 8
      Top = 12
      Width = 49
      Height = 25
      Caption = 'Th'#234'm'
      TabOrder = 0
      OnClick = bt_them_thuClick
    end
    object bt_xoa: TButton
      Left = 63
      Top = 8
      Width = 50
      Height = 25
      Caption = 'X'#243'a'
      TabOrder = 1
      OnClick = bt_xoaClick
    end
    object bt_sua: TButton
      Left = 119
      Top = 8
      Width = 50
      Height = 25
      Caption = 'S'#7917'a'
      Enabled = False
      TabOrder = 2
      OnClick = bt_suaClick
    end
    object bt_chi: TButton
      Left = 175
      Top = 8
      Width = 50
      Height = 25
      Caption = 'Chi'
      Enabled = False
      TabOrder = 3
      Visible = False
      OnClick = bt_chiClick
    end
  end
  object Panel4: TPanel
    Left = 583
    Top = 8
    Width = 182
    Height = 156
    Align = alCustom
    Color = clCream
    ParentBackground = False
    TabOrder = 5
    object GroupBox1: TGroupBox
      Left = 8
      Top = 2
      Width = 161
      Height = 111
      Align = alCustom
      Anchors = [akTop, akRight]
      Caption = 'Ti'#7873'n hi'#7879'n t'#7841'i'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = GroupBox1Click
      object l_tien_hien_tai: TLabel
        Left = 52
        Top = 24
        Width = 99
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.000.000 VND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = l_tien_hien_taiDblClick
      end
      object l_tong_thu: TLabel
        Left = 52
        Top = 44
        Width = 99
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.000.000 VND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = l_tien_hien_taiDblClick
      end
      object l_tong_chi: TLabel
        Left = 52
        Top = 64
        Width = 99
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.000.000 VND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = l_tien_hien_taiDblClick
      end
      object l_tong: TLabel
        Left = 52
        Top = 84
        Width = 99
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.000.000 VND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = l_tien_hien_taiDblClick
      end
      object Label7: TLabel
        Left = 3
        Top = 24
        Width = 53
        Height = 14
        Caption = 'Ti'#7873'n m'#7863't:'
      end
      object Label8: TLabel
        Left = 3
        Top = 44
        Width = 59
        Height = 14
        Caption = 'T'#7893'ng Thu:'
      end
      object Label9: TLabel
        Left = 3
        Top = 64
        Width = 52
        Height = 14
        Caption = 'T'#7893'ng chi:'
      end
      object Label10: TLabel
        Left = 3
        Top = 84
        Width = 58
        Height = 14
        Caption = 'Ti'#7873'n t'#7893'ng:'
      end
    end
    object ttp_ngay_du_tinh: TDateTimePicker
      Left = 8
      Top = 119
      Width = 98
      Height = 21
      Align = alCustom
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      TabOrder = 1
    end
    object bt_thong_ke: TButton
      Left = 112
      Top = 119
      Width = 57
      Height = 21
      Hint = 'Th'#7889'ng k'#234' t'#7845't c'#7843' c'#225'c th'#244'ng s'#7889
      Caption = 'Th'#7889'ng k'#234
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bt_thong_keClick
    end
  end
  object pct_1: TPageControl
    Left = 0
    Top = 174
    Width = 773
    Height = 348
    ActivePage = ts_thu
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pct_1Change
    object ts_thu: TTabSheet
      Caption = 'Qu'#7843'n l'#253' thu'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 765
        Height = 319
        Align = alClient
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object lv_bang_thu: TListView
          Left = 1
          Top = 1
          Width = 763
          Height = 317
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = 'T'#234'n kho'#7843'n thu'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taRightJustify
              Caption = 'S'#7889' ti'#7873'n'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taCenter
              Caption = 'Ng'#224'y thu'
              MaxWidth = 130
              MinWidth = 2
              Width = 130
            end
            item
              Caption = 'Tr'#7921'c thu'#7897'c'
            end
            item
              Caption = 'M'#244' t'#7843
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = lv_bang_thuColumnClick
          OnCompare = lv_bang_thuCompare
          OnMouseDown = lv_bang_thuMouseDown
        end
      end
    end
    object ts_chi: TTabSheet
      Caption = 'Qu'#7843'n l'#253' chi'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 765
        Height = 319
        Align = alClient
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object lv_bang_chi: TListView
          Left = 1
          Top = 1
          Width = 763
          Height = 317
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = 'T'#234'n kho'#7843'n chi'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taRightJustify
              Caption = 'S'#7889' ti'#7873'n'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taCenter
              Caption = 'Ng'#224'y chi'
              MaxWidth = 130
              MinWidth = 2
              Width = 130
            end
            item
              Caption = 'Tr'#7921'c thu'#7897'c'
            end
            item
              Caption = 'M'#244' t'#7843
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = lv_bang_chiColumnClick
          OnCompare = lv_bang_chiCompare
          OnMouseDown = lv_bang_chiMouseDown
        end
      end
    end
    object ts_du_chi: TTabSheet
      Caption = 'D'#7921' chi'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 765
        Height = 319
        Align = alClient
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object lv_du_chi: TListView
          Left = 1
          Top = 1
          Width = 763
          Height = 317
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = 'Kho'#7843'n d'#7921' chi'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taRightJustify
              Caption = 'S'#7889' ti'#7873'n'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taCenter
              Caption = 'Ng'#224'y th'#234'm'
              MaxWidth = 130
              MinWidth = 2
              Width = 130
            end
            item
              Caption = 'Tr'#7921'c thu'#7897'c'
            end
            item
              Caption = 'M'#244' t'#7843
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = lv_du_chiColumnClick
          OnCompare = lv_du_chiCompare
          OnDblClick = lv_du_chiDblClick
          OnMouseDown = lv_du_chiMouseDown
        end
      end
    end
    object ts_su_thu: TTabSheet
      Caption = 'D'#7921' thu'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 765
        Height = 319
        Align = alClient
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object lv_du_thu: TListView
          Left = 1
          Top = 1
          Width = 763
          Height = 317
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = 'Kho'#7843'n d'#7921' thu'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taRightJustify
              Caption = 'S'#7889' ti'#7873'n'
              MinWidth = 2
              Width = 150
            end
            item
              Alignment = taCenter
              Caption = 'Ng'#224'y th'#234'm'
              MaxWidth = 130
              MinWidth = 2
              Width = 130
            end
            item
              Caption = 'Tr'#7921'c thu'#7897'c'
            end
            item
              Caption = 'M'#244' t'#7843
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = lv_du_thuColumnClick
          OnCompare = lv_du_thuCompare
          OnMouseDown = lv_du_thuMouseDown
          ExplicitLeft = 0
          ExplicitTop = 0
        end
      end
    end
  end
  object tm1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = tm1Timer
    Left = 552
    Top = 43
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 503
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 120
    object mm_quan_ly_khoan_tu_dong: TMenuItem
      Caption = 'Qu'#7843'n l'#253' kho'#7843'n t'#7921' '#273#7897'ng'
    end
    object mm_quan_ly_tai_khoan_ngan_hang: TMenuItem
      Caption = 'Qu'#7843'n l'#253' t'#224'i kho'#7843'n ng'#226'n h'#224'ng'
      OnClick = mm_quan_ly_tai_khoan_ngan_hangClick
    end
    object mm_bao_cao_tai_chinh: TMenuItem
      Caption = 'B'#225'o c'#225'o t'#224'i ch'#237'nh'
    end
  end
end
