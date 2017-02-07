unit f_quan_ly_tai_chinh_f;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics, xu_ly_du_lieu,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
	Vcl.ExtCtrls,Vcl.Grids, f_nhu_y_f, LDNam_sys,khai_bao_tu_dien,
	f_chi_tiet_du_chi_f, Vcl.Menus,f_truc_thuoc_f
	,System.UITypes;

type
	Tf_quan_ly_tai_chinh = class(TForm)
		sttb1: TStatusBar;
		ttp_ngay_du_tinh: TDateTimePicker;
		Panel1: TPanel;
		tm1: TTimer;
		GroupBox1: TGroupBox;
		l_tien_hien_tai: TLabel;
		lb_so_tien: TListBox;
		lb_thu: TListBox;
		lv_bang_thu: TListView;
		lv_bang_chi: TListView;
		lb_chi: TListBox;
		l_ten: TLabel;
		cbb_ten_khoan: TComboBox;
		cbb_tien_thu: TComboBox;
		l_so_tien: TLabel;
		bt_them_thu: TButton;
		bt_xoa: TButton;
		bt_sua: TButton;
		cbb_truc_thuoc_thu: TComboBox;
		m_mo_ta: TMemo;
		pct_1: TPageControl;
		ts_thu: TTabSheet;
		ts_chi: TTabSheet;
		Panel2: TPanel;
		p_du_lieu: TPanel;
		p_chi_tiet: TPanel;
		p_nut_nhan: TPanel;
		cbb_ngay_cn: TComboBox;
		Label1: TLabel;
		Label2: TLabel;
		Label3: TLabel;
    ts_du_chi: TTabSheet;
    Panel3: TPanel;
    lv_du_chi: TListView;
    lb_du_chi: TListBox;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Splitter2: TSplitter;
    Timer1: TTimer;
    bt_chi: TButton;
    ts_su_thu: TTabSheet;
    Panel8: TPanel;
    lv_du_thu: TListView;
    lb_du_thu: TListBox;
    l_tong_thu: TLabel;
    l_tong_chi: TLabel;
    l_tong: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    bt_thong_ke: TButton;
    MainMenu1: TMainMenu;
    mm_quan_ly_khoan_tu_dong: TMenuItem;
    mm_quan_ly_tai_khoan_ngan_hang: TMenuItem;
    mm_bao_cao_tai_chinh: TMenuItem;
		procedure FormCreate(Sender: TObject);
		procedure tm1Timer(Sender: TObject);
		procedure sap_xep_sg(Grid: TStringGrid; SortCol: integer);
		procedure chon_lb_thu;
		procedure luu_lv(AListView: TListView; sFileName: string);
		procedure tai_lv(AListView: TListView; sFileName: string);
		procedure l_tien_hien_taiDblClick(Sender: TObject);
		procedure e_tien_hien_taiKeyPress(Sender: TObject; var Key: Char);
		procedure GroupBox1Click(Sender: TObject);
		procedure e_tien_hien_taiDblClick(Sender: TObject);
		procedure bt_them_thuClick(Sender: TObject);
		procedure lv_bang_thuColumnClick(Sender: TObject; Column: TListColumn);
		procedure lv_bang_thuMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: integer);
		procedure bt_xoaClick(Sender: TObject);
		procedure lv_bang_thuCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: integer; var Compare: integer);
		procedure pct_1Change(Sender: TObject);
		procedure lv_bang_chiColumnClick(Sender: TObject; Column: TListColumn);
		procedure lv_bang_chiCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: integer; var Compare: integer);
		procedure lv_bang_chiMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: integer);
		procedure tinh_tien_du;
		procedure tinh_tong_tien;
    procedure bt_dong_chi_tiet_khoanClick(Sender: TObject);
    procedure lv_du_chiCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: Integer; var Compare: Integer);
    procedure lv_du_chiColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv_du_chiMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
		procedure them_dl(them: byte);
    procedure bt_suaClick(Sender: TObject);
    procedure lv_du_chiDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bt_chiClick(Sender: TObject);
    procedure lv_du_thuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lv_du_thuCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lv_du_thuColumnClick(Sender: TObject; Column: TListColumn);
    procedure bt_thong_keClick(Sender: TObject);
    procedure mm_quan_ly_tai_khoan_ngan_hangClick(Sender: TObject);
    procedure cbb_truc_thuoc_thuDblClick(Sender: TObject);
	private
		{ Private declarations }
		croissant: boolean;
		ColumnToSort: integer;
		xep_chi: boolean;
		xep_du_chi:boolean;
		cot_xep_chi: integer;
		cot_xep_du_chi: integer;
		xep_du_thu:boolean;
		cot_xep_du_thu: integer;
	public
		{ Public declarations }
		cong_viec_moi: bool;
		j: integer;
		so_dong, i: integer;
		trung_lap: bool;
		Giai_tri: string;
		dong_dl: string;
		dong_mo_ta_cv: string;
		dong_mo_ta: string;
		vi_tri: integer;
		ten_cv: string;
	end;

