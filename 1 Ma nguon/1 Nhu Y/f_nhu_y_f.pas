﻿unit f_nhu_y_f;

interface

uses
	Windows, Messages, SysUtils, Classes, vcl.Graphics, Controls, Forms, Dialogs,
	StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, TextTrayIcon,inifiles,
	CoolTrayIcon,LDNam_sys,LDNam_clipboard, SynEdit,f_thong_bao_f,f_tu_ghep_f,
	khai_bao_tu_dien, Vcl.MPlayer, SynMemo, SynDBEdit, SynEditHighlighter,
	SynHighlighterProgress,LDNam_hinh_nen, RichEdit,
	DateUtils,LDNam_sys_thoi_gian,system.UITypes,Clipbrd,LDNam_xu_ly_du_lieu,
	LDNam_dl;

type
	Tf_nhu_y = class(TForm)
		Label1: TLabel;
		bt_tim_kiem: TButton;
    lb_du_lieu: TListBox;
    bt_them: TButton;
    bt_xoa: TButton;
    bt_xoa_tu: TButton;
    tm_lk: TTimer;
    ListView1: TListView;
    sttb1: TStatusBar;
		bt_sua: TButton;
    cbb_tu: TComboBox;
    ppm_lb: TPopupMenu;
    Saochp1: TMenuItem;
    bt_sao_chep: TButton;
    mm_1: TMainMenu;
    mm_quan_ly_tien_no: TMenuItem;
    PopupMenu1: TPopupMenu;
    ppm_thoat: TMenuItem;
    tm1: TTimer;
    TrayIcon1: TTrayIcon;
    cbb_tu_dien: TComboBox;
    ppm1_khoi_dong_cung_win: TMenuItem;
    t_ghi_ini: TTimer;
    tm2: TTimer;
    l_tst: TLabel;
    Cngc1: TMenuItem;
    m_quan_ly_cong_viec: TMenuItem;
    tm_2: TTimer;
    b_a_cong: TButton;
    b_a_tru: TButton;
    t_doc_ini: TTimer;
    m_quan_ly_tai_chinh: TMenuItem;
    p_nut_nhan: TPanel;
    p_1: TPanel;
    Memo3: TMemo;
    GroupBox1: TGroupBox;
    bt_du_lieu: TButton;
    lv_tu_tim: TListView;
    p_thong_tin: TPanel;
    l_tim_thay: TLabel;
    bt_file_dl: TButton;
    cb_tim_nang_cao: TCheckBox;
    Panel1: TPanel;
    tm_dinh_ky_luu_ini: TTimer;
    p_2: TPanel;
    splt_1: TSplitter;
    mm_tu_ghep: TMenuItem;
    mp_1: TMediaPlayer;
    tm_1s: TTimer;
    m_cong_ty_ldnam: TMenuItem;
    m_in_to_gui_buu_pham: TMenuItem;
    m_cong_cu_dien_tu: TMenuItem;
    SynProgressSyn1: TSynProgressSyn;
		sed_nghia: TSynEdit;
		m_quan_ly_diem_ren_luyen: TMenuItem;
    Dn1: TMenuItem;
    tm_phut: TTimer;
    Button1: TButton;
    LDNam1: TMenuItem;
    Khochhmnay1: TMenuItem;
    Chuyningnnglptrnh1: TMenuItem;
    nhtongitrintr1: TMenuItem;
    Qunlkhchhng1: TMenuItem;
    Ghisbngch1: TMenuItem;
    Dmua1: TMenuItem;
    QunlThuKnh1: TMenuItem;
    jre_nghia: TRichEdit;
    Button2: TButton;
    Keywords: TMemo;
    RichEdit1: TRichEdit;
    l_tg: TLabel;
    QunlVtT1: TMenuItem;
    Qunlthinx1: TMenuItem;
    Chmcng1: TMenuItem;
    Qunlhnhnh1: TMenuItem;
    Qunlcucsng1: TMenuItem;
    LDNam2: TMenuItem;
    l2: TLabel;
    Label2: TLabel;
    Inhanbnhng1: TMenuItem;
    BduClipboard1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Chuyntnring1: TMenuItem;
    Inthng1: TMenuItem;
    Inhoa1: TMenuItem;
    Qunlfile1: TMenuItem;
    N3: TMenuItem;
    Button3: TButton;
    Qunlnhng1: TMenuItem;
    Mi1: TMenuItem;
    Qunlnhng2: TMenuItem;
    Xemtrcbogi1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure bt_themClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure bt_xoaClick(Sender: TObject);
    procedure bt_tim_kiemClick(Sender: TObject);
    procedure lb_du_lieuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
		procedure bt_xoa_tuClick(Sender: TObject);
		procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tm_lkTimer(Sender: TObject);
    procedure cbb_tuSelect(Sender: TObject);
		procedure bt_sao_chepClick(Sender: TObject);
		procedure mm_quan_ly_tien_noClick(Sender: TObject);
		procedure Can_vi_tri;
		procedure Luu_ini;
		procedure Tai_ini;
    procedure bt_suaClick(Sender: TObject);
    procedure ppm_thoatClick(Sender: TObject);
    procedure cti1Click(Sender: TObject);
		procedure cbb_tuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure FormResize(Sender: TObject);

    procedure luu_tu_dien;
    procedure tm1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
		procedure TrayIcon1Click(Sender: TObject);
    procedure ppm1_khoi_dong_cung_winClick(Sender: TObject);
    procedure t_ghi_iniTimer(Sender: TObject);
		procedure tm2Timer(Sender: TObject);
    procedure m_quan_ly_cong_viecClick(Sender: TObject);
    procedure tm_2Timer(Sender: TObject);
    procedure b_a_congClick(Sender: TObject);
    procedure b_a_truClick(Sender: TObject);
    procedure t_doc_iniTimer(Sender: TObject);
    procedure m_quan_ly_tai_chinhClick(Sender: TObject);
		procedure chon_lb;
		procedure chon_lb_tim;
		procedure lb_to_lv_dong_tim(vi_tri:integer);
    procedure cbb_tuClick(Sender: TObject);
    procedure cbb_tuChange(Sender: TObject);
    procedure lv_tu_timMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bt_du_lieuClick(Sender: TObject);
    procedure p_file_dlClick(Sender: TObject);
    procedure bt_file_dlClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bt_du_lieuMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bt_suaMouseUp(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer); 
		procedure ma_hoa_dl;
		procedure giai_ma_dl;
    procedure bt_file_dlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure m_nghia_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
		procedure m_nghia_1KeyPress(Sender: TObject; var Key: Char);
		procedure m_nghia_1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbb_tuKeyPress(Sender: TObject; var Key: Char);
    procedure tm_dinh_ky_luu_iniTimer(Sender: TObject);
    procedure splt_1Moved(Sender: TObject);
    procedure mm_tu_ghepClick(Sender: TObject);
    procedure tm_1sTimer(Sender: TObject);
    procedure Cngc1Click(Sender: TObject);
    procedure m_in_to_gui_buu_phamClick(Sender: TObject);
    procedure m_cong_ty_ldnamClick(Sender: TObject);
    procedure Dn1Click(Sender: TObject);
    procedure sed_nghiaKeyPress(Sender: TObject; var Key: Char);
    procedure sed_nghiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tm_phutTimer(Sender: TObject);
    procedure LDNam1Click(Sender: TObject);
    procedure Khochhmnay1Click(Sender: TObject);
    procedure nhtongitrintr1Click(Sender: TObject);
    procedure Chuyningnnglptrnh1Click(Sender: TObject);
    procedure Qunlkhchhng1Click(Sender: TObject);
    procedure Ghisbngch1Click(Sender: TObject);
    procedure Dmua1Click(Sender: TObject);
    procedure QunlThuKnh1Click(Sender: TObject);
    procedure jre_nghiaChange(Sender: TObject);
    procedure jre_nghiaSelectionChange(Sender: TObject);
    procedure QunlVtT1Click(Sender: TObject);
    procedure Qunlthinx1Click(Sender: TObject);
    procedure Chmcng1Click(Sender: TObject);
    procedure Qunlhnhnh1Click(Sender: TObject);
    procedure LDNam2Click(Sender: TObject);
    procedure Qunlcucsng1Click(Sender: TObject);
    procedure m_quan_ly_diem_ren_luyenClick(Sender: TObject);
    procedure Inhanbnhng1Click(Sender: TObject);
    procedure BduClipboard1Click(Sender: TObject);
    procedure Inhoa1Click(Sender: TObject);
    procedure Inthng1Click(Sender: TObject);
		procedure Chuyntnring1Click(Sender: TObject);
		function lenh:boolean;
    procedure Qunlfile1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Qunlnhng1Click(Sender: TObject);
    procedure Mi1Click(Sender: TObject);
    procedure Qunlnhng2Click(Sender: TObject);
    procedure Xemtrcbogi1Click(Sender: TObject);
		
	private
		dung_tab: Boolean;
		//FFileName: string;
		FUpdating: Boolean;
		//FDragOfs: Integer;
		//FDragging: Boolean;
		procedure CMDialogKey(var AMessage: TCMDialogKey); message CM_DIALOGKEY;
		procedure SetModified(Value: Boolean);
		
	 {	function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
		procedure PerformFileOpen(const AFileName: string); }
	public
		PRichEditWndProc:pointer;
		OldRichEditWndProc: {integer}pointer;
		HighLightList:TStringlist;
		highlightcolor:TColor;
		procedure Setcolor(newcolor:TColor);
		Function HighLight:boolean;
	var 
		dong_dl,tu,nghia,du_lieu,hinh,lien_ket,vi_tri:string;
		so_dong_m:integer;
		hien_diem_nhan:boolean;
		//---------------------------------------- 
		
		
		
	end;
	const 
		am_thanh_bat = 1;
		am_thanh_tat = 0;
	
