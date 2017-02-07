object f_dl: Tf_dl
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' d'#7919' li'#7879'u'
  ClientHeight = 438
  ClientWidth = 646
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 646
    Height = 438
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Hint = 'Du lieu chung'
      Caption = 'Trang 1'
      object Panel1: TPanel
        Left = 3
        Top = 3
        Width = 632
        Height = 404
        Color = clGradientInactiveCaption
        ParentBackground = False
        TabOrder = 0
        object Label3: TLabel
          Left = 174
          Top = 15
          Width = 76
          Height = 13
          Caption = 'DL C'#244'ng vi'#7879'c c'#7911
        end
        object Label5: TLabel
          Left = 95
          Top = 71
          Width = 57
          Height = 13
          Caption = 'DL Thi'#234'n S'#7913
        end
        object Label6: TLabel
          Left = 183
          Top = 71
          Width = 54
          Height = 13
          Caption = 'DL Tu ghep'
        end
        object Label7: TLabel
          Left = 23
          Top = 135
          Width = 44
          Height = 13
          Caption = 'DL Vat tu'
        end
        object Label8: TLabel
          Left = 95
          Top = 135
          Width = 70
          Height = 13
          Caption = 'DL Ch'#7845'm C'#244'ng'
        end
        object Label9: TLabel
          Left = 143
          Top = 119
          Width = 138
          Height = 13
          Caption = 'DL Thi'#234'n S'#7913' '#273#432#7907'c ch'#7845'm c'#244'ng'
        end
        object Label10: TLabel
          Left = 256
          Top = 15
          Width = 57
          Height = 13
          Caption = 'DL H'#236'nh '#7843'nh'
        end
        object Label11: TLabel
          Left = 359
          Top = 106
          Width = 75
          Height = 13
          Caption = 'D'#7919' li'#7879'u h'#243'a '#273#417'n'
        end
        object Label12: TLabel
          Left = 11
          Top = 191
          Width = 78
          Height = 13
          Caption = 'DL Tu dien chinh'
        end
        object Label13: TLabel
          Left = 110
          Top = 191
          Width = 75
          Height = 13
          Caption = 'D'#7919' li'#7879'u h'#243'a '#273#417'n'
        end
        object Label14: TLabel
          Left = 10
          Top = 255
          Width = 71
          Height = 13
          Caption = 'D'#7919' li'#7879'u b'#225'o gi'#225
        end
        object lb_cong_viec_cu: TListBox
          Left = 196
          Top = 34
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 0
          Visible = False
        end
        object lb_thien_su: TListBox
          Left = 110
          Top = 90
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 1
          Visible = False
        end
        object lb_tu_ghep: TListBox
          Left = 196
          Top = 90
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
        object lb_cham_cong: TListBox
          Left = 110
          Top = 154
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
        object lb_ds_cham_cong: TListBox
          Left = 196
          Top = 138
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 4
          Visible = False
        end
        object lb_ha: TListBox
          Left = 268
          Top = 34
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 5
          Visible = False
        end
        object lb_Vat_tu: TListBox
          Left = 26
          Top = 154
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 6
          Visible = False
        end
        object lb_hoa_don: TListBox
          Left = 372
          Top = 125
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 7
          Visible = False
        end
        object lb_tu_dien: TListBox
          Left = 26
          Top = 210
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 8
          Visible = False
        end
        object lb_don_hang: TListBox
          Left = 130
          Top = 210
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 9
          Visible = False
        end
        object lb_bao_gia: TListBox
          Left = 26
          Top = 274
          Width = 27
          Height = 23
          ItemHeight = 13
          TabOrder = 10
          Visible = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 16
        Top = 3
        Width = 593
        Height = 406
        Color = clGradientInactiveCaption
        ParentBackground = False
        TabOrder = 0
        object lb_dl_cuoc_song: TListBox
          Left = 464
          Top = 41
          Width = 22
          Height = 24
          ItemHeight = 13
          TabOrder = 0
        end
        object lb_dl_nhom: TListBox
          Left = 505
          Top = 41
          Width = 26
          Height = 24
          ItemHeight = 13
          TabOrder = 1
        end
      end
    end
  end
end