var
	f_quan_ly_tai_chinh: Tf_quan_ly_tai_chinh;
	ngay, thang, nam: word; // khai bao ngay thang nam
	gio, phut, giay, m_giay: word; // khai bao gio phut giay
	chon: string;

const
	Msg1 = 'File "%s" does not exist!';
	Msg2 = '"%s" is not a ListView file!';

implementation

{$R *.dfm}

uses f_quan_ly_tai_khoan_ngan_hang_f.dcu;

procedure Tf_quan_ly_tai_chinh.luu_lv(AListView: TListView; sFileName: string);
var
	idxItem, idxSub, IdxImage: integer;
	F: TFileStream;
	pText: PChar;
	sText: string;
	W, ItemCount, SubCount: word;
	MySignature: array [0 .. 2] of Char;
begin
	// Initialization
	with AListView do
	begin
		ItemCount := 0;
		SubCount := 0;
		// ****
		MySignature := '~~';
		// ListViewFile
		F := TFileStream.Create(sFileName, fmCreate or fmOpenWrite);
		F.Write(MySignature, SizeOf(MySignature));

		if Items.Count = 0 then
			// List is empty
			ItemCount := 0
		else
			ItemCount := Items.Count;
		F.Write(ItemCount, SizeOf(ItemCount));

		if Items.Count > 0 then
		begin
			for idxItem := 1 to ItemCount do
			begin
				with Items[idxItem - 1] do
				begin
					// Save subitems count
					if SubItems.Count = 0 then
						SubCount := 0
					else
						SubCount := SubItems.Count;
					F.Write(SubCount, SizeOf(SubCount));
					// Save ImageIndex
					IdxImage := ImageIndex;
					F.Write(IdxImage, SizeOf(IdxImage));
					// Save Caption
					sText := Caption;
					W := Length(sText);
					pText := StrAlloc(Length(sText) + 1);
					StrPLCopy(pText, sText, Length(sText));
					F.Write(W, SizeOf(W));
					F.Write(pText^, W);
					StrDispose(pText);
					if SubCount > 0 then
					begin
						for idxSub := 0 to SubItems.Count - 1 do
						begin
							// Save Item's subitems
							sText := SubItems[idxSub];
							W := Length(sText);
							pText := StrAlloc(Length(sText) + 1);
							StrPLCopy(pText, sText, Length(sText));
							F.Write(W, SizeOf(W));
							F.Write(pText^, W);
							StrDispose(pText);
						end;
					end;
				end;
			end;
		end;
		F.Free;
	end;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.tai_lv(AListView: TListView; sFileName: string);
var
	F: TFileStream;
	idxItem, IdxSubItem, IdxImage: integer;
	W, ItemCount, SubCount: word;
	pText: PChar;
	PTemp: PChar;
	MySignature: array [0 .. 2] of Char;
	sExeName: string;
