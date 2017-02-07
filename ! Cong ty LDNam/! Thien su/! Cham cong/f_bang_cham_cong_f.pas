unit f_bang_cham_cong_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,
	Vcl.ComCtrls, Vcl.ExtCtrls,LDNam_sys,LDNam_xu_ly_du_lieu,f_dl_f,System.UITypes;

type
  Tf_bang_cham_cong = class(TForm)
    lv_cham_cong: TListView;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cbb_tim: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbb_dien_thoai: TComboBox;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    b_xoa: TButton;
    b_sua: TButton;
    b_them: TButton;
    b_xoa_muc: TButton;
    sttb1: TStatusBar;
    tm1: TTimer;
    dtp_ngay_vao_lam: TDateTimePicker;
    lb_so_kh: TLabel;
    cbb_dia_chi: TComboBox;
    cbb_email: TComboBox;
    m_thong_tin: TMemo;
    cbb_ten: TComboBox;
    cbb_gioi: TComboBox;
    Label3: TLabel;
    cbb_chuc_vu: TComboBox;
    cbb_noi_sinh: TComboBox;
    Label7: TLabel;
    dtp_ngay_sinh: TDateTimePicker;
    cbb_hon_nhan: TComboBox;
    cbb_tam_tru: TComboBox;
    cbb_chuyen_mon: TComboBox;
    cbb_so_thich: TComboBox;
    cbb_cao: TComboBox;
    cbb_nang: TComboBox;
    Label5: TLabel;
    cbb_dan_toc: TComboBox;
    procedure FormCreate(Sender: TObject);
		procedure b_themClick(Sender: TObject);
		procedure them_dl(lua_chon: byte);
    procedure tm1Timer(Sender: TObject);
    procedure b_xoa_mucClick(Sender: TObject);
    procedure lv_cham_congMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure b_suaClick(Sender: TObject);
    procedure lv_cham_congColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv_cham_congCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: Integer; var Compare: Integer);
		procedure luu_thong_so;
		//procedure luu_ts_them(ts:string);
		procedure doc_thong_so;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure cbb_dia_chiChange(Sender: TObject);
    procedure cbb_emailChange(Sender: TObject);
  private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
  public
    { Public declarations }
  end;

var
	f_bang_cham_cong: Tf_bang_cham_cong;
	ma_cham_cong:string;
	ma_cham_cong_ht:string; // ma thấu kính hiển thị

implementation

{$R *.dfm}
procedure Tf_bang_cham_cong.doc_thong_so;
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
	dong:=f_dl.lb_cham_cong.Items[0];
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,dong)-1 ;
	for j := 0 to so_dl do
	begin
		vi_tri_cuoi := AnsiPos(phan_cot, dong);
		a[j]:=copy(dong, 1, vi_tri_cuoi-1);
		dong:=copy(dong,vi_tri_cuoi+2,Length(dong));
	end;
	f_bang_cham_cong.Left:=tach_s(a[1]);
	f_bang_cham_cong.top:=tach_s(a[2]);
	ma_cham_cong:= tach_c_md(a[3],'TS000000');
	for i := 0 to so_dl-4 do
	begin
		lv_cham_cong.Columns[i].Width:=tach_s_md(a[i+4],50);
	end;
end;
//======================================== 
procedure Tf_bang_cham_cong.luu_thong_so;
var
	dong:string;
	i:integer;
	so_dl:integer;
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
	dong:=phien_ban_du_lieu+phan_cot;
	them_s(f_bang_cham_cong.Left); // 1
	them_s(f_bang_cham_cong.Top); // 2
	them_c(ma_cham_cong); // 3
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,f_dl.lb_thien_su.Items[0])-1 ;
	for i := 0 to so_dl-4 do
	begin
		them_s(lv_cham_cong.Columns[i].Width);
	end;
	f_dl.lb_cham_cong.Items[0]:=dong;
	f_dl.lb_cham_cong_luu;
	//them_c('1111');
