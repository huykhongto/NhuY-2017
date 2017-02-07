object f_thong_ke: Tf_thong_ke
  Left = 0
  Top = 0
  Caption = 'Th'#7889'ng k'#234
  ClientHeight = 522
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 24
    Top = 16
    Width = 625
    Height = 201
    TabOrder = 0
    object Label2: TLabel
      Left = 219
      Top = 22
      Width = 82
      Height = 13
      Caption = 'Ti'#7873'n m'#7863't hi'#7879'n c'#243':'
    end
    object l_tien_mat_hien_co: TLabel
      Left = 307
      Top = 21
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
    end
    object GroupBox1: TGroupBox
      Left = 168
      Top = 57
      Width = 214
      Height = 120
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
      object l_tien_hien_tai: TLabel
        Left = 112
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
      end
      object l_tong_thu: TLabel
        Left = 112
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
      end
      object l_tong_chi: TLabel
        Left = 112
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
      end
      object l_tong: TLabel
        Left = 112
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
      end
      object Label7: TLabel
        Left = 3
        Top = 24
        Width = 112
        Height = 14
        Caption = 'Ti'#7873'n m'#7863't c'#7911'a th'#225'ng:'
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
    object cbb_thang_chon: TComboBox
      Left = 16
      Top = 22
      Width = 105
      Height = 21
      TabOrder = 1
      Text = 'To'#224'n th'#7901'i gian'
      OnChange = cbb_thang_chonChange
      Items.Strings = (
        'To'#224'n th'#7901'i gian'
        'Th'#225'ng 1'
        'Th'#225'ng 2'
        'Th'#225'ng 3'
        'Th'#225'ng 4'
        'Th'#225'ng 5'
        'Th'#225'ng 6'
        'Th'#225'ng 7'
        'Th'#225'ng 8'
        'Th'#225'ng 9'
        'Th'#225'ng 10'
        'Th'#225'ng 11'
        'Th'#225'ng 12')
    end
    object GroupBox2: TGroupBox
      Left = 388
      Top = 57
      Width = 185
      Height = 120
      Caption = 'L'#7907'i nhu'#7853'n'
      TabOrder = 2
      object Label1: TLabel
        Left = 15
        Top = 17
        Width = 46
        Height = 13
        Caption = 'L'#7907'i nhu'#7853'n'
      end
      object l_loi_nhuan: TLabel
        Left = 67
        Top = 16
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
      end
      object l_tu_thien: TLabel
        Left = 67
        Top = 36
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
      end
      object Label3: TLabel
        Left = 15
        Top = 36
        Width = 40
        Height = 13
        Caption = 'T'#7915' thi'#7879'n'
      end
      object Label4: TLabel
        Left = 15
        Top = 55
        Width = 42
        Height = 13
        Caption = 'Ti'#7871't ki'#7879'm'
      end
      object Label5: TLabel
        Left = 15
        Top = 74
        Width = 34
        Height = 13
        Caption = #272#7847'u t'#432
      end
      object Label6: TLabel
        Left = 15
        Top = 93
        Width = 31
        Height = 13
        Caption = 'Tr'#7843' n'#7907
      end
      object l_tiet_kiem: TLabel
        Left = 67
        Top = 56
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
      end
      object l_dau_tu: TLabel
        Left = 67
        Top = 74
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
      end
      object l_tra_no: TLabel
        Left = 67
        Top = 94
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
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 223
    Width = 665
    Height = 307
    TabOrder = 1
  end
  object Button1: TButton
    Left = 590
    Top = 231
    Width = 75
    Height = 25
    Caption = 'Kh'#243'a s'#7893
    TabOrder = 2
  end
end