begin
	with AListView do
	begin
		ItemCount := 0;
		SubCount := 0;

		sExeName := ExtractFileName(sFileName);

		if not FileExists(sFileName) then
		begin
			MessageBox(Handle, PChar(Format(Msg1, [sExeName])), 'I/O Error',
				MB_ICONERROR);
			Exit;
		end;

		F := TFileStream.Create(sFileName, fmOpenRead);
		F.Read(MySignature, SizeOf(MySignature));

		if MySignature <> '~~' then
		begin
			MessageBox(Handle, PChar(Format(Msg2, [sExeName])), 'I/O Error',
				MB_ICONERROR);
			Exit;
		end;

		F.Read(ItemCount, SizeOf(ItemCount));
		Items.Clear;

		for idxItem := 1 to ItemCount do
		begin
			with Items.Add do
			begin
				// Read imageindex
				F.Read(SubCount, SizeOf(SubCount));
				// Read imageindex
				F.Read(IdxImage, SizeOf(IdxImage));
				ImageIndex := IdxImage;
				// Read the Caption
				F.Read(W, SizeOf(W));
				pText := StrAlloc(W + 1);
				PTemp := StrAlloc(W + 1);
				F.Read(PTemp^, W);
				StrLCopy(pText, PTemp, W);
				Caption := StrPas(pText);
				StrDispose(PTemp);
				StrDispose(pText);
				if SubCount > 0 then
				begin
					for IdxSubItem := 1 to SubCount do
					begin
						F.Read(W, SizeOf(W));
						pText := StrAlloc(W + 1);
						PTemp := StrAlloc(W + 1);
						F.Read(PTemp^, W);
						StrLCopy(pText, PTemp, W);
						Items[idxItem - 1].SubItems.Add(StrPas(pText));
						StrDispose(PTemp);
						StrDispose(pText);
					end;
				end;
			end;
		end;

		F.Free;
	end;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.l_tien_hien_taiDblClick(Sender: TObject);
begin
//	e_tien_hien_tai.Left := l_tien_hien_tai.Left - 3;
//	e_tien_hien_tai.Visible := true;
//	e_tien_hien_tai.Width := l_tien_hien_tai.Width + 6;
//	l_tien_hien_tai.Visible := False;
//	e_tien_hien_tai.Text := l_tien_hien_tai.Caption;
//	e_tien_hien_tai.SetFocus;
end;

procedure Tf_quan_ly_tai_chinh.pct_1Change(Sender: TObject);
begin
	if pct_1.TabIndex = 1 then
	begin
		l_ten.Caption := 'Khoản chi';
		chon := 'c';
		bt_chi.Visible:=sai;
	end
	else if pct_1.TabIndex = 0 then
	begin
		l_ten.Caption := 'Khoản thu';
		chon := 't';
		bt_chi.Visible:=sai;
	end
	else if pct_1.TabIndex = 2 then
	begin
		l_ten.Caption := 'Khoản dự chi';
		chon := 'd';
		bt_chi.Visible:=dung;
		bt_chi.Caption:='Chi';
		bt_chi.Enabled:=sai;
	end
	else if pct_1.TabIndex = 3 then
	begin
		l_ten.Caption := 'Khoản dự thu';
		chon := 'dt';
		bt_chi.Visible:=dung;
		bt_chi.Caption:='Thu';
		bt_chi.Enabled:=sai;
	end;
  bt_sua.Enabled:=false;
end;

procedure Tf_quan_ly_tai_chinh.mm_quan_ly_tai_khoan_ngan_hangClick(Sender: TObject);
begin
	f_quan_ly_tai_khoan_ngan_hang.show;
end;

//========================================

// ========================================
procedure Tf_quan_ly_tai_chinh.FormCreate(Sender: TObject);
begin
	duong_dan_goc := extractfilepath(application.ExeName);
	//---------------------------------------- 
	Tao_thu_muc(duong_dan_goc + '\Du lieu');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\Nhac');
	lb_luu_file(lb_so_tien,duong_dan_goc + '\Du lieu\DL tien.LDN');
	lb_luu_file(lb_thu,duong_dan_goc + '\Du lieu\DL thu.LDN');
	lb_luu_file(lb_chi,duong_dan_goc + '\Du lieu\DL chi.LDN');
	lb_luu_file(lb_du_chi,duong_dan_goc + '\Du lieu\DL du chi.LDN');
	lb_luu_file(lb_du_thu,duong_dan_goc + '\Du lieu\DL du thu.LDN');
	//---------------------------------------- 
	if lb_lv(lb_thu,lv_bang_thu,4)=sai then 
	begin
		lb_cu__moi(lb_thu,duong_dan_goc + '\Du lieu\DL thu.LDN');
		lb_lv(lb_thu,lv_bang_thu,4)
	end;
	if lb_lv(lb_chi,lv_bang_chi,4)=sai then 
	begin
		lb_cu__moi(lb_chi,duong_dan_goc + '\Du lieu\DL chi.LDN');
		lb_lv(lb_chi,lv_bang_chi,4)
	end;
	if lb_lv(lb_du_chi,lv_du_chi,4)=sai then 
	begin
		lb_cu__moi(lb_du_chi,duong_dan_goc + '\Du lieu\DL du chi.LDN');
		lb_lv(lb_du_chi,lv_du_chi,4)
	end;
	lb_lv(lb_du_thu,lv_du_thu,4);
	
	j := -1;
	pct_1Change(Sender);
	ttp_ngay_du_tinh.date := date;
	if lb_so_tien.ItemIndex < 0 then
		lb_so_tien.Items.Add('100.000');
	l_tien_hien_tai.Caption := lb_so_tien.Items[0];
	tinh_tien_du;
	tinh_tong_tien;
