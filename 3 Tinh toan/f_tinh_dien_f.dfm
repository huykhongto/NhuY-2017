object f_tinh_dien: Tf_tinh_dien
  Left = 29
  Top = 235
  Caption = 'T'#237'nh to'#225'n '#273'i'#7879'n'
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
    Left = 585
    Top = 0
    Height = 451
    ExplicitLeft = 421
  end
  object PageControl1: TPageControl
    Left = 588
    Top = 0
    Width = 90
    Height = 451
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cartesian Co-ordinates'
      object Edit1: TEdit
        Left = 44
        Top = 24
        Width = 205
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Edit1'
        Visible = False
      end
      object Button1: TButton
        Left = 272
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 82
        Height = 422
        HorzScrollBar.Range = 555
        VertScrollBar.Range = 555
        VertScrollBar.Smooth = True
        Align = alClient
        AutoScroll = False
        TabOrder = 2
        object pb_ve: TPaintBox
          Left = 216
          Top = 171
          Width = 233
          Height = 219
          Color = clCream
          ParentColor = False
          OnPaint = pb_vePaint
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Polar Co-ordinates'
      ImageIndex = 1
      DesignSize = (
        82
        422)
      object PaintBox2: TPaintBox
        Left = 0
        Top = 2
        Width = 82
        Height = 417
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnPaint = PaintBox2Paint
        ExplicitWidth = 501
        ExplicitHeight = 409
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Misscellaneous'
      ImageIndex = 2
      object PaintBox3: TPaintBox
        Left = 0
        Top = 0
        Width = 82
        Height = 422
        Align = alClient
        OnPaint = PaintBox3Paint
        ExplicitLeft = -2
        ExplicitTop = 3
        ExplicitWidth = 500
        ExplicitHeight = 395
      end
      object ScrollBar1: TScrollBar
        Left = 200
        Top = 362
        Width = 121
        Height = 17
        PageSize = 0
        TabOrder = 0
      end
      object ScrollBar2: TScrollBar
        Left = 336
        Top = 247
        Width = 153
        Height = 25
        PageSize = 0
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 82
        Height = 422
        HorzScrollBar.Range = 5555
        HorzScrollBar.Size = 1000
        VertScrollBar.Range = 5555
        VertScrollBar.Size = 11111
        Align = alClient
        AutoScroll = False
        TabOrder = 0
        object p_v: TPaintBox
          Left = 58
          Top = 3
          Width = 438
          Height = 395
          OnPaint = p_vPaint
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 451
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 1
    object Label1: TLabel
      Left = 8
      Top = 38
      Width = 110
      Height = 14
      Caption = 'C'#244'ng su'#7845't '#273#7883'nh m'#7913'c'
    end
    object Label2: TLabel
      Left = 145
      Top = 38
      Width = 89
      Height = 14
      Caption = 'H'#7879' s'#7889' c'#244'ng su'#7845't'
    end
    object l_cong: TLabel
      Left = 255
      Top = 38
      Width = 108
      Height = 14
      Caption = 'C'#244'ng su'#7845't bi'#7875'u ki'#7871'n'
    end
    object Label3: TLabel
      Left = 145
      Top = 13
      Width = 15
      Height = 14
      Caption = 'HP'
    end
    object Label4: TLabel
      Left = 8
      Top = 86
      Width = 38
      Height = 14
      Caption = 'S'#7889' pha'
    end
    object Label5: TLabel
      Left = 400
      Top = 38
      Width = 180
      Height = 14
      Caption = 'C'#244'ng su'#7845't ngu'#7891'n kh'#7903'i '#273#7897'ng (3P)'
    end
    object Label6: TLabel
      Left = 527
      Top = 61
      Width = 49
      Height = 14
      Caption = 'Tam gi'#225'c'
    end
    object Label7: TLabel
      Left = 527
      Top = 13
      Width = 20
      Height = 14
      Caption = 'Sao'
    end
    object Label8: TLabel
      Left = 11
      Top = 140
      Width = 91
      Height = 14
      Caption = 'D'#242'ng '#273'i'#7879'n v'#224'o A'
    end
    object Label9: TLabel
      Left = 201
      Top = 112
      Width = 135
      Height = 14
      Caption = 'Ti'#7871't di'#7879'n d'#226'y '#273#7891'ng mm2'
    end
    object Label10: TLabel
      Left = 201
      Top = 160
      Width = 138
      Height = 14
      Caption = 'Ti'#7871't di'#7879'n d'#226'y nh'#244'm mm2'
    end
    object Label11: TLabel
      Left = 360
      Top = 112
      Width = 63
      Height = 14
      Caption = #272#432#7901'ng k'#237'nh'
    end
    object ComboBox1: TComboBox
      Left = 152
      Top = 403
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
      Left = 400
      Top = 258
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
      Left = 280
      Top = 258
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
      Left = 201
      Top = 280
      Width = 73
      Height = 23
      Caption = 'Printer SetUp'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 101
      Top = 216
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
      Left = 176
      Top = 258
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 7
    end
    object Button3: TButton
      Left = 193
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 8
    end
    object e_cong_suat_bieu_kien: TEdit
      Left = 255
      Top = 58
      Width = 121
      Height = 22
      Hint = 
        'D'#249'ng '#273#7875' ch'#7881' s'#7921' cung '#7913'ng '#273'i'#7879'n n'#259'ng t'#7915' ngu'#7891'n, l'#224' t'#7893'ng ph'#7847'n th'#7921'c c'#244 +
        'ng su'#7845't hi'#7879'u d'#7909'ng v'#224' ph'#7847'n '#7843'o c'#244'ng su'#7845't h'#432' kh'#225'ng trong '#273'i'#7879'n xoay ' +
        'chi'#7873'u, S = P + iQ hay S =  sqrt(P*P+Q*Q) '#272#417'n v'#7883' c'#7911'a c'#244'ng su'#7845't bi' +
        #7875'u ki'#7871'n l'#224' VA (v'#244'n-ampe), 1 kVA = 1000 VA.'
      TabOrder = 9
      Text = '0'
      OnChange = e_cong_suat_bieu_kienChange
    end
    object e_cong_suat_dinh_muc: TEdit
      Left = 8
      Top = 58
      Width = 121
      Height = 22
      TabOrder = 10
      Text = '0'
      OnKeyUp = e_cong_suat_dinh_mucKeyUp
    end
    object cbb_he_so_cong_suat: TComboBox
      Left = 145
      Top = 58
      Width = 90
      Height = 22
      TabOrder = 11
      Text = '0.8'
    end
    object Edit3: TEdit
      Left = -160
      Top = 387
      Width = 121
      Height = 22
      TabOrder = 12
      Text = 'Edit3'
    end
    object Button4: TButton
      Left = 424
      Top = 214
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 13
      OnClick = Button4Click
    end
    object e_cong_xuat_hp: TEdit
      Left = 8
      Top = 10
      Width = 121
      Height = 22
      TabOrder = 14
      Text = '0'
      OnKeyUp = e_cong_xuat_hpKeyUp
    end
    object ComboBox3: TComboBox
      Left = 8
      Top = 106
      Width = 57
      Height = 22
      ItemIndex = 2
      TabOrder = 15
      Text = '3'
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object e_cong_suat_nguon_kd: TEdit
      Left = 400
      Top = 58
      Width = 121
      Height = 22
      TabOrder = 16
      Text = '0'
    end
    object e_cong_suat_nguon_kd_sao: TEdit
      Left = 400
      Top = 10
      Width = 121
      Height = 22
      TabOrder = 17
      Text = '0'
    end
    object e_dong_dien_vao: TEdit
      Left = 8
      Top = 160
      Width = 121
      Height = 22
      TabOrder = 18
      Text = '0'
      OnKeyUp = e_dong_dien_vaoKeyUp
    end
    object e_tiet_dien_day_dong: TEdit
      Left = 201
      Top = 132
      Width = 89
      Height = 22
      TabOrder = 19
    end
    object e_tiet_dien_day_nhom: TEdit
      Left = 201
      Top = 180
      Width = 89
      Height = 22
      TabOrder = 20
    end
    object e_duong_kinh_dong: TEdit
      Left = 360
      Top = 132
      Width = 97
      Height = 22
      TabOrder = 21
    end
    object e_duong_kinh_nhom: TEdit
      Left = 360
      Top = 180
      Width = 97
      Height = 22
      TabOrder = 22
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 280
    Top = 312
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 188
    Top = 320
  end
end