const 
	phan_trang = '~~';
	phan_dong = '``';
var
	f_nhu_y: Tf_nhu_y;
	i, j,p, h1, h2: integer;
	tu_moi:bool;
	sua_tu:bool;
	thoat:bool;
	vi_tri_tim:integer;
	vi_tri_xem:integer;
	da_tim:bool;
	vi_tri_chon:integer;
	so_tu_tim_thay:integer;
	ten_file_dl:integer;
	co_du_lieu:bool;
	tu_vua_tim:string;
	li_tam: TListItem;
	ty_le:integer;  

	chn:byte;
	che_do_am_thanh:byte;
	tg_am_thanh:integer;
	
	
implementation

{$R *.DFM}

uses f_quan_ly_tien_no_f, Quan_ly_cong_viec,f_quan_ly_tai_chinh_f,
  f_in_to_gui_buu_pham_f, f_cong_ty_ldnam_f, Chuyen_doi_ngon_ngu_lap_trinh,
	ShlObj, f_ldnam_f,f_ke_hoach_hom_nay_f, f_tinh_toan_f,
	f_quan_ly_ngoi_sao_f, f_ghi_so_bang_chu_f, f_du_mua_f, f_quan_ly_thau_kinh_f,
	f_quan_ly_vat_tu_f, f_quan_ly_thien_su_f, f_cham_cong_f, f_ha_f,
   f_in_hoa_don_ban_hang_f, f_f_f, f_xem_truoc_in_f,
  f_tinh_dien_f, f_quan_ly_don_hang_f, f_in_bao_gia_f, f_xem_truoc_bao_gia_f;

	resourcestring
	sSaveChanges = 'Save changes to %s?';
	sOverWrite = 'OK to overwrite %s';
	sUntitled = 'Untitled';
	sModified = 'Đã sửa';
	sColRowInfo = 'Line: %3d   Col: %3d';
//========================================
//Function RichEditWndProc (handla:HWnd;uMsg,wParam,lParam:longint): longint stdcall;
//begin
			//Result := CallWindowProc(Tf_tu_dien.OldRichEditWndProc, handla, uMsg, wParam, lParam);
//			if uMsg=WM_PAINT then Tf_tu_dien.HighLight;
//End;
//======================================== 
procedure Tf_nhu_y.SetModified(Value: Boolean);
begin
	if Value then sttb1.Panels[1].Text := sModified
	else sttb1.Panels[1].Text := '';
end;
//======================================== 
procedure Tf_nhu_y.FormCreate(Sender: TObject);
begin
	Khoi_tao_du_lieu;
	
	FormatSettings.DateSeparator:='/';
	
	
	Tao_thu_muc(duong_dan_goc+'\Du lieu\Hinh anh');
	Tao_thu_muc(duong_dan_goc+'\Du lieu\DLC');
	Tao_thu_muc(duong_dan_goc+'\Du lieu\DLN');
	//se_nghia.Font.Name:='Tahoma';
	thoat:=false;
	tm2.Enabled := True;
	j:=-1;
	h1:=lb_du_lieu.Items.Count;
	tu_moi:=false;
	sua_tu:=false;
	vi_tri_tim:=0;
	da_tim:=false;
	vi_tri_xem:=0;
	so_tu_tim_thay:=0;
	j:=-1;
	Can_vi_tri;
	che_do_am_thanh:=am_thanh_tat;
	//m_nghia.Perform(EM_UNDO, 0, 0); 
	//ButtonUndo.Enabled := m_nghia.Perform(EM_CANUNDO, 0, 0); 
	//ButtonUndo.Enabled := m_nghia.CanUndo; // in Delphi 4 or higher 
	//m_nghia.Perform(EM_EMPTYUNDOBUFFER, 0, 0); 
	//m_nghia.ClearUndo; // in Delphi 4 or higher
	//dung_tab:=true;
	chn:=0;
	//----------------------------------------
	hien_diem_nhan:=false;
	HighLightlist:=tStringlist.create;
	setcolor(clblue);
	//PRichEditWndProc:=@RichEditWndProc;
	HighLight;
	//jre_nghia.perform(EM_EXLIMITTEXT, 0, 65535*32);
	//OldRichEditWndProc := pointer(SetWindowLong(jre_nghia.handle, GWL_WNDPROC, longint(@RichEditWndProc)));
	Button2Click(sender);
	//---------------------------------------- 
end;

Function Tf_nhu_y.HighLight:boolean;
 var
   UText, WordName:string;
	 FoundAt, WordLength:integer;
   I, Line:integer;
   hdc:integer;
   CharPosion:integer;
   FirstVisibleLine, LastVisibleLine:integer;
   FirstCharPosofLine:integer;
   h:hwnd;
	 visrect:Trect;
	 vispoint:TPoint;
	 index:integer;