end;

procedure Tf_quan_ly_tai_chinh.GroupBox1Click(Sender: TObject);
begin

end;

// ========================================
procedure Tf_quan_ly_tai_chinh.lv_bang_chiColumnClick(Sender: TObject;
	Column: TListColumn);
begin
	if Column.Index = -1 then
		Exit;
	xep_chi := not xep_chi;
	cot_xep_chi := Column.Index;
	if (AnsiPos('Ngày chi', Column.Caption) > 0) then
	begin
		if xep_chi then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else if AnsiPos('Số tiền', Column.Caption) > 0 then
	begin
		if xep_chi then
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
	end
	else
		(Sender as TCustomListView).AlphaSort;
	lv_lb(lv_bang_chi,lb_chi,4,duong_dan_goc + '\Du lieu\DL chi.LDN');
end;

procedure Tf_quan_ly_tai_chinh.lv_bang_chiCompare(Sender: TObject;
	Item1, Item2: TListItem; Data: integer; var Compare: integer);
var
	ix: integer;
begin
	if xep_chi then
		if cot_xep_chi = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := cot_xep_chi - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if cot_xep_chi = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := cot_xep_chi - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_quan_ly_tai_chinh.lv_bang_chiMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
	if lv_bang_chi.ItemIndex = -1 then
		Exit;
	bt_sua.Enabled:=true;
	lb_chi.ItemIndex := lv_bang_chi.ItemIndex+1;
	lb_chi.Selected[lb_chi.ItemIndex];
	chon_lb_thu;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.lv_bang_thuColumnClick(Sender: TObject;
	Column: TListColumn);