end;
//======================================== 
procedure Tf_bang_cham_cong.them_dl(lua_chon: byte);
var
	ngay_cn:string;
	dong_dl:string;
	dong_thong_tin:string;
	ho,ten:string;
	procedure them(c: string);
	begin
		dong_dl:=dong_dl+c+phan_cot;
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
			if lua_chon=1 then
			begin
				them(ma_cham_cong); // 1
			end
			else
			begin
				them(ma_cham_cong_ht); // 1
			end;
			ho:=cbb_ten.Text;
			tach_ho_ten(ho,ten);
			them(ho); // 2
			them(ten);
			them(cbb_gioi.Text); // 3
			them(DateTimeToStr(dtp_ngay_sinh.DateTime)); // 4
			them(cbb_noi_sinh.Text);
			them(cbb_hon_nhan.Text);
			them(cbb_dia_chi.Text);
			them(cbb_tam_tru.Text);
			them(cbb_dien_thoai.Text);
			them(cbb_email.Text);
			them(cbb_chuc_vu.Text);
			them(DateTimeToStr(dtp_ngay_vao_lam.DateTime));
			them(cbb_chuyen_mon.Text);
			them(cbb_so_thich.Text);
			them(cbb_cao.Text);
			them(cbb_nang.Text);
			them(dong_thong_tin); // 5			
			them(cbb_dan_toc.Text);
			if lua_chon=1 then
			begin
				ma_cham_cong:=tang_chuoi_so_5(ma_cham_cong);
				f_dl.lb_cham_cong.Items.Add(dong_dl);
			end
			else
			begin
				lb_sua(f_dl.lb_cham_cong,dong_dl);
			end;
		end;
		//f_dl.lb_thau_kinh_luu;
		tm1.Enabled := true;
		sttb1.Panels[0].Text := 'Thành công';
		lb_so_kh.Caption := 'Số Vật Tư: ' +IntToStr(f_dl.lb_cham_cong.Items.Count-1);
		lb_lv(f_dl.lb_cham_cong,lv_cham_cong);
		luu_thong_so;
	end;
end;
//======================================== 
procedure Tf_bang_cham_cong.lv_cham_congMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	thong_tin: string;
begin
	if lv_cham_cong.itemindex <> -1 then
	begin
		ListItem := lv_cham_cong.Items[lv_cham_cong.ItemIndex];
		with ListItem do
	begin
		ma_cham_cong_ht:=Caption;
		cbb_ten.Text:= SubItems.Strings[0]+' '+SubItems.Strings[1];
		cbb_gioi.Text:= SubItems.Strings[2];
		dtp_ngay_sinh.Date:=StrToDate(SubItems.Strings[3]);
		//cbb_dia_chi.Text := SubItems.Strings[1];
		cbb_noi_sinh.text := SubItems.Strings[4];
		cbb_hon_nhan.text := SubItems.Strings[5];
		cbb_dia_chi.text := SubItems.Strings[6];
		cbb_tam_tru.text := SubItems.Strings[7];
		cbb_dien_thoai.text := SubItems.Strings[8];
		cbb_email.text := SubItems.Strings[9];
		cbb_chuc_vu.text := SubItems.Strings[10];
		dtp_ngay_vao_lam.Date:=StrToDate(SubItems.Strings[11]);
		cbb_chuyen_mon.text := SubItems.Strings[12];
		cbb_so_thich.text := SubItems.Strings[13];
		cbb_cao.text:= SubItems.Strings[14];
		cbb_nang.text := SubItems.Strings[15];
		thong_tin := SubItems.Strings[16];
		cbb_dan_toc.text := SubItems.Strings[17];
		thong_tin:= StringReplace(thong_tin, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_thong_tin.Text := thong_tin;
	end;
	end;
end;
//---------------------------------------- 
procedure Tf_bang_cham_cong.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := false;
end;

//======================================== 
//---------------------------------------- 
procedure Tf_bang_cham_cong.Button2Click(Sender: TObject);
begin
	ma_cham_cong:=tang_chuoi_so_5(ma_cham_cong);
end;

procedure Tf_bang_cham_cong.b_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
end;

procedure Tf_bang_cham_cong.b_themClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_bang_cham_cong.b_xoa_mucClick(Sender: TObject);
begin
	if lv_cham_cong.ItemIndex>=0 then
	begin
		if MessageDlg('Bạn có muốn xóa mục này!?', mtConfirmation, [mbYes, mbNo], 0) = idYes
		then
		begin
			lb_xoa(f_dl.lb_cham_cong,ma_cham_cong_ht);
			f_dl.lb_cham_cong_luu;
			luu_thong_so;
			lb_so_kh.Caption := 'Số Thấu kính: ' + IntToStr(f_dl.lb_cham_cong.Items.Count-1);
			lv_cham_cong.Items.Delete(lv_cham_cong.itemindex);
		end;
	end;
end;

procedure Tf_bang_cham_cong.cbb_emailChange(Sender: TObject);
begin
	//cbb_gia_ban.Hint:=so_ra_chu(strtoint64(cbb_gia_ban.Text),sai,dung);
end;

procedure Tf_bang_cham_cong.cbb_dia_chiChange(Sender: TObject);
begin
	//cbb_gia_von.Hint:=so_ra_chu(strtoint64(cbb_gia_von.Text),sai,dung);
end;

procedure Tf_bang_cham_cong.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	luu_thong_so;
end;

procedure Tf_bang_cham_cong.FormCreate(Sender: TObject);
begin
	lb_lv(f_dl.lb_cham_cong,lv_cham_cong);
	doc_thong_so;
end;

procedure Tf_bang_cham_cong.lv_cham_congColumnClick(Sender: TObject;
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
		//f_dl.lb_cham_cong_luu_lv(lv_cham_cong,7);
end;

procedure Tf_bang_cham_cong.lv_cham_congCompare(Sender: TObject; Item1,
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



end.