begin
	If hien_diem_nhan=sai then exit;
  {Get the handle of the device context}
  h:=Richedit1.Handle;
  hdc              := getdc(h);
  result:= SendMessage (h, EM_GETRECT, 0, integer(@visrect))=0;
  if result then
  begin
    VisPoint.x       := VisRect.right;
    VisPoint.y       := VisRect.bottom;
    CharPosion       := SendMessage (h, EM_CHARFROMPOS, 0, integer(@VisPoint));
    LASTVISIBLELINE  := SendMessage (h, EM_LINEFROMCHAR, CharPosion, 0);
    FIRSTVISIBLELINE := SendMessage (h, EM_GETFIRSTVISIBLELINE, 0, 0);

    SetBkMode (hDC, TRANSPARENT);
    SelectObject(hdc, richedit1.font.Handle);


    For Line := FIRSTVISIBLELINE to LASTVISIBLELINE  do
    begin
      UText := ' ' + RichEdit1.Lines[Line];
      FirstCharPosofLine := SendMessage (RichEdit1.Handle, EM_LINEINDEX, Line, 0);
      i := 0;

      While i <= LENgth(UText) do
      begin
        FoundAt := i -1;
        {Any character except these will count as a word delimiter}
				While utext[i] in ['#','$','A'..'Z','a'..'z','0'..'9'] do inc(i);

        WordLength        := i- FoundAt -1;
        WordName          := copy(UText, i-WordLength, WordLength);
        If HighLightList.find(uppercase(WordName),index) Then
        //if uppercase(wordname)='PLAY' then
        begin
          SendMessage (RichEdit1.Handle, EM_POSFROMCHAR, integer(@VisPoint), FirstCharPosofLine + FoundAt-1);
          SetTextColor(hdc, highlightcolor);
          TextOut(hdc,  VisPoint.x,  VisPoint.y,  pchar(WordName), WordLength);
        End;
        (*
        //=====>> DO PURPLE FOR OPERATORS
        If pos(utext[i],'=+-*/()[]:^<>,:') > 0 Then
        begin
           FoundAt := i;
           WordName    := copy(UText, FoundAt, 1);
           SendMessage (RichEdit1.Handle, EM_POSFROMCHAR, integer(@VisPoint), FirstCharPosofLine + FoundAt-2);
           SetTextColor(hdc, clPurple);
           TextOut(hdc,  VisPoint.x,  VisPoint.y,  @WordName, Length(WordName));
        End;
        *)
        inc(i);
      end;
    end;
  end;
	ReleaseDC(RichEdit1.Handle, hDC);
	Result:=dung;
end;
procedure Tf_nhu_y.Inhanbnhng1Click(Sender: TObject);
begin
	f_in_hoa_don_ban_hang.show;
end;

procedure Tf_nhu_y.Inhoa1Click(Sender: TObject);
	var
	m:TListBox;
	i:integer;
	dong:string;
begin
	if Clipboard.HasFormat(CF_TEXT) then
	begin
		m:=TListBox.Create(Self);
		m.Visible:=false;
		m.Parent := Self;
		m.Items.Add(Clipboard.AsText);
		//m.PasteFromClipboard;
		for i := 0 to m.items.Count-1 do
		begin
			dong:=AnsiUpperCase(m.items[i]);
			m.items[i]:=dong;
		end;
		//m.CopyToClipboard;
		lb_clb(m,true);
		m.free;
	end;	
end;

procedure Tf_nhu_y.Inthng1Click(Sender: TObject);
	var
	m:TListBox;
	i:integer;
	dong:string;
begin
	if Clipboard.HasFormat(CF_TEXT) then
	begin
		m:=TListBox.Create(Self);
		m.Visible:=false;
		m.Parent := Self;
		m.Items.Add(Clipboard.AsText);
		//m.PasteFromClipboard;
		for i := 0 to m.items.Count-1 do
		begin
			dong:=AnsiLowerCase(m.items[i]);
			m.items[i]:=dong;
		end;
		//m.CopyToClipboard;
		lb_clb(m,true);
		m.free;
	end;	
end;

procedure Tf_nhu_y.jre_nghiaChange(Sender: TObject);
begin
	SetModified(jre_nghia.Modified);
end;

procedure Tf_nhu_y.jre_nghiaSelectionChange(Sender: TObject);
begin
	with jre_nghia.Paragraph do
  try
		FUpdating := True;
		{FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
		end;  }
		//UpdateCursorPos;
	finally
    FUpdating := False;
	end;
end;

//----------------------------------------

//---------------------------------------- 
procedure Tf_nhu_y.Setcolor(newcolor:TColor);
	begin
    highlightcolor:=newcolor;
		Button2.font.color:=newcolor;
	end;
//======================================== 
procedure Tf_nhu_y.Chuyningnnglptrnh1Click(Sender: TObject);
begin
	f_Chuyen_doi_ngon_ngu_lap_trinh.show;
end;

procedure Tf_nhu_y.Chuyntnring1Click(Sender: TObject);
	var
	m:TListBox;
	i:integer;
	dong:string;
begin
	if Clipboard.HasFormat(CF_TEXT) then
	begin
		m:=TListBox.Create(Self);
		m.Visible:=false;
		m.Parent := Self;
		m.Items.Add(Clipboard.AsText);
		//m.PasteFromClipboard;
		for i := 0 to m.items.Count-1 do
		begin
			dong:=ten_rieng(m.items[i]);
			m.items[i]:=dong;
		end;
		//m.CopyToClipboard;
		lb_clb(m,true);
		m.free;
	end;
end;

procedure Tf_nhu_y.CMDialogKey(var AMessage: TCMDialogKey);
begin
  if AMessage.CharCode = VK_TAB then
	begin
		if True then
			if ActiveControl.Name='sed_nghia' then dung_tab:=true
			else  dung_tab:=false;
			
			
		//ShowMessage('TAB key has been pressed in ' + ActiveControl.Name);

		if dung_tab then
    begin
			//ShowMessage('TAB key will be eaten');
      AMessage.Result := 1;
    end
    else
      inherited;        
  end
  else
    inherited;
end;
procedure Tf_nhu_y.Cngc1Click(Sender: TObject);
begin

end;

//========================================
procedure Tf_nhu_y.FormHide(Sender: TObject);
begin
//	Visible := false;
end;

procedure Tf_nhu_y.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if key = VK_TAB then
	MessageDlg('Tab key pressed',mtInformation,[mbOK],0);
end;

