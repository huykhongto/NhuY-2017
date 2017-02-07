unit Quan_ly_cong_viec;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
	Vcl.ExtCtrls,
	Vcl.Grids, f_nhu_y_f, LDNam_sys,LDNam_xu_ly_du_lieu,f_dl_f,System.UITypes,ldnam_dl;

type
	Tf_quan_ly_cong_viec = class(TForm)
		Label2: TLabel;
		e_ngay_them: TEdit;
		m_mo_ta_cv: TMemo;
		cb_hoan_thanh: TCheckBox;
		cbb_quan_trong: TComboBox;
		b_them: TButton;
		Label4: TLabel;
		e_ngay_hoan_thanh: TEdit;
		Label5: TLabel;
		e_ngay_du_tinh: TEdit;
		Label6: TLabel;
		b_xoa: TButton;
		b_sua: TButton;
		e_thu_muc_cv: TEdit;
		Label7: TLabel;
		b_mo_thu_muc: TButton;
		b_them_thu_muc: TButton;
		sttb1: TStatusBar;
		tm1: TTimer;
		cbb_ten_cong_viec: TComboBox;
		lb_so_cv: TLabel;
		ttp_ngay_du_tinh: TDateTimePicker;
		cb_ngay_du_tinh: TCheckBox;
		b_xoa_cv: TButton;
		lv_cong_viec: TListView;
		Panel1: TPanel;
    bt_hoan_thanh: TButton;
    b_xem_moi_cu: TButton;
    Panel2: TPanel;
    b_cu_moi: TButton;
    Panel3: TPanel;
    Label3: TLabel;
		procedure FormCreate(Sender: TObject);
		procedure b_themClick(Sender: TObject);
		procedure tm1Timer(Sender: TObject);
		procedure ttp_ngay_du_tinhChange(Sender: TObject);
		procedure cb_ngay_du_tinhClick(Sender: TObject);
		procedure b_xoa_cvClick(Sender: TObject);
		// procedure sg_cong_viecMouseDown(Sender: TObject; Button: TMouseButton;
		// Shift: TShiftState; X, Y: Integer);
		procedure sap_xep_sg(Grid: TStringGrid; SortCol: integer);
		procedure lv_cong_viecMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: integer);
		procedure lv_cong_viecCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: integer; var Compare: integer);
		procedure lv_cong_viecClick(Sender: TObject);
		procedure lv_cong_viecColumnClick(Sender: TObject; Column: TListColumn);
		procedure lv_cong_viecResize(Sender: TObject);
		procedure b_suaClick(Sender: TObject);
		procedure them_dl(lua_chon:byte);
		procedure bt_hoan_thanhClick(Sender: TObject);
		procedure b_xem_moi_cuClick(Sender: TObject);
		procedure luu_thong_so;
		procedure doc_thong_so;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
	public
		{ Public declarations }
		duong_dan_goc: string;
		cong_viec_moi: bool;
		j: integer;
		so_dong, i: integer;
		trung_lap: bool;
		Giai_tri: string;
		dong_dl: string;
		dong_mo_ta_cv: string;
		vi_tri: integer;
		ten_cv: string;
	end;

var
	f_quan_ly_cong_viec: Tf_quan_ly_cong_viec;
	ngay, thang, nam: word; // khai bao ngay thang nam
	gio, phut, giay, m_giay: word; // khai bao gio phut giay
	ma_cong_viec:string;
	ma_cong_viec_ht:string;

	dl_cong_viec:TLDNam_dl;
const
	Msg1 = 'File "%s" does not exist!';
	Msg2 = '"%s" is not a ListView file!';
	

implementation

{$R *.dfm}

//======================================== 
procedure Tf_quan_ly_cong_viec.doc_thong_so;
var 
	dong:string;
	a: array [0..50] of string;
	j:integer;
	vi_tri_cuoi:integer;
	i:integer;
	so_dl:integer;
	function tach_b(c:string) :boolean;
	begin
		Result:=sai;
		if c='d' then
			Result:=dung;
	end;
	function tach_s(c:string) :integer;
	begin
		Result:=0;
		if c<>'' then
			Result:=StrToInt(c);
	end;
	function tach_s_md(c:string;md:integer) :integer;
	begin
		Result:=md;
		if c<>'' then
			Result:=StrToInt(c);
	end;
	function tach_c_md(c:string;md:string) :string;
	begin
		Result:=md;
		if c<>'' then
			Result:=c;
	end;
