﻿unit f_quan_ly_vat_tu_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,
	Vcl.ComCtrls, Vcl.ExtCtrls,LDNam_sys,LDNam_xu_ly_du_lieu,f_dl_f,
	System.UITypes,LDNam_sys_thoi_gian;

type
  Tf_quan_ly_vat_tu = class(TForm)
    lv_vat_tu: TListView;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cbb_tim: TComboBox;
    b_tim: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbb_muc: TComboBox;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    b_xoa: TButton;
    b_sua: TButton;
    b_them: TButton;
    b_xoa_muc: TButton;
    sttb1: TStatusBar;
    tm1: TTimer;
    ttp_ngay_cn: TDateTimePicker;
    lb_so_kh: TLabel;
    cbb_gia_von: TComboBox;
    cbb_gia_ban: TComboBox;
		m_khac: TMemo;
    m_thong_tin: TMemo;
    cbb_ten: TComboBox;
    cbb_ma: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    cbb_so_luong: TComboBox;
    Label6: TLabel;
    b_nhap: TButton;
    l_ma: TLabel;
    Panel4: TPanel;
    Splitter2: TSplitter;
    lv_vat_tu_tim: TListView;
    cb_tim_nang_cao: TCheckBox;
    Panel5: TPanel;
    Label7: TLabel;
    l_von: TLabel;
    cbb_nhom_vat_tu: TComboBox;
    b_chuyen_gia: TButton;
    cbb_pt: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
		procedure b_themClick(Sender: TObject);
		procedure them_dl(lua_chon: byte);
    procedure tm1Timer(Sender: TObject);
    procedure b_xoa_mucClick(Sender: TObject);
    procedure lv_vat_tuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure b_suaClick(Sender: TObject);
    procedure lv_vat_tuColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv_vat_tuCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: Integer; var Compare: Integer);
		procedure luu_thong_so;
		//procedure luu_ts_them(ts:string);
		procedure doc_thong_so;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_nhapClick(Sender: TObject);
    procedure cbb_gia_vonChange(Sender: TObject);
		procedure cbb_gia_banChange(Sender: TObject);
		procedure b_timClick(Sender: TObject);
		procedure giai_ma_dl(vi_tri:integer);
    procedure cbb_timChange(Sender: TObject);
    procedure cbb_timKeyPress(Sender: TObject; var Key: Char);
    procedure lv_vat_tu_timMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
		function tinh_tong_von :boolean;
    procedure l_vonClick(Sender: TObject);
    procedure cbb_nhom_vat_tuChange(Sender: TObject);
    procedure b_chuyen_giaClick(Sender: TObject);
	private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
  public
    { Public declarations }
  end;

var
	f_quan_ly_vat_tu: Tf_quan_ly_vat_tu;
	ma_vat_tu:string;
	ma_vat_tu_ht:string; // ma thấu kính hiển thị
	da_tim:boolean;
	vi_tri_xem:integer;
	tu_vua_tim:string;
	tu_tra,nghia_tu:string;
	so_tu_tim_thay:integer;
	ty_le:integer;
	ListItem: TListItem;
	vi_tri_chon:integer;

	thong_tin_cu,
	so_luong_cu,
	gia_von_cu,
	gia_ban_cu:string;

implementation



{$R *.dfm}


function Tf_quan_ly_vat_tu.tinh_tong_von :boolean;
	var
	i:integer;
	tong:integer;
	don_gia:integer;
	so_luong:integer;
begin
	tong:=0;
	for I := 0 to lv_vat_tu.Items.Count-1 do
	begin
		ListItem := lv_vat_tu.Items[i];
		don_gia:=StrToInt(ListItem.SubItems.Strings[5]);
		so_luong:=StrToInt(ListItem.SubItems.Strings[7]);
		tong:=tong+don_gia*so_luong;
	end;
	l_von.Caption:=IntToStr(tong)