procedure Tf_nhu_y.FormMouseDown(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
begin
//Dong_key;
end;
//======================================== 
procedure Tf_nhu_y.FormResize(Sender: TObject);
begin
	Can_vi_tri;
end;
procedure Tf_nhu_y.Ghisbngch1Click(Sender: TObject);
begin
	f_ghi_so_bang_chu.Show;
end;

//========================================
procedure Tf_nhu_y.bt_themClick(Sender: TObject);
var
	i:integer;
	trung_lap:bool;
begin
	hinh:='';lien_ket:='';du_lieu:='';
	if bt_du_lieu.Caption<>'0' then 
	begin
		du_lieu:=IntToStr(ten_file_dl);
		if luu_clipboard(duong_dan_goc+'\Du lieu\DLC\D'+du_lieu+'LDNC') then
		begin
			ten_file_dl:=ten_file_dl+1;
			t_ghi_ini.Enabled:=true;
		end;
	end;
	so_dong_m:=sed_nghia.Lines.Count;
	so_dong_m:=jre_nghia.Lines.Count;
	if cbb_tu.Text='' then
	begin
		sttb1.Panels[0].Text:='Bạn chưa nhập Từ';
		tm1.Enabled:=true;
	end
	else
	if so_dong_m<1 then
	begin
		sttb1.Panels[0].Text:='Bạn chưa nhập nghĩa';
		tm1.Enabled:=true;
  end
	else
	begin
		trung_lap:=false;
		for I := 0 to cbb_tu.Items.Count-1 do
		begin
			if cbb_tu.Items[i]= cbb_tu.Text then
			begin
				trung_lap:=true;
				sttb1.Panels[0].Text:='Từ bạn muốn thêm đã tồn tại';
				tm1.Enabled:=true;
				break;
			end;
		end;
		if trung_lap=false then
		begin
			nghia:=sed_nghia.Lines[0]; // nạp dòng đầu tiên
			nghia:=jre_nghia.Lines[0];
			tu_moi:=true;
			ma_hoa_dl;
			cbb_tu.Items.Add(cbb_tu.Text);
			lb_du_lieu.Items.Add(dong_dl);
			l_tst.Caption:='Tổng số từ: '+ IntToStr(lb_du_lieu.Items.Count);
			luu_tu_dien;
			tm1.Enabled:=true;
			sttb1.Panels[0].Text:='Thêm từ thành công';
			//sttb1.Panels[0]
		end;
	end;
	bt_du_lieu.Caption:='0'; 
end;

procedure Tf_nhu_y.Button4Click(Sender: TObject);
begin;
	bt_them.Enabled := true;
	sua_tu:=false;
	bt_sua.Caption:='Sửa >';
end;

procedure Tf_nhu_y.bt_xoaClick(Sender: TObject);
begin
	cbb_tu.Text:='';
	sed_nghia.Lines.Clear;
	jre_nghia.Lines.Clear;
	co_du_lieu:=false;
end;

procedure Tf_nhu_y.luu_tu_dien;
begin
	lb_du_lieu.Items.SaveToFile(duong_dan_goc+'\Du lieu\Tu dien LDN.TDLDN',TEncoding.UTF8);
	tu_moi:=false;
end;


procedure Tf_nhu_y.lv_tu_timMouseDown(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
begin
	if so_tu_tim_thay=0 then bt_xoa_tu.Enabled:=false;
	if lv_tu_tim.ItemIndex=-1 then Exit;
	ListItem:=lv_tu_tim.Items[lv_tu_tim.ItemIndex];
	with ListItem do
	begin
		vi_tri_chon:=StrToInt(SubItems.Strings[4]);
	end;
	lb_du_lieu.ItemIndex:=vi_tri_chon;
	lb_du_lieu.Selected[vi_tri_chon];
	chon_lb;
	bt_xoa_tu.Enabled:=true;
	bt_sua.Enabled:=true;
	sua_tu:=false; // cho phep sửa từ
end;

procedure Tf_nhu_y.BduClipboard1Click(Sender: TObject);
var
	m:TListBox;
	i:integer;
	dong:string;
begin
	if Clipboard.HasFormat(CF_TEXT) then
	begin
		m:=TListBox.Create(Self);
		m.Visible:=false;
		m.Parent := Self;
		m.Items.Add(Clipboard.AsText);
		//m.PasteFromClipboard;
		for i := 0 to m.items.Count-1 do
		begin
			dong:=bo_dau(m.items[i]);
			m.items[i]:=dong;
		end;
		//m.CopyToClipboard;
		lb_clb(m,true);
		m.free;
	end;
end;

procedure Tf_nhu_y.bt_du_lieuClick(Sender: TObject);
begin
	co_du_lieu:=False;
	if kiem_tra_clipboard then
	begin
		bt_du_lieu.Caption:='D'+IntToStr(ten_file_dl);
		co_du_lieu:=True;
	end 
	else bt_du_lieu.Caption:='0'; 
end;

procedure Tf_nhu_y.bt_du_lieuMouseUp(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
begin
	if Button=mbRight then bt_du_lieu.Caption:='0';
end;

procedure Tf_nhu_y.bt_file_dlClick(Sender: TObject);
begin
	if bt_file_dl.Caption<>'0' then
	if tai_clipboard(duong_dan_goc+'\Du lieu\DLC\'+bt_file_dl.Caption+'LDNC')=true then
	begin
		sttb1.Panels[0].Text:='Tải dữ liệu thành công';
		tm1.Enabled:=true;
	end;
end;

procedure Tf_nhu_y.bt_file_dlMouseUp(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
begin
	if (Button=mbRight) and sua_tu then bt_file_dl.Caption:='0';
end;

procedure Tf_nhu_y.bt_sao_chepClick(Sender: TObject);
begin
	sed_nghia.SelectAll;
	sed_nghia.CopyToClipboard;
	jre_nghia.SelectAll;
	jre_nghia.CopyToClipboard;
end;

procedure Tf_nhu_y.b_a_congClick(Sender: TObject);
begin
	sed_nghia.Font.Size:=sed_nghia.Font.Size+1;
	jre_nghia.Font.Size:=jre_nghia.Font.Size+1;
end;

procedure Tf_nhu_y.b_a_truClick(Sender: TObject);
begin
	sed_nghia.Font.Size:=sed_nghia.Font.Size-1;
	jre_nghia.Font.Size:=jre_nghia.Font.Size-1;
	//jre_nghia.
end;

procedure Tf_nhu_y.bt_xoa_tuClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn xóa từ này!?',mtConfirmation,[mbYes, mbNo],0) = idYes then
	begin
		lb_du_lieu.items.Delete(lb_du_lieu.itemindex); //Remove selected item
		if bt_file_dl.Caption<>'0' then
			xoa_file(duong_dan_goc+'\Du lieu\DLC\'+bt_file_dl.Caption+'LDNC');
		tu_moi:=true;
		l_tst.Caption:='Tổng số từ: '+ IntToStr(lb_du_lieu.Items.Count);
		luu_tu_dien;
		if da_tim=true then
		begin
			da_tim:=false;
			cbb_tu.Text:=tu_vua_tim;
			bt_tim_kiem.Click;
		end;
	end;
end;

procedure Tf_nhu_y.cbb_tuChange(Sender: TObject);
begin
	da_tim:=False;
end;

procedure Tf_nhu_y.cbb_tuClick(Sender: TObject);
begin
	da_tim:=False;
end;

procedure Tf_nhu_y.cbb_tuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//	if key=13 then begin
//		bt_tim_kiem.Click;
//	end;
	
end;

procedure Tf_nhu_y.cbb_tuKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then begin
		bt_tim_kiem.Click;
		key:= #0;
	end;
end;

procedure Tf_nhu_y.cbb_tuSelect(Sender: TObject);
begin
	bt_tim_kiem.Click;
end;

procedure Tf_nhu_y.Chmcng1Click(Sender: TObject);
begin
	f_cham_cong.show;
end;

procedure Tf_nhu_y.cti1Click(Sender: TObject);
begin
	if Visible=False then
	begin
		Visible := true;
		Enabled:=true;
	end
	else
		Visible := false
	end;
procedure Tf_nhu_y.Dmua1Click(Sender: TObject);
begin
if f_du_mua=nil then
		Application.CreateForm(Tf_du_mua,f_du_mua);
	f_du_mua.Show;
end;

procedure Tf_nhu_y.Dn1Click(Sender: TObject);
begin
	sed_nghia.PasteFromClipboard;
	jre_nghia.PasteFromClipboard;
end;

procedure Tf_nhu_y.Edit1Change(Sender: TObject);
begin
	j:=-1;
end;

procedure Tf_nhu_y.bt_suaClick(Sender: TObject);
var
	so_dong:integer;
begin
	sua_tu:=not sua_tu;
	if sua_tu=true then
	begin // khi dang sua tu
		bt_sua.Caption:='Sửa từ';
		bt_them.Enabled := false;
		bt_xoa_tu.Enabled:=false;
	end else
	begin
		bt_sua.Enabled:=false;
		bt_sua.Caption:='Sửa >';
		//so_dong:=sed_nghia.Lines.Count;
		so_dong:=jre_nghia.Lines.Count;
		if cbb_tu.Text='' then
			sttb1.Panels[0].Text:='Bạn chưa nhập Từ'
		else
		if so_dong<1 then
			sttb1.Panels[0].Text:='Bạn chưa nhập nghĩa'
		else
		begin
			nghia:=sed_nghia.Lines[0];
			nghia:=jre_nghia.Lines[0];
			so_dong_m:=sed_nghia.Lines.Count;
			so_dong_m:=jre_nghia.Lines.Count;
			tu_moi:=true;
			ma_hoa_dl;
			lb_du_lieu.Items[lb_du_lieu.itemindex]:=dong_dl;
			luu_tu_dien;
			bt_them.Enabled := true;
		end;
	end;
end;


procedure Tf_nhu_y.bt_suaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin // dùng để hủy bỏ việc sửa từ
	if (Button=mbRight) and sua_tu then 
	begin
		sua_tu:=false;
		bt_sua.Caption:='Sửa >';
		bt_sua.Enabled:=false;
	end;
end;
function Tf_nhu_y.lenh:boolean;
begin
	Result:=sai;
	if cbb_tu.Text='chấm công' then
	begin
		f_cham_cong.show;
		Result:=dung;
	end;
	if cbb_tu.Text='ngôi sao' then
	begin
		f_quan_ly_khach_hanh.show;
		Result:=dung;
	end;
	if cbb_tu.Text='thấu kính' then
	begin
		f_quan_ly_thau_kinh.show;
		Result:=dung;
	end ;
	if cbb_tu.Text='vật tư' then
	begin
		f_quan_ly_vat_tu.show;
		Result:=dung;
	end ;
	if cbb_tu.Text='thiên xứ' then
	begin
		f_quan_ly_thien_su.show;
		Result:=dung;
	end ;
	if cbb_tu.Text='bưu phẩm' then
	begin
		f_in_to_gui_buu_pham.show;
		Result:=dung;
	end ;
	if cbb_tu.Text='file' then
	begin
		f_f.show;
		Result:=dung;
	end ;
	if cbb_tu.Text='hóa đơn' then
	begin
		f_in_hoa_don_ban_hang.show;
		Result:=dung;
	end 
	
end;
procedure Tf_nhu_y.bt_tim_kiemClick(Sender: TObject);
var
	dong,nghia_tu,tu_tra:string;
	vi_tri_dau,vi_tri_cuoi:integer;
	i:integer;
	ListItem: TListItem;
begin
	if lenh=sai then
	begin
	
		bt_xoa_tu.Enabled:=false;
		if da_tim=False then
		begin
			da_tim:=true;
		
			vi_tri_xem:=0;
			lv_tu_tim.Clear;
			tu_vua_tim:=cbb_tu.Text;
			tu_tra:= tu_vua_tim;
			sed_nghia.Lines.Clear;
			jre_nghia.Lines.Clear;
			if cb_tim_nang_cao.Checked=false then
			begin
				for i:=0 to lb_du_lieu.Items.Count-1 do  // tìm kiếm toàn bộ từ
				begin
					tu_tra:=bo_dau(tu_tra);
					tu_tra:= LowerCase(tu_tra);
					nghia_tu:=lb_du_lieu.Items[i];
					nghia_tu:=bo_dau(nghia_tu);
					nghia_tu:=LowerCase(nghia_tu);
					p:=AnsiPos(tu_tra,nghia_tu); // tim tu trong dong
					if p>0 then
					begin
						lb_to_lv_dong_tim(i);
					end;
				end;
				so_tu_tim_thay:=lv_tu_tim.Items.Count;
				l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' từ';
			end
			else
			begin  // tim kiếm tưng từ.co trong chuoi tim
				for i:=0 to lb_du_lieu.Items.Count-1 do  // tìm kiếm toàn bộ từ
				begin
					nghia_tu:=lb_du_lieu.Items[i];
	//				nghia_tu:=bo_dau(nghia_tu);
	//				nghia_tu:=LowerCase(nghia_tu);
					ty_le:=tim_tung_tu_kttt(tu_tra,nghia_tu);
					if ty_le>0 then
					begin
						lb_to_lv_dong_tim(i);
					end;
				end;
				//(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv,column.index)
				//(Sender as TCustomListView).6(@Sap_xep_so_lv,column.index;
				lv_tu_tim.CustomSort(@Sap_xep_so_lv,-6);
				so_tu_tim_thay:=lv_tu_tim.Items.Count;
				l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' từ';
			end;
		end;
		if so_tu_tim_thay>0 then
		begin
			ListItem:=lv_tu_tim.Items[vi_tri_xem];
			with ListItem do
			begin
				vi_tri_chon:=StrToInt(SubItems.Strings[4]);
			end;
			lb_du_lieu.ItemIndex:=vi_tri_chon;
			dong:=lb_du_lieu.Items[vi_tri_chon];
			vi_tri_dau:=1;
			vi_tri_cuoi:=AnsiPos('~~1',dong);
			tu:=copy(dong,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
			vi_tri_dau:=AnsiPos('~~1',dong)+3;
			vi_tri_cuoi:=AnsiPos('~~2',dong);
			dong:=copy(dong,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
			sed_nghia.Text:=StringReplace(dong,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
			sed_nghia.SelStart := 0;
			sed_nghia.Perform(EM_ScrollCaret, 0, 0);
			jre_nghia.Text:=StringReplace(dong,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
			jre_nghia.SelStart := 0;
			jre_nghia.Perform(EM_ScrollCaret, 0, 0);
			cbb_tu.Text:=tu;
			lv_tu_tim.ItemIndex:=vi_tri_xem;
			lb_du_lieu.ItemIndex:=vi_tri_chon;
			lb_du_lieu.Selected[vi_tri_chon];
			vi_tri_xem:=vi_tri_xem+1;
			if vi_tri_xem>=so_tu_tim_thay then vi_tri_xem:=0;
		end;

		if sua_tu then // huy bỏ sửa từ nếu co
		begin
			sua_tu:=false;
			bt_sua.Caption:='Sửa >';
			bt_sua.Enabled:=false;
		end;
	end;
end;
//======================================== 
procedure Tf_nhu_y.Can_vi_tri;
//var 
//	tu_tra:string;
	const offset = 25;
begin
	//if f_tu_dien.Width<300 then f_tu_dien.Width:=300;
	
	//m_nghia.Left:=5;
	//m_nghia.Top:=80;
	//m_nghia.Height:=(f_tu_dien.Height) div 2 - 80- offset;
	//m_nghia.Width:=f_tu_dien.Width -offset;//-20;

 //	Memo2.Left:=f_tu_dien.Width div 2-5;
 //	Memo2.Top:=80;
	//Memo2.Height:=(f_tu_dien.Height) div 2 -80 -offset;
	//Memo2.Width:=f_tu_dien.Width div 2-15;

//	lb_du_lieu.left:=5;
//	lb_du_lieu.Top:=(f_tu_dien.Height) div 2 -offset;//-80;
//	lb_du_lieu.Height:=(f_tu_dien.Height) div 2 - 150;
//	lb_du_lieu.Width:= f_tu_dien.Width - offset;
//	
//	Memo3.left:=5;
//	Memo3.Top:=lb_du_lieu.Top+ lb_du_lieu.Height;
//	Memo3.Height:= 90;
//	Memo3.Width:= f_tu_dien.Width - offset;
end;
//======================================== 
procedure Tf_nhu_y.lb_du_lieuClick(Sender: TObject);
var
	dong,tu_tra,nghia_tu:string;
	vi_tri:integer;
	co_tu:bool;
begin
	sed_nghia.Lines.Clear;
	jre_nghia.Lines.Clear;
	dong:=lb_du_lieu.Items[lb_du_lieu.ItemIndex];
	dong := StringReplace(dong,'``',Chr($0D)+Chr($0A), [rfReplaceAll]) ;
	vi_tri:=AnsiPos('~~1',dong);
	nghia_tu:=copy(dong,vi_tri+2,length(dong)- vi_tri+2);
	tu_tra:=copy(dong,1,vi_tri-1);
	//dong:= StringReplace(
	cbb_tu.Text:= tu_tra;
	co_tu:=false;
	for vi_tri := 0 to cbb_tu.Items.Count do
	if cbb_tu.Items[vi_tri]=tu_tra then
	begin
		co_tu:=true;
		break;
	end;
	if (not co_tu) then
		cbb_tu.Items.Add(Tu_tra) ;
	sed_nghia.Lines.Add(nghia_tu);
	sed_nghia.SelStart := 0;
	sed_nghia.Perform(EM_ScrollCaret, 0, 0);
	jre_nghia.Lines.Add(nghia_tu);
	jre_nghia.SelStart := 0;
	jre_nghia.Perform(EM_ScrollCaret, 0, 0);
	bt_sua.Enabled:=true;
	sua_tu:=false;
	bt_sua.Caption:='Sửa >';
	bt_them.Enabled:=true;
end;

procedure Tf_nhu_y.mm_quan_ly_tien_noClick(Sender: TObject);
begin
	f_quan_ly_tien_no.show;
end;

procedure Tf_nhu_y.mm_tu_ghepClick(Sender: TObject);
begin
	f_tu_ghep.Show;
end;

procedure Tf_nhu_y.ppm1_khoi_dong_cung_winClick(Sender: TObject);
begin
	if ppm1_khoi_dong_cung_win.Checked=true then
	begin
		 ppm1_khoi_dong_cung_win.Checked:=false;
	end else
	begin
		 ppm1_khoi_dong_cung_win.Checked:=true;
	end;
	Dat_tu_khoi_dong(ParamStr(0), 'LDNam Từ Điển',ppm1_khoi_dong_cung_win.Checked);
	t_ghi_ini.Enabled:=true;
end;

procedure Tf_nhu_y.ppm_thoatClick(Sender: TObject);
begin
	Luu_ini;
	thoat:=true;
	Application.Terminate; // đóng ứng dụng tuần tự
end;

procedure Tf_nhu_y.p_file_dlClick(Sender: TObject);
begin
	if bt_file_dl.Caption<>'0' then
	if tai_clipboard(duong_dan_goc+'\Du lieu\DLC\'+bt_file_dl.Caption+'LDNC')=true then
	begin
		sttb1.Panels[0].Text:='Tải dữ liệu thành công';
		tm1.Enabled:=true;
	end;
end;

procedure Tf_nhu_y.Qunlcucsng1Click(Sender: TObject);
begin
	//f_quan_ly_cuoc_song.show;
end;

procedure Tf_nhu_y.Qunlfile1Click(Sender: TObject);
begin
	f_f.show;
end;

procedure Tf_nhu_y.Qunlhnhnh1Click(Sender: TObject);
begin
  f_ha.show;
end;

procedure Tf_nhu_y.Qunlkhchhng1Click(Sender: TObject);
begin
	f_quan_ly_khach_hanh.Show;
end;

procedure Tf_nhu_y.Qunlnhng1Click(Sender: TObject);
begin
	f_quan_ly_don_hang.show;
end;

procedure Tf_nhu_y.Qunlnhng2Click(Sender: TObject);
begin
	f_in_bao_gia.show;
end;

procedure Tf_nhu_y.Qunlthinx1Click(Sender: TObject);
begin
	f_quan_ly_thien_su.show;
end;

procedure Tf_nhu_y.QunlThuKnh1Click(Sender: TObject);
begin
	f_quan_ly_thau_kinh.show;
end;

procedure Tf_nhu_y.QunlVtT1Click(Sender: TObject);
begin
	f_quan_ly_vat_tu.show;
end;

procedure Tf_nhu_y.sed_nghiaKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
	if key = VK_TAB then
	MessageDlg('Tab key pressed',mtInformation,[mbOK],0);
end;

procedure Tf_nhu_y.sed_nghiaKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = ^V then
	begin
		sed_nghia.PasteFromClipboard;
		Key := #0;
	end;	
end;

procedure Tf_nhu_y.splt_1Moved(Sender: TObject);
begin                                             
//	if not changing then begin
//		dirty:=true;
//		// caption:='*'+inttostr(dirty_count);
//		inc(dirty_count);
//		end;
end;

procedure Tf_nhu_y.m_cong_ty_ldnamClick(Sender: TObject);
begin
	f_cong_ty_ldnam.show;
end;

procedure Tf_nhu_y.m_in_to_gui_buu_phamClick(Sender: TObject);
begin
	f_in_to_gui_buu_pham.show;
end;

procedure Tf_nhu_y.m_nghia_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key = Ord('A')) and (ssCtrl in Shift) then
//	 begin
//		 m_nghia.SelectAll;
//		 Key := 0;
//	 end;
	if key = VK_TAB then
	MessageDlg('Tab key pressed',mtInformation,[mbOK],0);
end;

procedure Tf_nhu_y.m_nghia_1KeyPress(Sender: TObject; var Key: Char);
begin
	if Key = ^A then
	begin
		sed_nghia.SelectAll;
		Key := #0;
	end;
if Key = #9 then
	begin
		sed_nghia.SelectAll;
		Key := #0;
	end;	
end;

procedure Tf_nhu_y.m_nghia_1KeyUp(Sender: TObject; var Key: Word;
	Shift: TShiftState);
var
vi_tri_con_tro:integer;
begin
if Key = 9 then
	begin
		//vi_tri_con_tro:=sed_nghia.SelStart;
		//m_nghia.Text := m_nghia.Text + #9;
		//m_nghia.SetSelText(#9);
		//sed_nghia.SelStart := vi_tri_con_tro+1;//Length(m_nghia.Text);
		vi_tri_con_tro:=jre_nghia.SelStart;
		//m_nghia.Text := m_nghia.Text + #9;
		//m_nghia.SetSelText(#9);
		jre_nghia.SelStart := vi_tri_con_tro+1;//Length(m_nghia.Text);
	end;
end;

procedure Tf_nhu_y.m_quan_ly_cong_viecClick(Sender: TObject);
begin
	f_quan_ly_cong_viec.show;
end;

procedure Tf_nhu_y.m_quan_ly_diem_ren_luyenClick(Sender: TObject);
begin
	f_ha.show;
end;

procedure Tf_nhu_y.m_quan_ly_tai_chinhClick(Sender: TObject);
begin
	f_quan_ly_tai_chinh.show;
end;
procedure Tf_nhu_y.N3Click(Sender: TObject);
begin
	f_tinh_dien.show;
end;

procedure Tf_nhu_y.nhtongitrintr1Click(Sender: TObject);
begin
	f_tinh_toan.show;
end;

//========================================
procedure Tf_nhu_y.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text:='';
  tm1.Enabled :=false;
end;

procedure Tf_nhu_y.tm2Timer(Sender: TObject);
var
	dong,tu_tra:string;
	vi_tri:integer;
begin
	tm2.Enabled:=False;
	if FileExists(duong_dan_goc+'\Du lieu\Tu dien LDN.TDLDN')=false then
		luu_tu_dien;
	lb_du_lieu.Items.LoadFromFile(duong_dan_goc+'\Du lieu\Tu dien LDN.TDLDN',TEncoding.UTF8);
	l_tst.Caption:='Tổng số từ: '+ IntToStr(lb_du_lieu.Items.Count);
	
	j:=-1;
	While j<lb_du_lieu.Items.Count-1 Do
	begin
		j:=j+1;
		dong:=lb_du_lieu.Items[j];
		vi_tri:=AnsiPos(phan_trang+'1',dong);

		tu_tra:=copy(dong,1,vi_tri-1);
		cbb_tu.Items.Add(Tu_tra);
	end;
end;

//======================================== 
procedure Tf_nhu_y.lb_to_lv_dong_tim(vi_tri:integer);
begin
		dong_dl:=lb_du_lieu.Items[vi_tri];
		giai_ma_dl;
		li_tam:=lv_tu_tim.Items.Add;
		with li_tam do
		begin
			Caption:= tu;
			SubItems.Add(nghia);
			SubItems.Add(du_lieu);
			SubItems.Add(hinh);
			SubItems.Add(lien_ket);
			SubItems.Add(IntToStr(vi_tri));
			if cb_tim_nang_cao.Checked=true then SubItems.Add(IntToStr(ty_le));
			Checked:=False;
		end;
end;
//======================================== 
procedure Tf_nhu_y.chon_lb;
begin
	sed_nghia.Lines.Clear;
	jre_nghia.Lines.Clear;
	dong_dl:=lb_du_lieu.Items[lb_du_lieu.ItemIndex];
	giai_ma_dl;
	cbb_tu.Text:=tu;
	sed_nghia.Text:=StringReplace(nghia,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
	jre_nghia.Text:=StringReplace(nghia,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
	bt_file_dl.Caption:='0';
	if du_lieu<>'' then
	begin
		bt_file_dl.Caption:='D'+du_lieu;
	end
	else
  begin
		bt_file_dl.Caption:='0';
  end;
end;
//======================================== 
procedure Tf_nhu_y.chon_lb_tim;
begin
	sed_nghia.Lines.Clear;
	jre_nghia.Lines.Clear;
	dong_dl:=lb_du_lieu.Items[lb_du_lieu.ItemIndex];
	giai_ma_dl;
	sed_nghia.Text:=StringReplace(nghia,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
	jre_nghia.Text:=StringReplace(nghia,'``',Chr($0D)+Chr($0A), [rfReplaceAll]);
end;
//========================================
procedure Tf_nhu_y.tm_lkTimer(Sender: TObject);
var X:integer;
phim:string;
begin
	For X:=0 to 255 do
	begin
		if ((GetAsyncKeyState($0+x) and 1) = 1) then
		begin
			if (x<>1) then //if we want to find the ascii code instead:
			begin
			//m_nghia.Lines.Add(inttostr(x)+'$·%&');
			//end;
				//for y:=0 to listview1.items.Count-1 do //log the key strokes
				//begin
					 //if x=strtoint(listview1.items.item[y].caption) then
					 //memo3.text:=memo3.Text + (listview1.items.item[y].subitems[0]);
				phim:= chr(x);
				memo3.text := memo3.Text + IntToStr(x) + ' = ' +  phim;
			end;
		end;
	end;
end;
procedure Tf_nhu_y.tm_phutTimer(Sender: TObject);
//	dat_hinh_nen(duong_dan_goc+'Du lieu\Hinh anh\e1.jpg',wsCenter);
//	hn: TWallpaperOpt;
//	ActiveDesktop: IActiveDesktop;
begin
//	hn.dwSize := SizeOf(hn);
	inc(chn);
	if chn=2 then
	begin
		chn:=0;
		//PicPath := duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg';
	end
	else
	begin
		//PicPath := duong_dan_goc+'Du lieu\Hinh anh\e1.jpg';
	end;
	
//	hn.dwStyle:=WPSTYLE_CENTER;
//	ActiveDesktop.SetWallpaperOptions(hn , 0);
	//SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, Pointer(PicPath), SPIF_SENDWININICHANGE);
end;

procedure Tf_nhu_y.TrayIcon1Click(Sender: TObject);
begin
if Showing then
	Hide
else
	Show;
	{if Visible=False then
	begin
		Visible := true;
	end
	else
		Visible := false }
end;

procedure Tf_nhu_y.t_doc_iniTimer(Sender: TObject);
begin
	t_doc_ini.Enabled:=False;
	Tai_ini;
end;

procedure Tf_nhu_y.t_ghi_iniTimer(Sender: TObject);
begin
	t_ghi_ini.Enabled:=False;
	Luu_ini;
end;
procedure Tf_nhu_y.Xemtrcbogi1Click(Sender: TObject);
begin
	f_xem_truoc_bao_gia.show;
end;

//========================================
procedure Tf_nhu_y.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	//action:=caNone;
//	Dong_key;
	//if tu_moi then
	//begin
	 //	if MessageDlg('Được giới thiệu từ mới. Lưu lại?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
		//then
			//begin
				//lb_du_lieu.Items.SaveToFile('Slovar.txt',TEncoding.UTF8);
			//end;
		//end;
		//if not thoat then
		//begin
			Action := caNone;
			Hide;
			//Visible := False;
		//end;
		////Application.Minimize;      // Will hide dialogs and popup windows as well (this demo has none)
		////TextTrayIcon1.HideMainForm;
	end;

procedure Tf_nhu_y.Button1Click(Sender: TObject);
begin
			mp_1.FileName:=duong_dan_goc+'\Du lieu\Nhac\10 phut moi ngay biet on.wma';
    mp_1.Open;
		mp_1.Play;
end;

procedure Tf_nhu_y.Button2Click(Sender: TObject);
var 
	j:integer;
begin
	//luu_clipboard('D:\D1015LDNC');
		With TButton(sender) do
	if hien_diem_nhan=sai then
  begin
		hien_diem_nhan:=true;
		highlightlist.assign(keywords.lines);
		{trim any leading & trailing blanks}
		with highlightlist do for j:=0 to count-1 do strings[j]:=trim(strings[j]);
		highlightlist.sort;  {for faster lookups}
		Button2.font.Color:=highlightcolor;
  end
  else
  begin  {reset highlighting}
    hien_diem_nhan:=false;
		Button2.font.color:=clblack;
  end;
	Button2.invalidate;
	jre_nghia.invalidate; {update the richedit contro }
end;
procedure Tf_nhu_y.Button3Click(Sender: TObject);
begin
	Button3.Hint:=so_ra_chu(strtoint64(cbb_tu.Text),sai,dung);
end;

//========================================
procedure Tf_nhu_y.LDNam1Click(Sender: TObject);
begin
	//f_ldnam.show;
end;

procedure Tf_nhu_y.LDNam2Click(Sender: TObject);
begin
	f_ldnam.show;
end;

procedure Tf_nhu_y.Luu_ini;
var
	IniFile : TIniFile;
	K:integer;
begin
	IniFile := TIniFile.Create(duong_dan_goc+'\Du lieu\Thiet lap.LDNini');
	IniFile.WriteBool('Thiet_lap','Khoi_dong_cung_win',f_nhu_y.ppm1_khoi_dong_cung_win.Checked);
	IniFile.WriteInteger('Thiet_lap','f_goc_trai',f_nhu_y.Left);
	IniFile.WriteInteger('Thiet_lap','f_goc_tren',f_nhu_y.Top);
	IniFile.WriteInteger('Thong_so','Size_font',jre_nghia.Font.size);
	IniFile.WriteInteger('Thong_so','Ten_file_dl',ten_file_dl);
	IniFile.WriteInteger('Thong_so','Ten_file_dl_nh',ten_file_dl_ngan_hang);
	for K := 0 to 4 do
	begin
		IniFile.WriteInteger('Thong_so_thu','Rong_cot'+IntToStr(K),f_quan_ly_tai_chinh.lv_bang_thu.Columns[K].Width);
	end;
	for K := 0 to 4 do
	begin
		IniFile.WriteInteger('Thong_so_chi','Rong_cot'+IntToStr(K),f_quan_ly_tai_chinh.lv_bang_chi.Columns[K].Width);
	end;
	for K := 0 to 5 do
	begin
		IniFile.WriteInteger('Thong_so_tim','Rong_cot'+IntToStr(K),lv_tu_tim.Columns[K].Width);
	end;
	//IniFile.WriteString('File','Ten_dsds',ten_dsds);
	//Inifile.WriteInteger('Thong_so','vi_tri_dsds',vi_tri_dsds);
	//Inifile.WriteInteger('Thong_so','vi_tri_ds',vi_tri_ds);
	//IniFile.WriteInteger('Thong_so','vi_tri_play',vi_tri_play);
	IniFile.Free;
end;
//========================================
procedure Tf_nhu_y.Tai_ini;
var
	IniFile : TIniFile;
	K:Integer;
begin
	if FileExists(duong_dan_goc+'\Du lieu\Thiet lap.LDNini')=true then
	begin
		IniFile := TIniFile.Create(duong_dan_goc+'\Du lieu\Thiet lap.LDNini');
		f_nhu_y.ppm1_khoi_dong_cung_win.Checked:=IniFile.ReadBool('Options','Khoi_dong_cung_win',TRUE);
		f_nhu_y.Left:=IniFile.ReadInteger('Thiet_lap','f_goc_trai',Left);
		f_nhu_y.Top:=IniFile.ReadInteger('Thiet_lap','f_goc_tren',Top);
		//m_nghia.Font.Size:=IniFile.ReadInteger('Thong_so','Size_font',9);
                jre_nghia.Font.Size:=IniFile.ReadInteger('Thong_so','Size_font',9);
		ten_file_dl:=IniFile.ReadInteger('Thong_so','Ten_file_dl',1000);
		ten_file_dl_ngan_hang:=IniFile.ReadInteger('Thong_so','Ten_file_dl_nh',1000);
	 //	ten_dsds:=inifile.ReadString('File','Ten_dsds',ten_dsds);
		//vi_tri_dsds:=IniFile.ReadInteger('Thong_so','vi_tri_dsds',vi_tri_dsds);
		//vi_tri_ds:=IniFile.ReadInteger('Thong_so','vi_tri_ds',vi_tri_ds);
		//vi_tri_play:=IniFile.ReadInteger('Thong_so','vi_tri_play',vi_tri_play);
		for K := 0 to 4 do
		begin
			f_quan_ly_tai_chinh.lv_bang_thu.Columns[K].Width:=IniFile.ReadInteger('Thong_so_thu','Rong_cot'+IntToStr(K),100);
		end;
		for K := 0 to 4 do
		begin
			f_quan_ly_tai_chinh.lv_bang_chi.Columns[K].Width:=IniFile.ReadInteger('Thong_so_chi','Rong_cot'+IntToStr(K),100);
		end;
		for K := 0 to 5 do
		begin
			lv_tu_tim.Columns[K].Width:=IniFile.ReadInteger('Thong_so_tim','Rong_cot'+IntToStr(K),100);
		end;
		IniFile.Free;
	end;
end;
procedure Tf_nhu_y.tm_1sTimer(Sender: TObject);
var
	tg:string;
	//a,b,c:word;
	thu:string;
	na,ta,naa:word;
begin
	//l2.Caption:=IntToStr(tg_dem_nguoc);//+IntToStr(f_quan_ly_cuoc_song.tm_bao.Interval div 1000;
	//thu_now('00');
 //	l2.Caption:= FormatDateTime('hh:nn:ss', tg_dem_nguoc / SecsPerDay);
 //	Label2.Caption:=noi_dung_bao;
	tg:=datetimetostr(DateOf((7)));
	thu:=thu_now();
	l_tg.Caption:=thu;
	na:=1;ta:=7;naa:=2016;
	convertSolar2Lunar(na,ta,naa,7);
	
	//DecodeDateWeek(now,a,b,c);
	tg:=TimeToStr(now);
	if tg_am_thanh>0 then
		tg_am_thanh:=tg_am_thanh-1;
	{if tg='5:30:00 AM' then
	begin
		mp_1.FileName:=duong_dan_goc+'\Du lieu\Nhac\10 phut moi ngay biet on.wma';
		mp_1.Open;
		mp_1.Play;
		che_do_am_thanh:=am_thanh_bat;
		tg_am_thanh:=600;
	end;
	if tg='5:42:00 AM' then
	begin
		mp_1.FileName:=duong_dan_goc+'\Du lieu\Nhac\Destiny Symphony - Beethoven.wma';
		mp_1.Open;
		mp_1.Play;
		che_do_am_thanh:=am_thanh_bat;          
		tg_am_thanh:=1200;
	end;
	if tg='10:01:00 PM' then
	begin
		mp_1.FileName:=duong_dan_goc+'\Du lieu\Nhac\Lap bang can doi cho - nhan.wma';
		mp_1.Open;
		mp_1.Play;
		che_do_am_thanh:=am_thanh_bat;
		tg_am_thanh:=120;
	end;  }
	if (che_do_am_thanh=am_thanh_bat) then
	begin
		if (mp_1.Position= mp_1.Length)and(tg_am_thanh>0) then
		begin
				mp_1.Play;
		end;
		if (mp_1.Position= mp_1.Length)and(tg_am_thanh=0) then
		begin
				che_do_am_thanh:=am_thanh_tat;
				mp_1.close;
		end;
	end;


end;

procedure Tf_nhu_y.tm_2Timer(Sender: TObject);
begin
	tm_2.Enabled:=false;
//	m_quan_ly_cong_viec.Click;
//	tm_2.Enabled:=false;
//	m_quan_ly_tai_chinh.Click;
//	tm_2.Enabled:=false;
end;

procedure Tf_nhu_y.tm_dinh_ky_luu_iniTimer(Sender: TObject);
begin
	t_ghi_ini.Enabled:=true;
end;

//========================================
procedure Tf_nhu_y.ma_hoa_dl;
var
	i:integer;
begin
	for i:=1 to so_dong_m-1 Do
	begin
		//nghia:=nghia+phan_dong+m_nghia.Lines[i];
								nghia:=nghia+phan_dong+jre_nghia.Lines[i];
	end;
	dong_dl:=cbb_tu.Text+'~~1'+nghia+'~~2'+
								du_lieu+'~~3'+hinh+'~~4'+lien_ket+'~~5';
end;
procedure Tf_nhu_y.Mi1Click(Sender: TObject);
begin

end;

//========================================
procedure Tf_nhu_y.giai_ma_dl;
var
	vi_tri_dau, vi_tri_cuoi:integer;
begin
	vi_tri_dau:=1;
	vi_tri_cuoi:=AnsiPos('~~1',dong_dl);
	tu:=copy(dong_dl,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
	vi_tri_dau:=vi_tri_cuoi+3;
	vi_tri_cuoi:=AnsiPos('~~2',dong_dl);
	nghia:=copy(dong_dl,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
	vi_tri_dau:=vi_tri_cuoi+3;
	vi_tri_cuoi:=AnsiPos('~~3',dong_dl);
	du_lieu:=copy(dong_dl,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
	vi_tri_dau:=vi_tri_cuoi+3;
	vi_tri_cuoi:=AnsiPos('~~4',dong_dl);
	hinh:=copy(dong_dl,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
	vi_tri_dau:=vi_tri_cuoi+3;
	vi_tri_cuoi:=AnsiPos('~~5',dong_dl);
	lien_ket:=copy(dong_dl,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
end;
//======================================== 
procedure Tf_nhu_y.Khochhmnay1Click(Sender: TObject);
begin
	if f_ke_hoach_hom_nay=nil then
		Application.CreateForm(Tf_ke_hoach_hom_nay,f_ke_hoach_hom_nay);
	f_ke_hoach_hom_nay.Show;
end;

//========================================
end.


