object f_quan_ly_khoan_dinh_ky: Tf_quan_ly_khoan_dinh_ky
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' kho'#7843'n '#273#7883'nh k'#7923
  ClientHeight = 449
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 32
    Top = 160
    Width = 585
    Height = 273
    TabOrder = 0
    object lv_dinh_ky: TListView
      Left = 8
      Top = 8
      Width = 569
      Height = 257
      Checkboxes = True
      Columns = <
        item
          Caption = 'Kho'#7843'n '#273#7883'nh k'#7923
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
          Caption = 'Th'#7901'i gian b'#7855't '#273#7847'u'
          MaxWidth = 130
          MinWidth = 2
          Width = 130
        end
        item
          Caption = 'Th'#7901'i h'#7841'n ch'#243't'
        end
        item
          Caption = 'Tr'#7921'c thu'#7897'c'
        end
        item
          Caption = 'M'#244' t'#7843
        end
        item
          Caption = 'T'#7847'm quan tr'#7885'ng'
        end
        item
          Caption = #272#227' th'#7921'c hi'#7879'n'
        end
        item
          Caption = 'Nh'#7855'c nh'#7903
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object lb_dinh_ky: TListBox
      Left = 560
      Top = 0
      Width = 25
      Height = 17
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object TPanel
    Left = 32
    Top = 8
    Width = 585
    Height = 146
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 8
      Top = 16
      Width = 123
      Height = 21
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object ttp_ngay_du_tinh: TDateTimePicker
      Left = 288
      Top = 16
      Width = 98
      Height = 21
      Align = alCustom
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 152
      Top = 16
      Width = 114
      Height = 21
      TabOrder = 2
      Text = 'ComboBox1'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 392
      Top = 16
      Width = 98
      Height = 21
      Align = alCustom
      Date = 42033.000000000000000000
      Time = 42033.000000000000000000
      TabOrder = 3
    end
    object Memo1: TMemo
      Left = 8
      Top = 57
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 4
    end
    object ComboBox3: TComboBox
      Left = 496
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 5
      Text = 'ComboBox3'
    end
    object ComboBox4: TComboBox
      Left = 216
      Top = 57
      Width = 145
      Height = 21
      TabOrder = 6
      Text = 'ComboBox4'
    end
    object cb_thuc_hien: TCheckBox
      Left = 384
      Top = 56
      Width = 97
      Height = 17
      Caption = 'cb_thuc_hien'
      TabOrder = 7
    end
    object CheckBox2: TCheckBox
      Left = 479
      Top = 56
      Width = 97
      Height = 17
      Caption = 'CheckBox2'
      TabOrder = 8
    end
    object p_nut_nhan: TPanel
      Left = 392
      Top = 97
      Width = 177
      Height = 41
      BevelOuter = bvNone
      Color = clCream
      Ctl3D = False
      ParentCtl3D = False
      ShowCaption = False
      TabOrder = 9
      object bt_them_thu: TButton
        Left = 8
        Top = 8
        Width = 49
        Height = 25
        Caption = 'Th'#234'm'
        TabOrder = 0
      end
      object bt_xoa: TButton
        Left = 63
        Top = 8
        Width = 50
        Height = 25
        Caption = 'X'#243'a'
        TabOrder = 1
      end
      object bt_sua: TButton
        Left = 119
        Top = 8
        Width = 50
        Height = 25
        Caption = 'S'#7917'a'
        Enabled = False
        TabOrder = 2
      end
    end
  end
end
