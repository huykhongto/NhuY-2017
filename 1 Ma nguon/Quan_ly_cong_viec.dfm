object f_quan_ly_cong_viec: Tf_quan_ly_cong_viec
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' c'#244'ng vi'#7879'c'
  ClientHeight = 439
  ClientWidth = 807
  Color = clBtnFace
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
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sttb1: TStatusBar
    Left = 0
    Top = 420
    Width = 807
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 234
    Width = 807
    Height = 186
    Align = alClient
    TabOrder = 1
    object lv_cong_viec: TListView
      Left = 1
      Top = 1
      Width = 805
      Height = 184
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'M'#227
        end
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
          MinWidth = 2
          Width = 30
        end
        item
          Caption = 'D'#7921' t'#237'nh'
          MinWidth = 2
          Width = 65
        end
        item
          Caption = 'Ng'#224'y th'#234'm'
          MinWidth = 2
          Width = 130
        end
        item
          Caption = 'Ng'#224'y ho'#224'n th'#224'nh'
          MinWidth = 2
        end
        item
          Caption = 'Ho'#224'n th'#224'nh'
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
      OnColumnClick = lv_cong_viecColumnClick
      OnCompare = lv_cong_viecCompare
      OnMouseDown = lv_cong_viecMouseDown
      OnResize = lv_cong_viecResize
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 234
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 75
      Width = 79
      Height = 13
      Caption = 'M'#244' t'#7843' c'#244'ng vi'#7879'c:'
    end
    object Label6: TLabel
      Left = 344
      Top = 35
      Width = 65
      Height = 13
      Caption = 'Quang tr'#7885'ng:'
    end
    object Label2: TLabel
      Left = 506
      Top = 70
      Width = 56
      Height = 13
      Caption = 'Ng'#224'y th'#234'm:'
    end
    object Label4: TLabel
      Left = 506
      Top = 97
      Width = 88
      Height = 13
      Caption = 'Ng'#224'y Ho'#224'n th'#224'nh:'
    end
    object Label5: TLabel
      Left = 570
      Top = 43
      Width = 66
      Height = 13
      Caption = 'Ng'#224'y d'#7921' t'#237'nh:'
    end
    object Label7: TLabel
      Left = 506
      Top = 154
      Width = 41
      Height = 13
      Caption = 'Th'#432' m'#7909'c'
    end
    object lb_so_cv: TLabel
      Left = 508
      Top = 127
      Width = 64
      Height = 13
      Caption = 'S'#7889' c'#244'ng vi'#7879'c:'
    end
    object m_mo_ta_cv: TMemo
      Left = 8
      Top = 92
      Width = 408
      Height = 136
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object cbb_ten_cong_viec: TComboBox
      Left = 16
      Top = 41
      Width = 310
      Height = 21
      AutoComplete = False
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 110
      Top = 10
      Width = 279
      Height = 25
      TabOrder = 2
      object b_xoa: TButton
        Left = 0
        Top = 0
        Width = 57
        Height = 25
        Caption = 'X'#243'a'
        TabOrder = 0
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
        TabOrder = 2
        OnClick = b_themClick
      end
      object b_xoa_cv: TButton
        Left = 191
        Top = 0
        Width = 82
        Height = 25
        Caption = 'X'#243'a c'#244'ng vi'#7879'c'
        TabOrder = 3
        OnClick = b_xoa_cvClick
      end
    end
    object cbb_quan_trong: TComboBox
      Left = 425
      Top = 32
      Width = 46
      Height = 21
      TabOrder = 3
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
    end
    object b_cu_moi: TButton
      Left = 464
      Top = 173
      Width = 75
      Height = 25
      Caption = 'C'#7911
      TabOrder = 4
      OnClick = b_xem_moi_cuClick
    end
    object b_mo_thu_muc: TButton
      Left = 545
      Top = 193
      Width = 75
      Height = 25
      Caption = 'M'#7903' th'#432' m'#7909'c'
      TabOrder = 5
    end
    object b_them_thu_muc: TButton
      Left = 610
      Top = 193
      Width = 90
      Height = 25
      Caption = 'Th'#234'm th'#432' m'#7909'c'
      TabOrder = 6
    end
    object b_xem_moi_cu: TButton
      Left = 464
      Top = 204
      Width = 75
      Height = 25
      Caption = 'Xem c'#7911
      TabOrder = 7
      OnClick = b_xem_moi_cuClick
    end
    object bt_hoan_thanh: TButton
      Left = 497
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Ho'#224'n th'#224'nh'
      Enabled = False
      TabOrder = 8
      OnClick = bt_hoan_thanhClick
    end
    object cb_hoan_thanh: TCheckBox
      Left = 403
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Ho'#224'n th'#224'nh'
      TabOrder = 9
    end
    object cb_ngay_du_tinh: TCheckBox
      Left = 477
      Top = 43
      Width = 70
      Height = 17
      Caption = 'D'#7921' t'#237'nh'
      TabOrder = 10
      OnClick = cb_ngay_du_tinhClick
    end
    object e_ngay_du_tinh: TEdit
      Left = 652
      Top = 38
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 11
    end
    object e_ngay_hoan_thanh: TEdit
      Left = 652
      Top = 92
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object e_ngay_them: TEdit
      Left = 652
      Top = 65
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 13
    end
    object e_thu_muc_cv: TEdit
      Left = 598
      Top = 151
      Width = 190
      Height = 21
      TabOrder = 14
    end
    object ttp_ngay_du_tinh: TDateTimePicker
      Left = 683
      Top = 10
      Width = 105
      Height = 22
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      TabOrder = 15
      OnChange = ttp_ngay_du_tinhChange
    end
  end
  object tm1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = tm1Timer
    Left = 440
    Top = 115
  end
end