begin
	// if(lv_bang_thu.Columns.Insert()
	// Exit;
	if Column.Index = -1 then
		Exit;
	croissant := not croissant; // inversion du précédent ordre de tri
	ColumnToSort := Column.Index; // Quel colonne est à trier ?
	// Ensuite on détermine quel est le type de colonne à trier:
	// on peut aussi les déterminer en spécifiant un tag particulier dans chaque colonne
	if (AnsiPos('Ngày thu', Column.Caption) > 0) then
	begin
		if croissant then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else
		// if (Ansipos('Dự tính',Column.Caption)>0)
		// then
		// begin
		// if croissant
		// then (Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang,column.index)
		// else (Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang,-column.index)
		// end
		// else
		if AnsiPos('Số tiền', Column.Caption) > 0 then
		begin
			if croissant then
				(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
			else
				(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
		end
		else
			(Sender as TCustomListView).AlphaSort;
	lv_lb(lv_bang_thu,lb_thu,4,duong_dan_goc + '\Du lieu\DL thu.LDN');
end;

procedure Tf_quan_ly_tai_chinh.lv_bang_thuCompare(Sender: TObject;
	Item1, Item2: TListItem; Data: integer; var Compare: integer);
var
	ix: integer;
begin
	if croissant then
		if ColumnToSort = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := ColumnToSort - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if ColumnToSort = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := ColumnToSort - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_quan_ly_tai_chinh.lv_bang_thuMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
	if lv_bang_thu.ItemIndex = -1 then
		Exit;
	bt_sua.Enabled:=true;
	lb_thu.ItemIndex := lv_bang_thu.ItemIndex+1;
	lb_thu.Selected[lb_thu.ItemIndex];
	chon_lb_thu;
end;

procedure Tf_quan_ly_tai_chinh.lv_du_chiColumnClick(Sender: TObject;
	Column: TListColumn);
begin
	if Column.Index = -1 then
		Exit;
	xep_du_chi := not xep_du_chi;
	cot_xep_du_chi := Column.Index;
	if (AnsiPos('Ngày thêm', Column.Caption) > 0) then
	begin
		if xep_du_chi then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else if AnsiPos('Số tiền', Column.Caption) > 0 then
	begin
		if xep_du_chi then
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
	end
	else
		(Sender as TCustomListView).AlphaSort;
	lv_lb(lv_du_chi,lb_du_chi,4,duong_dan_goc + '\Du lieu\DL du chi.LDN');
end;

procedure Tf_quan_ly_tai_chinh.lv_du_chiCompare(Sender: TObject; Item1,
	Item2: TListItem; Data: Integer; var Compare: Integer);
var
	ix: integer;
begin
	if xep_du_chi then
		if cot_xep_du_chi = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := cot_xep_du_chi - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if cot_xep_du_chi = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := cot_xep_du_chi - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_quan_ly_tai_chinh.lv_du_chiDblClick(Sender: TObject);
begin
	if lv_du_chi.ItemIndex = -1 then
	begin
		bt_chi.Enabled:=sai;
		Exit;
	end;
		bt_chi.Enabled:=dung;
		//f_chi_tiet_du_chi.
	//f_chi_tiet_du_chi.Show;
	Application.CreateForm(Tf_chi_tiet_du_chi, f_chi_tiet_du_chi);
	f_chi_tiet_du_chi.Show;
end;

procedure Tf_quan_ly_tai_chinh.lv_du_chiMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
		if lv_du_chi.ItemIndex = -1 then
	begin
		bt_chi.Enabled:=sai;
		Exit;
	end;
	bt_chi.Enabled:=dung;
	bt_sua.Enabled:=true;
	lb_du_chi.ItemIndex := lv_du_chi.ItemIndex+1;
	lb_du_chi.Selected[lb_du_chi.ItemIndex];
	chon_lb_thu;
end;

procedure Tf_quan_ly_tai_chinh.lv_du_thuColumnClick(Sender: TObject;
  Column: TListColumn);
begin
	if Column.Index = -1 then
		Exit;
	xep_du_thu := not xep_du_thu;
	cot_xep_du_thu := Column.Index;
	if (AnsiPos('Ngày thêm', Column.Caption) > 0) then
	begin
		if xep_du_thu then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else if AnsiPos('Số tiền', Column.Caption) > 0 then
	begin
		if xep_du_thu then
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
	end
	else
		(Sender as TCustomListView).AlphaSort;
	lv_lb(lv_du_thu,lb_du_thu,4,duong_dan_goc + '\Du lieu\DL du thu.LDN');
end;

procedure Tf_quan_ly_tai_chinh.lv_du_thuCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
	ix: integer;
begin
	if xep_du_thu then
		if cot_xep_du_thu = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := cot_xep_du_thu - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if cot_xep_du_thu = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := cot_xep_du_thu - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_quan_ly_tai_chinh.lv_du_thuMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	if lv_du_thu.ItemIndex = -1 then
	begin
		bt_chi.Enabled:=sai;
		Exit;
	end;
	bt_chi.Enabled:=dung;
	bt_sua.Enabled:=true;
	lb_du_thu.ItemIndex := lv_du_thu.ItemIndex+1;
	lb_du_thu.Selected[lb_du_thu.ItemIndex];
	chon_lb_thu;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.cbb_truc_thuoc_thuDblClick(Sender: TObject);
begin
	f_truc_thuoc.Show;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.chon_lb_thu;
var
	mo_ta: string;
	ListItem: TListItem;
begin
	m_mo_ta.Lines.Clear;
	if chon = 't' then
	begin
		ListItem := lv_bang_thu.Items[lv_bang_thu.ItemIndex];
	end
	else if chon = 'c' then
	begin
		ListItem := lv_bang_chi.Items[lv_bang_chi.ItemIndex];
	end
	else if chon = 'd' then
	begin
		ListItem := lv_du_chi.Items[lv_du_chi.ItemIndex];
	end
	else if chon = 'dt' then
	begin
		ListItem := lv_du_thu.Items[lv_du_thu.ItemIndex];
	end;
	with ListItem do
	begin
		cbb_ten_khoan.Text:=Caption;
		cbb_tien_thu.Text := SubItems.Strings[0];
		cbb_ngay_cn.Text := SubItems.Strings[1];
		cbb_truc_thuoc_thu.Text := SubItems.Strings[2];
		mo_ta := SubItems.Strings[3];
		mo_ta:= StringReplace(mo_ta, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_mo_ta.Text := mo_ta;
	end;
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.e_tien_hien_taiDblClick(Sender: TObject);
begin
//	e_tien_hien_tai.SelectAll;
end;

procedure Tf_quan_ly_tai_chinh.e_tien_hien_taiKeyPress(Sender: TObject;
	var Key: Char);
begin
//	if not(Key in [#13, #8, '0' .. '9', '-']) then
//	begin
//		ShowMessage('Invalid key: ' + IntToStr(integer(Key)));
//		Key := #0;
//	end
//	else if (Key = '-') and (Pos(Key, e_tien_hien_tai.Text) > 0) then
//	begin
//		ShowMessage('Invalid Key: twice ' + Key);
//		Key := #0;
//	end
//	else if (Key = '-') and (e_tien_hien_tai.SelStart <> 0) then
//	begin
//		ShowMessage('Only allowed at beginning of number: ' + Key);
//		Key := #0;
//	end
//	else if (Key = #13) then
//	begin
//		e_tien_hien_tai.Visible := False;
//		l_tien_hien_tai.Visible := true;
//		l_tien_hien_tai.Caption := e_tien_hien_tai.Text;
//		lb_so_tien.Items[0] := e_tien_hien_tai.Text;
//		lb_so_tien.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL tien.LDN',
//			TEncoding.UTF8);
//	end;
end;

procedure Tf_quan_ly_tai_chinh.sap_xep_sg(Grid: TStringGrid; SortCol: integer);
{ A simple exchange sort of grid rows }
var
	i, j: integer;
	temp: tstringlist;
begin
	temp := tstringlist.Create;
	with Grid do
		for i := FixedRows to RowCount - 2 do { because last row has no next row }
			for j := i + 1 to RowCount - 1 do { from next row to end }
				if AnsiCompareText(Cells[SortCol, i], Cells[SortCol, j]) > 0 then
				begin
					temp.assign(rows[j]);
					rows[j].assign(rows[i]);
					rows[i].assign(temp);
				end;
	temp.Free;
end;
// ========================================

procedure Tf_quan_ly_tai_chinh.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := False;
end;

procedure Tf_quan_ly_tai_chinh.bt_xoaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn xóa dữ liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
	begin
		if chon = 't' then
		begin
			lb_thu.Items.Delete(lv_bang_thu.ItemIndex+1); // Remove selected item
			lb_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL thu.LDN',
				TEncoding.UTF8);
			lv_bang_thu.Items.Delete(lv_bang_thu.ItemIndex);
			// sg_cong_viec.Rows.Clear;
		end
		else if chon = 'c' then
		begin
			lb_chi.Items.Delete(lv_bang_chi.ItemIndex+1); // Remove selected item
			lb_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL chi.LDN',
				TEncoding.UTF8);
			lv_bang_chi.Items.Delete(lv_bang_chi.ItemIndex);
		end
		else if chon = 'd' then
		begin
			lb_du_chi.Items.Delete(lv_du_chi.ItemIndex+1); // Remove selected item
			lb_du_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du chi.LDN',
				TEncoding.UTF8);
			lv_du_chi.Items.Delete(lv_du_chi.ItemIndex);
		end
		else if chon = 'dt' then
		begin
			lb_du_thu.Items.Delete(lv_du_thu.ItemIndex+1); // Remove selected item
			lb_du_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du thu.LDN',
				TEncoding.UTF8);
			lv_du_thu.Items.Delete(lv_du_thu.ItemIndex);
		end;
	end;
	tinh_tien_du;
	tinh_tong_tien;