begin
	dong:=dl_cong_viec.sl_dl[0];
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,dong)-1 ;
	for j := 0 to so_dl do
	begin
		vi_tri_cuoi := AnsiPos(phan_cot, dong);
		a[j]:=copy(dong, 1, vi_tri_cuoi-1);
		dong:=copy(dong,vi_tri_cuoi+2,Length(dong));
	end;
	Left:=tach_s(a[1]);
	top:=tach_s(a[2]);
	ma_cong_viec:= tach_c_md(a[3],'CV000000');
	for i := 0 to so_dl-4 do
	begin
		lv_cong_viec.Columns[i].Width:=tach_s_md(a[i+4],50);
	end;
end;
//======================================== 
procedure Tf_quan_ly_cong_viec.luu_thong_so;
var
	dong:string;
	so_dl:integer;
	i:integer;
	procedure them_c(ts:string);
	begin
		dong:=dong+ts+phan_cot;
	end;
	procedure them_s(s:integer);
	begin
		them_c(IntToStr(s));
	end;
	procedure them_b(b:boolean);
	Var
		b_c: string;
	begin
		b_c:='s';
		if b=dung then
			b_c:='d';
		them_c(b_c);
	end;
begin
	them_s(Left); // 1
	them_s(Top); // 2
	them_c(ma_cong_viec); // 3
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,dl_cong_viec.sl_dl[1])-1 ;
	for i := 0 to so_dl do
	begin
		them_s(lv_cong_viec.Columns[i].Width);
	end;
	dl_cong_viec.sl_dl[0]:=dong;
	dl_cong_viec.luu;
	//them_c('1111');

	dl_cong_viec.thong_so.Clear;
	dl_cong_viec.thong_so.Add(IntToStr(Left));
	dl_cong_viec.thong_so.Add(IntToStr(Top));
	dl_cong_viec.thong_so.Add(ma_cong_viec); 
	dl_cong_viec.luu_thong_so;
end;
//======================================== 
procedure Tf_quan_ly_cong_viec.them_dl(lua_chon: byte);
var
	i: integer;
	hoan_thanh: string;
	procedure them(c: string);
	begin
		dong_dl:=dong_dl+c+phan_cot;
	end;
begin
 so_dong := m_mo_ta_cv.Lines.Count;
	if lua_chon=1 then
	begin
		e_ngay_hoan_thanh.Text := '';
		e_ngay_them.Text := DateTimeToStr(now);
	end;
	if cbb_ten_cong_viec.Text = '' then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập tên công việc';
		tm1.Enabled := true;
	end
	else if so_dong < 1 then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập mô tả công việc';
		tm1.Enabled := true;
	end
	else
	begin
		trung_lap := false;
//		for i := 0 to cbb_ten_cong_viec.Items.Count - 1 do
//		begin
//			if cbb_ten_cong_viec.Items[i] = cbb_ten_cong_viec.Text then
//			begin
//				trung_lap := true;
//				sttb1.Panels[0].Text := 'Công việc bạn muốn thêm đã tồn tại';
//				tm1.Enabled := true;
//				break;
//			end;
//		end;
		
		begin
			cong_viec_moi := true;
			dong_dl := '';
			dong_mo_ta_cv := n_dong_chuoi_mm(m_mo_ta_cv);
			hoan_thanh := 's';
			if cb_hoan_thanh.Checked = true then
				hoan_thanh := 'd';
			if lua_chon=1 then
			begin
				them(ma_cong_viec); // 1
			end
			else
			begin
				them(ma_cong_viec_ht); // 1
			end;
			dong_dl := dong_dl+cbb_ten_cong_viec.Text +phan_cot+ dong_mo_ta_cv +phan_cot+
				cbb_quan_trong.Text +phan_cot+ e_ngay_du_tinh.Text +phan_cot+
				e_ngay_them.Text +phan_cot+ e_ngay_hoan_thanh.Text +phan_cot+
				hoan_thanh+phan_cot+ e_thu_muc_cv.Text +phan_cot;
			if lua_chon=1 then
			begin
				ma_cong_viec:=tang_chuoi_so_5(ma_cong_viec);
				dl_cong_viec.sl_dl.Add(dong_dl);
			end
			else
			begin
				sl_sua(dl_cong_viec.sl_dl,dong_dl);
			end;
		end;
		cong_viec_moi := false;
		tm1.Enabled := true;
		sttb1.Panels[0].Text := 'Thành công';
		cb_hoan_thanh.Checked := false;
		lb_so_cv.Caption := 'Số công việc: ' +IntToStr(dl_cong_viec.sl_dl.Count-1);
		sl_lv(dl_cong_viec.sl_dl,lv_cong_viec);
		luu_thong_so;
	end;