end;
//======================================== 
procedure Tf_quan_ly_vat_tu.doc_thong_so;
var 
	dong:string;
	a: array [0..50] of string;
	j:integer;
	vi_tri_cuoi:integer;
	i:integer;
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
const so_dl=13;
begin
	
	dong:=f_dl.lb_vat_tu.Items[0];
	for j := 0 to so_dl do
	begin
		vi_tri_cuoi := AnsiPos(phan_cot, dong);
		a[j]:=copy(dong, 1, vi_tri_cuoi-1);
		dong:=copy(dong,vi_tri_cuoi+2,Length(dong));
	end;
	f_quan_ly_vat_tu.Left:=tach_s(a[1]);
	f_quan_ly_vat_tu.top:=tach_s(a[2]);
	ma_vat_tu:= tach_c_md(a[3],'VT000000');
	for i := 0 to 9 do
	begin
		lv_vat_tu.Columns[i].Width:=tach_s_md(a[i+4],50);
	end;
end;
//======================================== 
procedure Tf_quan_ly_vat_tu.luu_thong_so;
var
	dong:string;
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
	if cbb_nhom_vat_tu.ItemIndex=1 then
		f_dl.lb_vat_tu_tai;
	dong:=phien_ban_du_lieu+phan_cot;
	them_s(f_quan_ly_vat_tu.Left); // 1
	them_s(f_quan_ly_vat_tu.Top); // 2
	them_c(ma_vat_tu); // 3
	for i := 0 to 9 do
	begin
		them_s(lv_vat_tu.Columns[i].Width);
	end;
	f_dl.lb_vat_tu.Items[0]:=dong; 
	f_dl.lb_vat_tu_luu;
	if cbb_nhom_vat_tu.ItemIndex=1 then
	begin
		f_dl.lb_vat_tu_tai1;
	end;
	//them_c('1111');
end;
//======================================== 
procedure Tf_quan_ly_vat_tu.them_dl(lua_chon: byte);
var
	ngay_cn:string;
	dong_dl:string;
	dong_thong_tin:string;
	dong_khac:string;
	const 
	cach_ls = '//====================';
	procedure them(c: string);
	begin
		dong_dl:=dong_dl+c+phan_cot;
	end;
	procedure them_ls;
	var
		i:integer;
	begin
		//m_khac.Lines.Add(FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime)+': '+'Nhập '+cbb_so_luong.Text+ ' - '+cbb_gia_von.Text+'/'+cbb_gia_ban.text+' - ');
//		for I := m_thong_tin.lines.Count-1 to High do
//		begin
//			 m_khac.Lines.Add(m_thong_tin.Lines[i]);
//		end;
		//m_khac.Lines.Add(cach_ls);
		m_khac.Lines.Insert(0,cach_ls);
		i := m_thong_tin.lines.Count;
		while i>0 do
		begin
			 m_khac.Lines.Insert(0,m_thong_tin.Lines[i-1]);
			 dec(i);
		end;
		m_khac.Lines.Insert(0,FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime)+': '+'Thêm '+cbb_so_luong.Text+ ' - '+cbb_gia_von.Text+'/'+cbb_gia_ban.text+' - ');
	end;
begin
	if lua_chon=1 then
	begin
		//e_ngay_hoan_thanh.Text := '';
		ngay_cn := DateTimeToStr(now);
	end;
	if cbb_ten.Text = '' then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập tên Vật Tư';
		tm1.Enabled := true;
	end
	else
	begin
		begin
			dong_dl := '';
			dong_thong_tin := n_dong_chuoi_mm(m_thong_tin);
			//dong_khac:=n_dong_chuoi_mm(m_khac);
			if lua_chon=1 then
			begin
				m_khac.clear;
				them_ls;
				dong_khac:=n_dong_chuoi_mm(m_khac);
				//m_khac.Lines.Add(FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime)+': '+'Thêm '+cbb_so_luong.Text+ ' - '+cbb_gia_von.Text+'/'+cbb_gia_ban.text+' - '+m_thong_tin.Lines[0]);
				them(ma_vat_tu); // 1
				ttp_ngay_cn.DateTime:=now;
			end
			else
			begin
				dong_khac:=n_dong_chuoi_mm(m_khac);
				them(ma_vat_tu_ht); // 1
				ttp_ngay_cn.DateTime:=now;
			end;
			
			them(cbb_ten.Text); // 2
			them(cbb_ma.Text); // 3
			//them(DateTimeToStr(ttp_ngay_cn.DateTime)); // 4
			them(FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime));
			them(dong_thong_tin); // 5
			them(dong_khac); // 6
			them(cbb_gia_von.Text); // 7
			them(cbb_gia_ban.Text); // 8
			them(cbb_so_luong.Text); // 9
			them('0'); // 10

			if lua_chon=1 then
			begin
				ma_vat_tu:=tang_chuoi_so_5(ma_vat_tu);
				f_dl.lb_vat_tu.Items.Add(dong_dl);
			end
			else
			begin
				lb_sua(f_dl.lb_vat_tu,dong_dl);
			end;
		end;
		//f_dl.lb_thau_kinh_luu;
		tm1.Enabled := true;
		sttb1.Panels[0].Text := 'Thành công';
		lb_so_kh.Caption := 'Số Vật Tư: ' +IntToStr(f_dl.lb_vat_tu.Items.Count-1);
		lb_lv(f_dl.lb_vat_tu,lv_vat_tu);
		if cbb_nhom_vat_tu.ItemIndex=1 then
			f_dl.lb_vat_tu_luu1;
		luu_thong_so;
	end;