end;

procedure Tf_quan_ly_tai_chinh.bt_chiClick(Sender: TObject);
var
	chon_tam: string;
begin
	if bt_chi.Caption='Thu' then
	begin
		if MessageDlg('Bạn thu về khoản này!?', mtConfirmation,[mbYes, mbNo],0) = idYes then
		begin
			chon_tam:=chon;
			chon:='t';
			them_dl(1);
			chon:=chon_tam;
			lb_du_thu.Items.Delete(lv_du_thu.ItemIndex+1); // Remove selected item
			lb_du_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du thu.LDN',
				TEncoding.UTF8);
			lv_du_thu.Items.Delete(lv_du_thu.ItemIndex);
		end;
	end;
	if bt_chi.Caption='Chi' then
	begin
		if MessageDlg('Bạn chi trả khoản này!?', mtConfirmation,[mbYes, mbNo],0) = idYes then
		begin
			chon_tam:=chon;
			chon:='c';
			them_dl(1);
			chon:=chon_tam;
			lb_du_chi.Items.Delete(lv_du_chi.ItemIndex+1); // Remove selected item
			lb_du_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du chi.LDN',
				TEncoding.UTF8);
			lv_du_chi.Items.Delete(lv_du_chi.ItemIndex);
		end;
	end;
	tinh_tong_tien;