end;
procedure Tf_quan_ly_cong_viec.bt_hoan_thanhClick(Sender: TObject);
begin
	cb_hoan_thanh.Checked:=dung;
	cbb_quan_trong.ItemIndex:=9;
	e_ngay_hoan_thanh.Text:= DateTimeToStr(now);
	them_dl(0);
end;

procedure Tf_quan_ly_cong_viec.b_xem_moi_cuClick(Sender: TObject);
var
thuc_thi:boolean;
begin
	thuc_thi:=dung;
	if cb_hoan_thanh.Checked=false then
	begin
		thuc_thi:=sai;
		if MessageDlg('Công việc chưa hoàn thành'+xuong_dong+'Bạn không muốn hoàn thành?', 
		mtConfirmation, [mbYes, mbNo], 0) = idYes then thuc_thi:=dung;
	end;
	if thuc_thi then
	begin
		f_dl.lb_cong_viec_cu.Items.Add(sl_tro(dl_cong_viec.sl_dl,ma_cong_viec_ht));// f_dl.lb_cong_viec.Items[lv_cong_viec.ItemIndex+1]);
		sl_xoa(dl_cong_viec.sl_dl,ma_cong_viec_ht);
		//f_dl.lb_cong_viec.Items.Delete(lv_cong_viec.itemindex+1);
		dl_cong_viec.luu;
		f_dl.lb_cong_viec_cu_luu;
		sl_lv(dl_cong_viec.sl_dl,lv_cong_viec);
		//lv_cong_viec.Items.Delete(lv_cong_viec.itemindex);
	end;
end;

procedure Tf_quan_ly_cong_viec.b_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
end;

procedure Tf_quan_ly_cong_viec.b_themClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_quan_ly_cong_viec.b_xoa_cvClick(Sender: TObject);
begin
	if lv_cong_viec.ItemIndex>=0 then
	begin
		if MessageDlg('Bạn có muốn xóa từ này!?', mtConfirmation, [mbYes, mbNo], 0) = idYes
		then
		begin
			sl_xoa(dl_cong_viec.sl_dl,ma_cong_viec_ht);
			f_dl.lb_thien_su_luu;
			luu_thong_so;
			lb_so_cv.Caption := 'Số công việc: ' + IntToStr(dl_cong_viec.sl_dl.Count-1);
			dl_cong_viec.luu;
			lv_cong_viec.Items.Delete(lv_cong_viec.itemindex);
		end;
	end;
end;

procedure Tf_quan_ly_cong_viec.cb_ngay_du_tinhClick(Sender: TObject);
begin
	if cb_ngay_du_tinh.Checked = true then
		e_ngay_du_tinh.Text := DateToStr(ttp_ngay_du_tinh.DateTime)
	else
		e_ngay_du_tinh.Text := '';

end;
{
procedure Tf_quan_ly_cong_viec.luu_lv(AListView: TListView; sFileName: string);
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
procedure Tf_quan_ly_cong_viec.tai_lv(AListView: TListView; sFileName: string);
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
}
// ========================================
procedure Tf_quan_ly_cong_viec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	luu_thong_so;
end;

procedure Tf_quan_ly_cong_viec.FormCreate(Sender: TObject);
begin
	dl_cong_viec:=TLDNam_dl.tao('DL Cong viec.LDN');
	doc_thong_so;
	sl_lv(dl_cong_viec.sl_dl,lv_cong_viec);
	ttp_ngay_du_tinh.date := date;
	j := -1;