end;
//======================================== 
procedure Tf_quan_ly_vat_tu.lv_vat_tuMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	thong_tin: string;
	khac:string;
begin
	if lv_vat_tu.itemindex <> -1 then
	begin
		ListItem := lv_vat_tu.Items[lv_vat_tu.ItemIndex];
		with ListItem do
		begin
			ma_vat_tu_ht:=Caption;
			cbb_ten.Text:= SubItems.Strings[0];
			cbb_ma.Text:= SubItems.Strings[1];
			//cbb_dia_chi.Text := SubItems.Strings[1];
			khac := SubItems.Strings[4];
			thong_tin := SubItems.Strings[3];
			cbb_gia_von.Text:=SubItems.Strings[5];
			cbb_gia_ban.Text:=SubItems.Strings[6];
			cbb_so_luong.Text:=ListItem.SubItems.Strings[7];
			so_luong_cu:=cbb_so_luong.Text;
			gia_von_cu:=cbb_gia_von.Text;
			gia_ban_cu:=cbb_gia_ban.Text;
			thong_tin:= StringReplace(thong_tin, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
			m_thong_tin.Text := thong_tin;
			khac:= StringReplace(khac, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
			m_khac.Text:=khac;
		end;
	end;
end;
procedure Tf_quan_ly_vat_tu.lv_vat_tu_timMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	thong_tin: string;
	khac:string;
begin
	if lv_vat_tu_tim.itemindex <> -1 then
	begin
		ListItem := lv_vat_tu_tim.Items[lv_vat_tu_tim.ItemIndex];
		with ListItem do
		begin
			ma_vat_tu_ht:=Caption;
			cbb_ten.Text:= SubItems.Strings[0];
			cbb_ma.Text:= SubItems.Strings[1];
			//cbb_dia_chi.Text := SubItems.Strings[1];
			khac := SubItems.Strings[4];
			thong_tin := SubItems.Strings[3];
			cbb_gia_von.Text:=SubItems.Strings[5];
			cbb_gia_ban.Text:=SubItems.Strings[6];
			cbb_so_luong.Text:=ListItem.SubItems.Strings[7];
			so_luong_cu:=cbb_so_luong.Text;
			gia_von_cu:=cbb_gia_von.Text;
			gia_ban_cu:=cbb_gia_ban.Text;
			thong_tin:= StringReplace(thong_tin, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
			m_thong_tin.Text := thong_tin;
			khac:= StringReplace(khac, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
			m_khac.Text:=khac;
		end;
	end;
end;

procedure Tf_quan_ly_vat_tu.l_vonClick(Sender: TObject);
begin
	tinh_tong_von;
end;

//---------------------------------------- 
procedure Tf_quan_ly_vat_tu.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := false;
end;

//======================================== 
//---------------------------------------- 
procedure Tf_quan_ly_vat_tu.b_timClick(Sender: TObject);
var 
	i:integer;
	vi_tri:integer;
	thong_tin: string;
	khac:string;
	lb:TListBox;
begin
//	if da_tim=False then
//	begin
//		da_tim:=true;
//		vi_tri_xem:=0;
//		lv_vat_tu_tim.Clear;
//		lb:=TListBox.Create(Self);
//		lb.Visible:=false;
//		//lb.Sorted:=True;
//		lb.Parent := Self;
//		tim_kiem_lb(cbb_tim.Text,f_dl.lb_thau_kinh,lb);
//		lb_lv(lb,lv_vat_tu_tim);
//		lv_vat_tu_tim.CustomSort(@Sap_xep_so_lv,-10);
//		lb.Free;
//	end;


	if da_tim=False then
	begin
		da_tim:=true;
		vi_tri_xem:=0;
		lv_vat_tu_tim.Clear;
		tu_vua_tim:=cbb_tim.Text;
		tu_tra:= tu_vua_tim;
		//sed_nghia.Lines.Clear;
		if cb_tim_nang_cao.Checked=false then
		begin
			for i:=1 to f_dl.lb_vat_tu.Items.Count-1 do  // tìm kiếm toàn bộ từ
			begin
				tu_tra:=bo_dau(tu_tra);
				tu_tra:= LowerCase(tu_tra);
				nghia_tu:=f_dl.lb_vat_tu.Items[i];
				nghia_tu:=bo_dau(nghia_tu);
				nghia_tu:=LowerCase(nghia_tu);
				vi_tri:=AnsiPos(tu_tra,nghia_tu); // tim tu trong dong
				if vi_tri>0 then
				begin
					giai_ma_dl(i);
				end;
			end;
			so_tu_tim_thay:=lv_vat_tu_tim.Items.Count;
			//l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' mục';
		end
		else
		begin  // tim kiếm tưng từ.co trong chuoi tim
			for i:=1 to f_dl.lb_vat_tu.Items.Count-1 do  // tìm kiếm toàn bộ từ
			begin
				nghia_tu:=f_dl.lb_vat_tu.Items[i];
//				nghia_tu:=bo_dau(nghia_tu);
//				nghia_tu:=LowerCase(nghia_tu);
				ty_le:=tim_tung_tu_kttt(tu_tra,nghia_tu);
				if ty_le>0 then
				begin
					giai_ma_dl(i);
				end;
			end;
			//(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv,column.index)
			//(Sender as TCustomListView).6(@Sap_xep_so_lv,column.index;
			lv_vat_tu_tim.CustomSort(@Sap_xep_so_lv,-10);
			so_tu_tim_thay:=lv_vat_tu_tim.Items.Count;
			//l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' mục';
		end;
	end;
	if so_tu_tim_thay>0 then
	begin
		ListItem := lv_vat_tu_tim.Items[vi_tri_xem];
//		vi_tri_chon:= StrToInt(ListItem.SubItems.Strings[4]);
		l_ma.Caption:=ListItem.Caption;
		ma_vat_tu_ht:=l_ma.Caption;
		cbb_ten.Text:=ListItem.SubItems.Strings[0];
		cbb_ma.Text:=ListItem.SubItems.Strings[1];
		//ttp_ngay_cn.DateTime:=FormatDateTime(dinh_dang_ntn,ListItem.SubItems.Strings[2]);//Format//StrToDate(ListItem.SubItems.Strings[2]);
		khac := ListItem.SubItems.Strings[4];
		thong_tin := ListItem.SubItems.Strings[3];
		cbb_gia_von.Text:=ListItem.SubItems.Strings[5];
		cbb_gia_ban.Text:=ListItem.SubItems.Strings[6];
		cbb_so_luong.Text:=ListItem.SubItems.Strings[7];
		so_luong_cu:=cbb_so_luong.Text;
		gia_von_cu:=cbb_gia_von.Text;
		gia_ban_cu:=cbb_gia_ban.Text;
		thong_tin:= StringReplace(thong_tin, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_thong_tin.Text := thong_tin;
		khac:= StringReplace(khac, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_khac.Text:=khac;
		vi_tri_xem:=vi_tri_xem+1;
		if vi_tri_xem>=so_tu_tim_thay then vi_tri_xem:=0;
	end;	
end;
//======================================== 
procedure Tf_quan_ly_vat_tu.b_chuyen_giaClick(Sender: TObject);
var 
	gia_ban:extended;
begin
	gia_ban:=StrToFloat(cbb_gia_von.text)+StrToFloat(cbb_gia_von.text)/100*StrToFloat(cbb_pt.text);	
	cbb_gia_ban.Text:=FormatFloat('0',gia_ban);
end;

procedure Tf_quan_ly_vat_tu.b_nhapClick(Sender: TObject);
	var
	ngay_cn:string;
	dong_dl:string;
	dong_thong_tin:string;
	dong_khac:string;
	ty_le_loi_vt:Double;
	gia_ban_moi:Double;
	gia_von_moi:Double;
	a:integer;
	tong_so_luong:integer;
	const 
	cach_ls = '//====================';
	procedure them(c: string);
	begin
		dong_dl:=dong_dl+c+phan_cot;
	end;
	procedure tinh_gia_von;
	begin
		tong_so_luong:=StrToInt(so_luong_cu)+StrToInt(cbb_so_luong.text);
		gia_von_moi:=StrToInt(gia_von_cu)*StrToInt(so_luong_cu)+StrToInt(cbb_gia_von.Text)*StrToInt(cbb_so_luong.text);
		gia_von_moi:=gia_von_moi/tong_so_luong;
	end;
	procedure them_ls;
	var
		i:integer;
	begin
		m_khac.Lines.Insert(0,cach_ls);
		i := m_thong_tin.lines.Count;
		while i>0 do
		begin
			 m_khac.Lines.Insert(0,m_thong_tin.Lines[i-1]);
			 dec(i);
		end;
		m_khac.Lines.Insert(0,FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime)+': '+'Nhập '+cbb_so_luong.Text+ ' - '+cbb_gia_von.Text+'/'+cbb_gia_ban.text+' - ');
	end;
begin
	ngay_cn := DateTimeToStr(now);
	if cbb_ten.Text = '' then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập tên Vật Tư';
		tm1.Enabled := true;
	end
	else
	begin
		begin
			dong_dl := '';
			dong_thong_tin := n_dong_chuoi_mm(m_thong_tin);
			them_ls;
			gia_von_moi:=StrToFloat(cbb_gia_von.text);
			//m_khac.Lines.Add(FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime)+': '+'Nhập '+cbb_so_luong.Text+ ' - '+cbb_gia_von.Text+'/'+cbb_gia_ban.text+' - '+m_thong_tin.Lines[0]);
			ttp_ngay_cn.DateTime:=Now;
			dong_khac:=n_dong_chuoi_mm(m_khac);
			them(ma_vat_tu_ht); // 1
			them(cbb_ten.Text); // 2
			them(cbb_ma.Text); // 3
			//them(DateTimeToStr(ttp_ngay_cn.DateTime)); // 4
			them(FormatDateTime(dinh_dang_ntn,ttp_ngay_cn.DateTime));
			them(dong_thong_tin); // 5
			them(dong_khac); // 6
			ty_le_loi_vt:=StrToFloat(gia_ban_cu) / StrToFloat(gia_von_cu);
			tinh_gia_von;
			a:=Round(gia_von_moi);
			them(IntToStr(a)); // 7
			if cbb_gia_ban.Text='0' then
			begin
				 gia_ban_moi:=gia_von_moi*ty_le_loi_vt;
				 //tinh_gia_von;
				 them(IntToStr(Round(gia_ban_moi)));
			end
			else
      begin
				them(cbb_gia_ban.Text); // 8
			end;
			them(IntToStr(StrToInt(so_luong_cu)+StrToInt(cbb_so_luong.Text))); // 9
			them('0'); // 10
			lb_sua(f_dl.lb_vat_tu,dong_dl);
		end;
		//f_dl.lb_thau_kinh_luu;
		tm1.Enabled := true;
		sttb1.Panels[0].Text := 'Thành công';
		lb_so_kh.Caption := 'Số Vật Tư: ' +IntToStr(f_dl.lb_vat_tu.Items.Count-1);
		lb_lv(f_dl.lb_vat_tu,lv_vat_tu);
		luu_thong_so;
	end;
	tinh_tong_von;
end;

procedure Tf_quan_ly_vat_tu.b_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
		tinh_tong_von;
end;

procedure Tf_quan_ly_vat_tu.b_themClick(Sender: TObject);
begin
	them_dl(1);
	tinh_tong_von;
end;

procedure Tf_quan_ly_vat_tu.b_xoa_mucClick(Sender: TObject);
begin
	if lv_vat_tu.ItemIndex>=0 then
	begin
		if MessageDlg('Bạn có muốn xóa mục này!?', mtConfirmation, [mbYes, mbNo], 0) = idYes
		then
		begin
			lb_xoa(f_dl.lb_vat_tu,ma_vat_tu_ht);
			if cbb_nhom_vat_tu.ItemIndex=0 then
			begin
				f_dl.lb_vat_tu_luu;
			end;
			if cbb_nhom_vat_tu.ItemIndex=1 then
			begin
				f_dl.lb_vat_tu_luu1;
			end;
			luu_thong_so;
			lb_so_kh.Caption := 'Số Thấu kính: ' + IntToStr(f_dl.lb_vat_tu.Items.Count-1);
			lv_vat_tu.Items.Delete(lv_vat_tu.itemindex);
		end;
	end;
	tinh_tong_von;
end;

procedure Tf_quan_ly_vat_tu.cbb_gia_banChange(Sender: TObject);
begin
	cbb_gia_ban.Hint:=so_ra_chu(strtoint64(cbb_gia_ban.Text),sai,dung);
end;

procedure Tf_quan_ly_vat_tu.cbb_gia_vonChange(Sender: TObject);
begin
	cbb_gia_von.Hint:=so_ra_chu(strtoint64(cbb_gia_von.Text),sai,dung);
end;

procedure Tf_quan_ly_vat_tu.cbb_nhom_vat_tuChange(Sender: TObject);
begin
	if cbb_nhom_vat_tu.ItemIndex=0 then
	begin
		f_dl.lb_Vat_tu.Clear;
		f_dl.lb_vat_tu_tai;
	end;
	if cbb_nhom_vat_tu.ItemIndex=1 then
	begin
		f_dl.lb_Vat_tu.Clear;
		f_dl.lb_vat_tu_tai1;
	end;
	//f_dl.lb_vat_tu_luu_lv(lv_vat_tu);
	lb_lv(f_dl.lb_vat_tu,lv_vat_tu);
end;

procedure Tf_quan_ly_vat_tu.cbb_timChange(Sender: TObject);
begin
	da_tim:=false;
end;

procedure Tf_quan_ly_vat_tu.cbb_timKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then begin
		b_tim.Click;
		key:= #0;
	end;
end;

procedure Tf_quan_ly_vat_tu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	luu_thong_so;
end;

procedure Tf_quan_ly_vat_tu.FormCreate(Sender: TObject);
begin
	lb_lv(f_dl.lb_vat_tu,lv_vat_tu);
	doc_thong_so;
end;

procedure Tf_quan_ly_vat_tu.lv_vat_tuColumnClick(Sender: TObject;
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
		//f_dl.lb_vat_tu_luu_lv(lv_vat_tu,7);
end;

procedure Tf_quan_ly_vat_tu.lv_vat_tuCompare(Sender: TObject; Item1,
	Item2: TListItem; Data: Integer; var Compare: Integer);
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

procedure Tf_quan_ly_vat_tu.giai_ma_dl(vi_tri:integer);
var
	j: integer;
	vi_tri_cuoi: integer;
	ListItem: TListItem;
	a: array [0..11] of string;
	dong_dl:string;
begin
	dong_dl:=f_dl.lb_vat_tu.items[vi_tri];
		for j := 0 to 9 do
		begin
			vi_tri_cuoi := AnsiPos(phan_cot, dong_dl);
			a[j]:=copy(dong_dl, 1, vi_tri_cuoi-1);
			dong_dl:=copy(dong_dl,vi_tri_cuoi+2,Length(dong_dl));
		end;
		ListItem := lv_vat_tu_tim.Items.Add;
		with ListItem do
		begin
			Caption := a[0];
			SubItems.Add(a[1]);
			SubItems.Add(a[2]);
			SubItems.Add(a[3]);
			SubItems.Add(a[4]);
			SubItems.Add(a[5]);
			SubItems.Add(a[6]);
			SubItems.Add(a[7]);
			SubItems.Add(a[8]);
			SubItems.Add(a[9]);
			if cb_tim_nang_cao.Checked=true then SubItems.Add(IntToStr(ty_le))
			else SubItems.Add('0');
			//SubItems.Add(IntToStr(vi_tri));
		end;
	end;
end.