end;

procedure Tf_quan_ly_tai_chinh.bt_dong_chi_tiet_khoanClick(Sender: TObject);
begin
	//p_chi_tiet_khoan.Visible:=sai;
end;

procedure Tf_quan_ly_tai_chinh.bt_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
end;

procedure Tf_quan_ly_tai_chinh.bt_them_thuClick(Sender: TObject);
begin
	them_dl(1);
end;
procedure Tf_quan_ly_tai_chinh.bt_thong_keClick(Sender: TObject);
begin
//	Application.CreateForm(Tf_thong_ke, f_thong_ke);
//	f_thong_ke.Show;
end;

//======================================== 
procedure Tf_quan_ly_tai_chinh.them_dl(them: byte);
var
		i: integer;
	ngay_them: string;
	so_tien,chuoi:string;
begin
	so_dong := m_mo_ta.Lines.Count;
	if chon = 't' then
		chuoi:='Bạn chưa nhập tên khoản thu'
	else if chon = 'c' then
		chuoi:='Bạn chưa nhập tên khoản chi'
	else if chon = 'd' then
		chuoi:='Bạn chưa nhập tên khoản dự định chi'
	else if chon = 'dt' then
		chuoi:='Bạn chưa nhập tên khoản dự định thu';
	so_tien:=doi_so_thanh_tien(cbb_tien_thu.Text);
	if cbb_ten_khoan.Text = '' then
	begin
		sttb1.Panels[0].Text := chuoi;
		tm1.Enabled := true;
		exit;
	end
	else if so_tien = '' then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập số tiền';
		tm1.Enabled := true;
		exit;
	end
	else
	begin
		trung_lap := False;