end;
// ========================================
procedure Tf_quan_ly_cong_viec.lv_cong_viecClick(Sender: TObject);
begin
	{ sap_xep_tang:=not sap_xep_tang; //inversion du précédent ordre de tri
		cot_sap_xep:=Column.Index; //Quel colonne est à trier ?
		// Ensuite on détermine quel est le type de colonne à trier:
		// on peut aussi les déterminer en spécifiant un tag particulier dans chaque colonne
		if pos('DateTime',Column.Caption)>0
		then
		begin
		if sap_xep_tang
		then (Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian,column.index)
		else (Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian,-column.index)
		end
		else
		if pos('Date',Column.Caption)>0
		then
		begin
		if sap_xep_tang
		then (Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang,column.index)
		else (Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang,-column.index)
		end
		else
		if pos('Chiffre',Column.Caption)>0
		then
		begin
		if sap_xep_tang
		then (Sender as TCustomListView).CustomSort(@Sap_xep_so,column.index)
		else (Sender as TCustomListView).CustomSort(@Sap_xep_so,-column.index)
		end
		else (Sender as TCustomListView).AlphaSort; }
	// Méthode  de comparaison de text par défaut.
end;

procedure Tf_quan_ly_cong_viec.lv_cong_viecColumnClick(Sender: TObject;
	Column: TListColumn);
begin
	sap_xep_tang := not sap_xep_tang; // inversion du précédent ordre de tri
	cot_sap_xep := Column.Index; // Quel colonne est à trier ?
	// Ensuite on détermine quel est le type de colonne à trier:
	// on peut aussi les déterminer en spécifiant un tag particulier dans chaque colonne
	if (AnsiPos('Ngày thêm', Column.Caption) > 0) or
		(AnsiPos('Ngày hoàn thành', Column.Caption) > 0) then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else if (AnsiPos('Dự tính', Column.Caption) > 0) then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang_lv,
				-Column.Index)
	end
	else if AnsiPos('Quan trọng', Column.Caption) > 0 then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
	end
	else
		(Sender as TCustomListView).AlphaSort;
	//f_dl.lb_cong_viec_luu_lv(lv_cong_viec,7);
end;

procedure Tf_quan_ly_cong_viec.lv_cong_viecCompare(Sender: TObject;
	Item1, Item2: TListItem; Data: integer; var Compare: integer);
var
	ix: integer;
begin
	if sap_xep_tang then
		if cot_sap_xep = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := cot_sap_xep - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if cot_sap_xep = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := cot_sap_xep - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_quan_ly_cong_viec.lv_cong_viecMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
	ListItem: TListItem;
	mo_ta: string;
begin
	if lv_cong_viec.itemindex <> -1 then
	begin
		ListItem := lv_cong_viec.Items[lv_cong_viec.ItemIndex];
		with ListItem do
	begin     
		ma_cong_viec_ht:=Caption;
		cbb_ten_cong_viec.Text:=SubItems.Strings[0];
		mo_ta:= SubItems.Strings[1];
		cbb_quan_trong.Text := SubItems.Strings[2];
		e_ngay_du_tinh.Text := SubItems.Strings[3];
		e_ngay_them.Text := SubItems.Strings[4];
		e_ngay_hoan_thanh.Text := SubItems.Strings[5];
		e_thu_muc_cv.Text := SubItems.Strings[7];
		if SubItems.Strings[6] = 'd' then
		begin
			cb_hoan_thanh.Checked := true;
			bt_hoan_thanh.Enabled:=false;
		end
		else
		begin
			cb_hoan_thanh.Checked := false;
			bt_hoan_thanh.Enabled:=true;
		end;
		mo_ta:= StringReplace(mo_ta, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_mo_ta_cv.Text := mo_ta;
	end;
	end;
end;

procedure Tf_quan_ly_cong_viec.lv_cong_viecResize(Sender: TObject);
begin
	e_ngay_them.Visible := true;
end;

procedure Tf_quan_ly_cong_viec.sap_xep_sg(Grid: TStringGrid; SortCol: integer);
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

procedure Tf_quan_ly_cong_viec.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := false;
end;

procedure Tf_quan_ly_cong_viec.ttp_ngay_du_tinhChange(Sender: TObject);
begin
	e_ngay_du_tinh.Text := DateToStr(ttp_ngay_du_tinh.DateTime);
end;

end.
