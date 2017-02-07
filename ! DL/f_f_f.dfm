object f_f: Tf_f
  Left = 0
  Top = 0
  Caption = 'Qu'#7843'n l'#253' h'#236'nh '#7843'nh'
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
    Top = 273
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
    Top = 276
    Width = 718
    Height = 158
    Align = alClient
    TabOrder = 0
    object lv_ha: TListView
      Left = 1
      Top = 1
      Width = 716
      Height = 156
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'M'#227
          MinWidth = 2
        end
        item
          Caption = 'T'#234'n'
        end
        item
          Caption = 'M'#244' t'#7843
        end
        item
          Caption = 'Nh'#243'm'
        end
        item
          Caption = 'Dung l'#432#7907'ng'
        end
        item
          Caption = 'Th'#7867
        end
        item
          Caption = 'Kh'#225'c'
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lv_haColumnClick
      OnCompare = lv_haCompare
      OnMouseDown = lv_haMouseDown
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 273
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 32
      Height = 13
      Caption = 'H'#7885' t'#234'n'
    end
    object lb_so_kh: TLabel
      Left = 615
      Top = 35
      Width = 42
      Height = 13
      Caption = 'lb_so_kh'
    end
    object cbb_tim: TComboBox
      Left = 8
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 6
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'T'#234'n'
    end
    object m_thong_tin: TMemo
      Left = 461
      Top = 54
      Width = 145
      Height = 88
      Hint = 'Nh'#7919'ng th'#244'ng tin kh'#225'c'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object Panel3: TPanel
      Left = 294
      Top = 4
      Width = 395
      Height = 25
      TabOrder = 5
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
      object bt_them_vao_cham_cong: TButton
        Left = 279
        Top = 0
        Width = 114
        Height = 25
        Caption = 'Th'#234'm v'#224'o ch'#7845'm c'#244'ng'
        TabOrder = 4
        OnClick = bt_them_vao_cham_congClick
      end
    end
    object cbb_chuyen_mon: TComboBox
      Left = 159
      Top = 54
      Width = 145
      Height = 21
      Hint = 'Chuy'#234'n m'#244'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TextHint = 'Chuy'#234'n m'#244'n'
      OnChange = cbb_emailChange
    end
    object cbb_so_thich: TComboBox
      Left = 310
      Top = 55
      Width = 145
      Height = 21
      Hint = 'S'#7903' th'#237'ch'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TextHint = 'S'#7903' th'#237'ch'
      OnChange = cbb_emailChange
    end
    object ComboBox1: TComboBox
      Left = 15
      Top = 95
      Width = 145
      Height = 21
      Hint = 'S'#7903' th'#237'ch'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TextHint = 'S'#7903' th'#237'ch'
      OnChange = cbb_emailChange
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 125
      Width = 185
      Height = 154
      Caption = ' Accept the following formats '
      TabOrder = 8
      object CheckBoxText: TCheckBox
        Left = 12
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Text'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBoxTextClick
      end
      object CheckBoxFiles: TCheckBox
        Left = 12
        Top = 36
        Width = 97
        Height = 17
        Caption = 'Files'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBoxFilesClick
      end
      object CheckBoxURLs: TCheckBox
        Left = 12
        Top = 52
        Width = 97
        Height = 17
        Caption = 'URLs'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBoxURLsClick
      end
      object CheckBoxBitmaps: TCheckBox
        Left = 12
        Top = 68
        Width = 97
        Height = 17
        Caption = 'Bitmaps'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBoxBitmapsClick
      end
      object CheckBoxMetaFiles: TCheckBox
        Left = 3
        Top = 80
        Width = 97
        Height = 17
        Caption = 'Meta files'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBoxMetaFilesClick
      end
      object CheckBoxData: TCheckBox
        Left = 12
        Top = 100
        Width = 97
        Height = 17
        Caption = 'Data'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBoxDataClick
      end
    end
    object PageControl1: TPageControl
      Left = 247
      Top = 148
      Width = 359
      Height = 125
      ActivePage = TabSheetData
      MultiLine = True
      TabOrder = 9
      object TabSheetText: TTabSheet
        Caption = 'Text'
        Enabled = False
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object MemoText: TMemo
          Left = 0
          Top = 0
          Width = 351
          Height = 115
          Align = alClient
          TabOrder = 0
        end
      end
      object TabSheetFiles: TTabSheet
        Caption = 'Files'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Splitter2: TSplitter
          Left = 0
          Top = 49
          Width = 351
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ResizeStyle = rsUpdate
          ExplicitTop = 166
          ExplicitWidth = 481
        end
        object ListBoxFiles: TListBox
          Left = 0
          Top = 0
          Width = 351
          Height = 49
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
        object ListBoxMaps: TListBox
          Left = 0
          Top = 52
          Width = 351
          Height = 63
          Align = alBottom
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object TabSheetBitmap: TTabSheet
        Caption = 'Bitmap'
        ImageIndex = 2
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 351
          Height = 115
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object ImageBitmap: TImage
            Left = 0
            Top = 0
            Width = 639
            Height = 333
            AutoSize = True
          end
        end
      end
      object TabSheetURL: TTabSheet
        Caption = 'URL'
        ImageIndex = 3
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label2: TLabel
          Left = 12
          Top = 20
          Width = 19
          Height = 13
          Margins.Bottom = 0
          Caption = 'URL'
          FocusControl = EditURLURL
        end
        object Label3: TLabel
          Left = 12
          Top = 44
          Width = 20
          Height = 13
          Margins.Bottom = 0
          Caption = 'Title'
          FocusControl = EditURLTitle
        end
        object EditURLURL: TEdit
          Left = 48
          Top = 16
          Width = 573
          Height = 21
          TabOrder = 0
        end
        object EditURLTitle: TEdit
          Left = 48
          Top = 40
          Width = 573
          Height = 21
          TabOrder = 1
        end
      end
      object TabSheetData: TTabSheet
        Caption = 'Data'
        ImageIndex = 4
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ListViewData: TListView
          Left = 0
          Top = 0
          Width = 351
          Height = 115
          Align = alClient
          Columns = <
            item
              AutoSize = True
              Caption = 'Filename'
              MinWidth = 200
            end
            item
              Alignment = taRightJustify
              Caption = 'Size'
              MinWidth = 50
            end>
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ListViewDataDblClick
        end
      end
      object TabSheetMetaFile: TTabSheet
        Caption = 'MetaFile'
        ImageIndex = 5
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 351
          Height = 115
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object ImageMetaFile: TImage
            Left = 0
            Top = 0
            Width = 635
            Height = 325
            AutoSize = True
          end
        end
      end
    end
  end
  object ComboBox2: TComboBox
    Left = 166
    Top = 98
    Width = 145
    Height = 21
    Hint = 'S'#7903' th'#237'ch'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = 'S'#7903' th'#237'ch'
    OnChange = cbb_emailChange
  end
  object tm1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tm1Timer
    Left = 640
    Top = 56
  end
end
