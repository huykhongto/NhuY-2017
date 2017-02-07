object f_5_bien_so_loi_nhuan: Tf_5_bien_so_loi_nhuan
  Left = 0
  Top = 0
  Caption = 'f_5_bien_so_loi_nhuan'
  ClientHeight = 377
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lv_thong_bao: TListView
    Left = 16
    Top = 79
    Width = 665
    Height = 290
    Checkboxes = True
    Columns = <
      item
        Caption = 'L'#432#7907'ng kh'#225'ch h'#224'ng ti'#7873'm n'#259'ng'
        MinWidth = 2
        Width = 150
      end
      item
        Caption = 'T'#7927' l'#7879' mua h'#224'ng (T'#7927' l'#7879' kh'#225'ch h'#224'ng ti'#7873'm n'#259'ng -> kh'#225'ch h'#224'ng)'
        MinWidth = 2
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = 'S'#7889' ti'#7873'n mua trung b'#236'nh'
        MaxWidth = 130
        MinWidth = 2
        Width = 130
      end
      item
        Caption = 'S'#7889' l'#7847'n mua l'#7863'p l'#7841'i tung b'#236'nh'
      end
      item
        Caption = 'T'#7927' l'#7879' l'#7907'i nhu'#7853'n r'#242'ng'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Edit1: TEdit
    Left = 16
    Top = 8
    Width = 145
    Height = 21
    Hint = 
      'Khi ai '#273#243' g'#7885'i '#273'i'#7879'n '#273#7871'n c'#244'ng ty, b'#432#7899'c v'#224'o c'#7911'a h'#224'ng ho'#7863'c '#273#432#7907'c li'#234'n' +
      ' h'#7879
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = 'e_khtn'
  end
  object Edit2: TEdit
    Left = 167
    Top = 8
    Width = 145
    Height = 21
    Hint = 'T'#7927' l'#7879' kh'#225'ch h'#224'ng / L'#432#7907'ng kh'#225'ch h'#224'ng ti'#7873'm n'#259'ng'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = 'e_tlmh'
  end
  object e_lkh: TEdit
    Left = 112
    Top = 35
    Width = 145
    Height = 21
    Hint = 'L'#432#7907'ng kh'#225'ch h'#224'ng'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = 'e_khtn'
  end
  object Edit3: TEdit
    Left = 318
    Top = 8
    Width = 145
    Height = 21
    Hint = 'S'#7889' ti'#7873'n trung b'#236'nh m'#7895'i kh'#225'ch h'#224'ng b'#7887' ra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = 'e_stmyb'
  end
  object e_slmll: TEdit
    Left = 464
    Top = 8
    Width = 145
    Height = 21
    Hint = 
      'Khi ai '#273#243' g'#7885'i '#273'i'#7879'n '#273#7871'n c'#244'ng ty, b'#432#7899'c v'#224'o c'#7911'a h'#224'ng ho'#7863'c '#273#432#7907'c li'#234'n' +
      ' h'#7879
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = 'e_khtn'
  end
  object Edit4: TEdit
    Left = 368
    Top = 52
    Width = 145
    Height = 21
    Hint = 
      'Khi ai '#273#243' g'#7885'i '#273'i'#7879'n '#273#7871'n c'#244'ng ty, b'#432#7899'c v'#224'o c'#7911'a h'#224'ng ho'#7863'c '#273#432#7907'c li'#234'n' +
      ' h'#7879
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = 'e_khtn'
  end
end