//		for i := 0 to cbb_ten_khoan.Items.Count - 1 do
//		begin
//			if (cbb_ten_khoan.Items[i] = cbb_ten_khoan.Text) then
//			begin
//				trung_lap := true;
//				sttb1.Panels[0].Text := 'Trùng lặp tên khoản thu chi';
//				Beep;
//				tm1.Enabled := true;
//				exit;
//			end;
//		end;
		if trung_lap = False then
		begin
			dong_mo_ta := m_mo_ta.Lines[0]; // nạp dòng đầu tiên
			cong_viec_moi := true;
			dong_dl := '';
			i := 0;
			While i < so_dong - 1 Do
			begin
				i := i + 1;
				dong_mo_ta := dong_mo_ta + '``' + m_mo_ta.Lines[i];
			end;
			if them=1 then
				ngay_them := DateTimeToStr(now)
			else
				ngay_them := cbb_ngay_cn.Text;
			dong_dl := cbb_ten_khoan.Text + phan_cot + so_tien + phan_cot +
				ngay_them + phan_cot + cbb_truc_thuoc_thu.Text + phan_cot +
				dong_mo_ta + phan_cot;
			cbb_ten_khoan.Items.Add(cbb_ten_khoan.Text);
			if them=1 then
			begin
				if chon = 't' then
				begin
					lb_thu.Items.Add(dong_dl);
					lb_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL thu.LDN',
						TEncoding.UTF8);
					lb_lv(lb_thu,lv_bang_thu,4);
				end
				else if chon = 'c' then
				begin
					lb_chi.Items.Add(dong_dl);
					lb_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL chi.LDN',
						TEncoding.UTF8);
					lb_lv(lb_chi,lv_bang_chi,4);
				end
				else if chon = 'd' then
				begin
					lb_du_chi.Items.Add(dong_dl);
					lb_du_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du chi.LDN',
						TEncoding.UTF8);
					lb_lv(lb_du_chi,lv_du_chi,4);
				end
				else if chon = 'dt' then
				begin
					lb_du_thu.Items.Add(dong_dl);
					lb_du_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du thu.LDN',
						TEncoding.UTF8);
					lb_lv(lb_du_thu,lv_du_thu,4);
				end;
			end else
			begin
					if chon = 't' then
				begin
					lb_thu.Items[lv_bang_thu.itemindex+1]:=dong_dl;
					lb_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL thu.LDN',
						TEncoding.UTF8);
					lb_lv(lb_thu,lv_bang_thu,4);
				end
				else if chon = 'c' then
				begin
					lb_chi.Items[lv_bang_chi.itemindex+1]:=dong_dl;
					lb_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL chi.LDN',
						TEncoding.UTF8);
					lb_lv(lb_chi,lv_bang_chi,4);
				end
				else if chon = 'd' then
				begin
					lb_du_chi.Items[lv_du_chi.itemindex+1]:=dong_dl;
					lb_du_chi.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du chi.LDN',
						TEncoding.UTF8);
					lb_lv(lb_du_chi,lv_du_chi,4);
				end
				else if chon = 'dt' then
				begin
					lb_du_thu.Items[lv_du_thu.itemindex+1]:=dong_dl;
					lb_du_thu.Items.SaveToFile(duong_dan_goc + '\Du lieu\DL du thu.LDN',
						TEncoding.UTF8);
					lb_lv(lb_du_thu,lv_du_thu,4);
				end;
			end;
			cong_viec_moi := False;
			tm1.Enabled := true;
			sttb1.Panels[0].Text := 'Thành công!';

			//sttb1.Color:=clGreen;
		end;
	end;
	tinh_tien_du;
	tinh_tong_tien;
end;
procedure Tf_quan_ly_tai_chinh.Timer1Timer(Sender: TObject);
begin
	//l4.Caption:=IntToStr(lv_du_chi.ItemIndex);
end;

// ========================================
procedure Tf_quan_ly_tai_chinh.tinh_tien_du;
var
	tong_thu, tong_chi: integer;
	tien: string;
	i: integer;
	ListItem: TListItem;
begin
	tong_thu := 0;
	tong_chi := 0;
	for i := 0 to lv_bang_thu.Items.Count - 1 do
	begin
		ListItem := lv_bang_thu.Items[i];
		with ListItem do
		begin
			tien := SubItems.Strings[0];
		end;
		tong_thu := tong_thu + StrToInt(tien);
	end;
	for i := 0 to lv_bang_chi.Items.Count - 1 do
	begin
		ListItem := lv_bang_chi.Items[i];
		with ListItem do
		begin
			tien := SubItems.Strings[0];
		end;
		tong_chi := tong_chi + StrToInt(tien);
	end;
	l_tien_hien_tai.Caption := IntToStr(tong_thu - tong_chi);
	l_tong_thu.Caption:=IntToStr(tong_thu);
	l_tong_chi.Caption:=IntToStr(tong_chi);
end;
// ========================================
procedure Tf_quan_ly_tai_chinh.tinh_tong_tien;
var
	tong_du_thu, tong_du_chi: integer;
	tien: string;
	i: integer;
	li: TListItem;
	tong_du_tinh:integer;
begin
	tong_du_thu := 0;
	tong_du_chi := 0;
	for i := 0 to lv_du_thu.Items.Count - 1 do
	begin
		li := lv_du_thu.Items[i];
		with li do
		begin
			tien := SubItems.Strings[0];
		end;
		tong_du_thu := tong_du_thu + StrToInt(tien);
	end;
	for i := 0 to lv_du_chi.Items.Count - 1 do
	begin
		li := lv_du_chi.Items[i];
		with li do
		begin
			tien := SubItems.Strings[0];
		end;
		tong_du_chi := tong_du_chi + StrToInt(tien);
	end;
	tong_du_tinh := tong_du_thu - tong_du_chi;
	l_tong.Caption:=IntToStr(StrToInt(l_tien_hien_tai.Caption)+tong_du_tinh);
end;
end.
