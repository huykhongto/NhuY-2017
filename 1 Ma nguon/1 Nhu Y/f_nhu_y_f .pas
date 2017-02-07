unit f_nhu_y_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,
	Vcl.ComCtrls, Vcl.ExtCtrls,LDNam_sys,LDNam_xu_ly_du_lieu,f_dl_f,LDNam_sys_thoi_gian,
	DateUtils,Printers,System.UITypes;

type
  Tf_nhu_y_f = class(TForm)
    lv_cham_cong: TListView;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cbb_tim: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    b_xoa: TButton;
    b_sua: TButton;
    b_them: TButton;
    b_xoa_muc: TButton;
		sttb1: TStatusBar;
    tm1: TTimer;
    m_ghi_nhan: TMemo;
    cbb_ten: TComboBox;
    cbb_noi_sinh: TComboBox;
    Edit2: TEdit;
    PrintDialog1: TPrintDialog;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
		
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
		procedure tao_nen_thu();
		procedure pn_ngayClick(Sender: TObject);
		procedure pn_hien_thi_thangClick(Sender: TObject);
		procedure tao_pn_thu;
    procedure cbb_thangChange(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure tai_du_lieu;
		procedure xuat_cong_cham;
		procedure luu_cham_cong;

		procedure them_c_dl(ts:string);
		procedure them_c_cot(var ts:string);
		procedure Label15Click(Sender: TObject);
		procedure cap_nhat_danh_sach_cham_cong(lb_ds: TListBox);
		procedure cap_nhat_lv;
	private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
		pn_ngay : array[1..38] of TPanel;
		l_ngay : array[1..38] of TLabel;
		cbb_cong : array[1..38] of TComboBox;
		cbb_them_gio: array[1..38] of TComboBox;
  public
    { Public declarations }
	end;

var
	f_nhu_y: Tf_nhu_y_f;
	ma_cham_cong:string;
	ma_cham_cong_ht,cong_cham:string; // ma thấu kính hiển thị
	ghi_nhan:string;
	vi_tri_ndt:integer; // vi tri ngay dau của tháng
	so_ngay_cua_thang:integer;
	ma,ho,ten,noi_sinh:string;
	dong_dl:string;

	so_ngay_lam_viec:integer;
	so_ngay_da_lam:integer;
	so_gio_tang_ca_1_5:integer;
	so_gio_tang_ca_2:integer;
	luong_ngay:integer;
	tong_luong_lanh:integer;
	tong_phu_cap:integer;
	luong_tc:integer;

	ngay_hien_tai,thang_hien_tai,nam_hien_tai:integer;
const 
	may_in_mac_dinh = 'Foxit Reader PDF Printer';

implementation

{$R *.dfm}
//======================================== 
procedure Tf_nhu_y_f.them_c_dl(ts:string);
begin
	dong_dl:=dong_dl+ts+phan_dl;
end;
procedure Tf_nhu_y_f.them_c_cot(var ts:string);
begin
	dong_dl:=dong_dl+ts+phan_cot;
end;
procedure Tf_nhu_y_f.cap_nhat_lv;
var
ListItem: TListItem;
begin
	ListItem:=lv_cham_cong.Items[lv_cham_cong.ItemIndex];
		with ListItem do
		begin
			//Caption:= ma;
			//SubItems.Strings[0]:=ho;
			//SubItems.Strings[1]:=ten;
			//SubItems.Strings[2]:=noi_sinh;
			SubItems.Strings[3]:=ghi_nhan;
			SubItems.Strings[4]:=cong_cham;
		end;
end;
//======================================== 
procedure Tf_nhu_y_f.luu_cham_cong;
var 
	i: integer;
	k:integer;


begin
	dong_dl:='';
	for I := vi_tri_ndt to so_ngay_cua_thang+vi_tri_ndt-1 do
	begin
		them_c_dl(cbb_cong[i].Text);
		them_c_dl(cbb_them_gio[i].Text);
		for k := 0 to 1 do
		begin
			them_c_dl('');
		end;
	end;
	cong_cham:=dong_dl;
	dong_dl:='';
	dong_dl:=dong_dl+ma_cham_cong_ht+phan_cot;
	ghi_nhan:=m_ghi_nhan.Text;
	ghi_nhan:= StringReplace(ghi_nhan, Chr($0D) + Chr($0A),phan_dong, [rfReplaceAll]);
	dong_dl:=dong_dl+ghi_nhan+phan_cot;
	dong_dl:=dong_dl+cong_cham+phan_cot;
	lb_sua(f_dl.lb_cham_cong,dong_dl);
	f_dl.lb_cham_cong_luu;
end;
//======================================== 
procedure Tf_nhu_y_f.xuat_cong_cham;
var dong_dl:string;
	i: integer;
	j:integer;
	a: array [0..3] of string;
	b:string;
begin
	dong_dl:=cong_cham;
	j:=vi_tri_ndt;
	so_ngay_da_lam:=0;
	so_gio_tang_ca_1_5:=0;
	if dong_dl='' then
	begin
		for I := 1 to 38 do
		begin
			cbb_cong[i].Text:='';
			cbb_them_gio[i].text:='';
    end;
			
  end;
	
	while Length(dong_dl)>0 do
	begin
		for I := 0 to 3 do
		begin
			a[i]:=tach_dong_dl(dong_dl);
		end;
		cbb_cong[j].Text:=a[0];
		cbb_them_gio[j].text:=a[1];
		b:=a[1];
		if a[0]='c' then
			inc(so_ngay_da_lam);
		if a[1]<>'' then
			so_gio_tang_ca_1_5:=so_gio_tang_ca_1_5+strtoint(b);
		
		inc(j);
	end;
	end;
//========================================
procedure Tf_nhu_y_f.cap_nhat_danh_sach_cham_cong(lb_ds: TListBox);
var ma_ts:string;
	i,j: integer;
	dong_dl: string;
	//---------------------------------------- 
	function so_sanh(c:string):bool;
	var k:integer;
		dl:string;
	begin
		Result:=sai;
		for k := 1 to lb_ds.Items.Count-1 do
		begin
			dl := lb_ds.Items[k];
			if AnsiPos(c,dl)>0 then
			begin
				Result:=dung;
				lb_ds.Items.Delete(k);
				break;
      end;
    end;
	end;
	//---------------------------------------- 
	procedure them_cc; // them cham cong
	var
	dong_dl: string;
	begin
		dong_dl:=ma+phan_cot+ho+phan_cot+ten+phan_cot+noi_sinh+phan_cot+phan_cot+phan_cot;
		f_dl.lb_cham_cong.items.Insert(2,dong_dl);
	end;
	//---------------------------------------- 
begin
	i:=2;
	dong_dl := f_dl.lb_cham_cong.Items[i];
	while Pos(phan_cot,dong_dl)>0 do
	begin
		ma_ts:=tach_cot(dong_dl);
		inc(i);
		dong_dl := f_dl.lb_cham_cong.Items[i];
		so_sanh(ma_ts);
	end;
	if lb_ds.Items.Count>1 then
	begin
		for j := 1 to lb_ds.Items.Count-1 do
		begin
			dong_dl := lb_ds.Items[j];
			ma:=tach_cot(dong_dl);

			them_cc;
		end;
	end;
end;
//======================================== 
procedure Tf_nhu_y_f.tai_du_lieu;
var
	thoi_gian:string;
	ListItem: TListItem;
	const 
	rong_p_thu=50;
	cao_p_thu=69;
	cach_p=1;
	cao_pn_cham_cong = (cao_p_thu+1)*3;
	rong_form_md=rong_p_thu*14+28;

	
	
	//nam:  string;
	procedure tai_ds;
	var
	dong_dl: string;
	begin
		dong_dl := f_dl.lb_ds_cham_cong.Items[1];
		ma:=tach_cot(dong_dl);
		//ho:=tach_cot;
		//ten:=tach_cot;
		//noi_sinh:=tach_cot;
	end;
	procedure them_cc; // them cham cong
	var
	dong_dl: string;
	begin
		dong_dl:=ma+phan_cot+ho+phan_cot+ten+phan_cot+noi_sinh+phan_cot+phan_cot+phan_cot;
		f_dl.lb_cham_cong.items.Insert(2,dong_dl);
	end;
	procedure xem_lv;
	begin
		ListItem:=lv_cham_cong.Items.Add;
		with ListItem do
		begin
			Caption:= ma;
			SubItems.Add(ho);
			SubItems.Add(ten);
			SubItems.Add(noi_sinh);
			SubItems.Add(ghi_nhan);
			SubItems.Add(cong_cham);
			//if cb_tim_nang_cao.Checked=true then SubItems.Add(IntToStr(ty_le));
			//Checked:=False;
		end;
end;
	procedure tai_dl;
	var
	i: integer;
	dong_dl: string;
	dong_dl_2: string;
	begin
		i:=2;
		dong_dl := f_dl.lb_cham_cong.Items[i];
 		while Pos(phan_cot,dong_dl)>0 do
		begin
			ma:=tach_cot(dong_dl);
			ghi_nhan:=tach_cot(dong_dl);
			cong_cham:=tach_cot(dong_dl);
			dong_dl_2:=lb_tro(f_dl.lb_thien_su,ma);
			ma:=tach_cot(dong_dl_2);
			ho:=tach_cot(dong_dl_2);
			ten:=tach_cot(dong_dl_2);
			tach_cot(dong_dl_2);
			tach_cot(dong_dl_2);
			noi_sinh:=tach_cot(dong_dl_2);
			inc(i);
			dong_dl := f_dl.lb_cham_cong.Items[i];
			xem_lv;
		end;
	end;
begin
	ngay_hien_tai:=DayOf(now);
	thang_hien_tai:=MonthOf(now);
	nam_hien_tai:=YearOf(Now);
	thoi_gian:=IntToStr(thang_hien_tai)+'/'+IntToStr(nam_hien_tai);
	if f_dl.lb_cham_cong.items.Count<2 then
	begin
		 f_dl.lb_cham_cong.items.Insert(1,thoi_gian);
		 tai_ds;
		 them_cc;
		 f_dl.lb_cham_cong_luu;
	end
	else
	if f_dl.lb_cham_cong.items[1]<>thoi_gian  then
	begin
		 f_dl.lb_cham_cong.items.Insert(1,thoi_gian);
		 tai_ds;
		 them_cc;
		 f_dl.lb_cham_cong_luu;
	end
	else
	begin
		tai_dl;
		cap_nhat_danh_sach_cham_cong(f_dl.lb_ds_cham_cong);
	end;
end;

procedure Tf_nhu_y_f.doc_thong_so;
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
	f_nhu_y.Left:=tach_s(a[1]);
	f_nhu_y.top:=tach_s(a[2]);
	ma_cham_cong:= tach_c_md(a[3],'CC000000');
	for i := 0 to so_dl-4 do
	begin
		lv_cham_cong.Columns[i].Width:=tach_s_md(a[i+4],50);
	end;
end;
//======================================== 
procedure Tf_nhu_y_f.luu_thong_so;
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
	them_s(f_nhu_y.Left); // 1
	them_s(f_nhu_y.Top); // 2
	them_c(ma_cham_cong); // 3
	//so_dl:=dem_chuoi_trong_chuoi(phan_cot,f_dl.lb_thien_su.Items[0])-1 ; 
	so_dl:=lv_cham_cong.Columns.Count;
	for i := 0 to so_dl-4 do
	begin
		them_s(lv_cham_cong.Columns[i].Width);
	end;
	f_dl.lb_cham_cong.Items[0]:=dong;
	f_dl.lb_cham_cong_luu;
	//them_c('1111');
end;
//======================================== 
procedure Tf_nhu_y_f.tao_pn_thu;
	const 
	rong_p_thu=50;
	cao_p_thu=69;
	cach_p=1;
	cao_pn_cham_cong = (cao_p_thu+1)*3;
	rong_form_md=rong_p_thu*14+28;
begin
end;
//======================================== 
procedure Tf_nhu_y_f.them_dl(lua_chon: byte);
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
			dong_thong_tin := n_dong_chuoi_mm(m_ghi_nhan);
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
			{them(cbb_gioi.Text); // 3
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
			them(cbb_dan_toc.Text);}
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
		//lb_so_kh.Caption := 'Số Vật Tư: ' +IntToStr(f_dl.lb_cham_cong.Items.Count-1);
		lb_lv(f_dl.lb_cham_cong,lv_cham_cong);
		luu_thong_so;
	end;
end;
//======================================== 
procedure Tf_nhu_y_f.lv_cham_congMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	ghi_nhan: string;
begin
	if lv_cham_cong.itemindex <> -1 then
	begin
		ListItem := lv_cham_cong.Items[lv_cham_cong.ItemIndex];
		with ListItem do
	begin
		ma_cham_cong_ht:=Caption;
		ho:=SubItems.Strings[0];
		ten:=SubItems.Strings[1];
		noi_sinh:= SubItems.Strings[2];
		cbb_ten.Text:= SubItems.Strings[0]+' '+SubItems.Strings[1];
		cbb_noi_sinh.text := SubItems.Strings[2];
		ghi_nhan := SubItems.Strings[3];
		ghi_nhan:= StringReplace(ghi_nhan, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_ghi_nhan.Text := ghi_nhan;
		cong_cham:=SubItems.Strings[4];
		xuat_cong_cham;
	end;
	end;
end;
procedure Tf_nhu_y_f.pn_ngayClick(Sender: TObject);
var i:integer;
begin
		for I := 1 to 38 do
		if Sender = pn_ngay[I] then
		begin
			cbb_cong[i].Enabled:=dung;
			cbb_them_gio[i].Enabled:=dung;
		end;
end;

procedure Tf_nhu_y_f.pn_hien_thi_thangClick(Sender: TObject);
begin
	luu_cham_cong;
	cap_nhat_lv;
end;

//---------------------------------------- 
procedure Tf_nhu_y_f.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := false;
end;

//======================================== 
//---------------------------------------- 
procedure Tf_nhu_y_f.Button1Click(Sender: TObject);
begin
	//f_nhu_y_f.se
	//f_nhu_y_f.FormCreate(f_cong_ty_ldnam);
	Printer.SetPrinter(may_in_mac_dinh,'','',0);
	Printer.Title:='BCC_L';
		f_nhu_y.PrintScale:=poProportional;
		//f_nhu_y_f.Position:=poOwnerFormCenter;
	f_nhu_y.Print;

end;

procedure Tf_nhu_y_f.Button2Click(Sender: TObject);
begin
	ma_cham_cong:=tang_chuoi_so_5(ma_cham_cong);
end;

procedure Tf_nhu_y_f.b_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
end;

procedure Tf_nhu_y_f.b_themClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_nhu_y_f.b_xoa_mucClick(Sender: TObject);
begin
	if lv_cham_cong.ItemIndex>=0 then
	begin
		if MessageDlg('Bạn có muốn xóa mục này!?', mtConfirmation, [mbYes, mbNo], 0) = idYes
		then
		begin
			lb_xoa(f_dl.lb_cham_cong,ma_cham_cong_ht);
			f_dl.lb_cham_cong_luu;
			luu_thong_so;
			//lb_so_kh.Caption := 'Số Thấu kính: ' + IntToStr(f_dl.lb_cham_cong.Items.Count-1);
			lv_cham_cong.Items.Delete(lv_cham_cong.itemindex);
		end;
	end;
end;

procedure Tf_nhu_y_f.cbb_emailChange(Sender: TObject);
begin
	//cbb_gia_ban.Hint:=so_ra_chu(strtoint64(cbb_gia_ban.Text),sai,dung);
end;

procedure Tf_nhu_y_f.cbb_thangChange(Sender: TObject);
begin
	tao_nen_thu();
end;

procedure Tf_nhu_y_f.cbb_dia_chiChange(Sender: TObject);
begin
	//cbb_gia_von.Hint:=so_ra_chu(strtoint64(cbb_gia_von.Text),sai,dung);
end;

procedure Tf_nhu_y_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	luu_thong_so;
end;
//========================================
procedure Tf_nhu_y_f.tao_nen_thu(); 
var
	i:integer;
	tg:string;
	thu:string;
	ngay_hom_nay:integer;
	thang,nam,ngay_thang_nam:string;
	a,b,c:word;
	so_ngay_nghi:integer;
	
	const 
	rong_p_thu=50;
	cao_p_thu=50;
	cach_p=2;
	
	//nam:  string;
begin
	//so_ngay_lam_viec:=31;
	tg:=FormatDateTime(dinh_dang_ntn,now);
	thu:=thu_now();
	
	ngay_hom_nay:=DayOf(now);
	nam:='2016';
	ngay_thang_nam:='1/'+thang+'/'+nam;
	so_ngay_cua_thang:=DaysInAMonth(2016,StrToInt(thang));
	DecodeDateWeek(strtodatetime(ngay_thang_nam),a,b,c);
	vi_tri_ndt:=c;
	for i := vi_tri_ndt to 7 do
	begin
		pn_ngay[i].Visible:=dung;
	end;
	for i := 1 to vi_tri_ndt-1 do
	begin
		pn_ngay[i].Visible:=sai;
	end;

	for i := 27 to so_ngay_cua_thang+vi_tri_ndt-1 do
	begin
		pn_ngay[i].Visible:=dung;
	end;
	for i := so_ngay_cua_thang+vi_tri_ndt to 38 do
	begin
		pn_ngay[i].Visible:=sai;
	end;
	
	for i := vi_tri_ndt to so_ngay_cua_thang+vi_tri_ndt do
	begin
		l_ngay[i].Caption:=IntToStr(i-vi_tri_ndt+1);
		cbb_cong[i].Enabled:=false;
		cbb_cong[i].Color:=clWindow;
		cbb_them_gio[i].Color:=clWindow;
	end;
	cbb_cong[ngay_hom_nay+vi_tri_ndt-1].Enabled:=dung;
	cbb_them_gio[ngay_hom_nay+vi_tri_ndt-1].Enabled:=dung;
	cbb_cong[ngay_hom_nay+vi_tri_ndt-1].Color:=clWebLightGreen;
	cbb_them_gio[ngay_hom_nay+vi_tri_ndt-1].Color:=clWebLightGreen;
	so_ngay_nghi:=(so_ngay_cua_thang+vi_tri_ndt);
	so_ngay_nghi:=so_ngay_nghi div 7;
	so_ngay_lam_viec:=so_ngay_cua_thang-so_ngay_nghi;
end;
//======================================== 
procedure Tf_nhu_y_f.FormCreate(Sender: TObject);
var
	ten: string;
begin
	ma:='';
	ho:='';
	ten:='';
	noi_sinh:='';
	ghi_nhan:='';

	//lb_lv(f_dl.lb_cham_cong,lv_cham_cong);
	//f_dl.lb_cham_cong_
	doc_thong_so;
 //	dtp_ngay_sinh.Format := dinh_dang_ntn;
	//dtp_ngay_vao_lam.Format:=dinh_dang_ntn;
	tao_pn_thu;
	tai_du_lieu;
end;

procedure Tf_nhu_y_f.Label15Click(Sender: TObject);
begin
	Printer.SetPrinter(may_in_mac_dinh,'','',0);
	Printer.Title:='BCC_L';
		f_nhu_y.PrintScale:=poProportional;
		//f_nhu_y_f.Position:=poOwnerFormCenter;
	f_nhu_y.Print;
end;

procedure Tf_nhu_y_f.lv_cham_congColumnClick(Sender: TObject;
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

procedure Tf_nhu_y_f.lv_cham_congCompare(Sender: TObject; Item1,
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

