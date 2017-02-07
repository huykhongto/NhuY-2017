object f_Chuyen_doi_ngon_ngu_lap_trinh: Tf_Chuyen_doi_ngon_ngu_lap_trinh
  Left = 0
  Top = 0
  Caption = 'Chuy'#7875'n '#273#7893'i ng'#244'n ng'#7919' l'#7853'p tr'#236'nh'
  ClientHeight = 371
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 215
    Top = 24
    Width = 330
    Height = 337
    Caption = #272#237'ch'
    TabOrder = 3
    object cb_Dich: TComboBox
      Left = 3
      Top = 22
      Width = 141
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'B'#7843'ng d'#7919' li'#7879'u C (CCS)')
    end
    object mm_Dich: TMemo
      Left = 6
      Top = 71
      Width = 324
      Height = 263
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 24
    Width = 193
    Height = 337
    Caption = 'Ngu'#7891'n'
    TabOrder = 2
    object cb_Nguon: TComboBox
      Left = 3
      Top = 22
      Width = 158
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'B'#7843'ng d'#7919' li'#7879'u ASM PIC'
        'B'#7843'ng d'#7919' li'#7879'u ASM MCS51')
    end
    object mm_Nguon: TMemo
      Left = 0
      Top = 71
      Width = 166
      Height = 263
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 1
    end
  end
  object CheckBox1: TCheckBox
    Left = 551
    Top = 17
    Width = 97
    Height = 25
    Caption = 'T'#7921' '#273#7897'ng Coppy'
    TabOrder = 0
  end
  object CheckBox2: TCheckBox
    Left = 551
    Top = 48
    Width = 97
    Height = 17
    Caption = 'T'#7921' '#273#7897'ng d'#7883'ch'
    TabOrder = 1
  end
  object b_Chuyen_doi: TButton
    Left = 551
    Top = 119
    Width = 73
    Height = 26
    Caption = 'Chuy'#7875'n '#273#7893'i'
    TabOrder = 4
    OnClick = b_Chuyen_doiClick
  end
  object b_sao_chep: TButton
    Left = 551
    Top = 151
    Width = 73
    Height = 25
    Caption = 'Sao ch'#233'p'
    TabOrder = 5
    OnClick = b_sao_chepClick
  end
  object b_dan: TButton
    Left = 551
    Top = 88
    Width = 73
    Height = 25
    Caption = 'D'#225'n'
    TabOrder = 6
    OnClick = b_danClick
  end
  object cb_ghep_dl: TCheckBox
    Left = 551
    Top = 71
    Width = 97
    Height = 17
    Caption = 'Gh'#233'p d'#7919' li'#7879'u'
    TabOrder = 7
  end
end
