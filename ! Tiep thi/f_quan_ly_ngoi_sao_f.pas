﻿unit f_quan_ly_ngoi_sao_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,
	Vcl.ComCtrls, Vcl.ExtCtrls,LDNam_sys,LDNam_xu_ly_du_lieu,f_dl_f,LDNam_dl;

type
  Tf_quan_ly_khach_hanh = class(TForm)
    lv_khach_hang: TListView;
    cbb_ten: TComboBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cbb_tim: TComboBox;
    b_tim: TButton;
    cbb_sdt: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbb_dia_chi: TComboBox;
    Label3: TLabel;
    m_thong_tin: TMemo;
    cbb_muc: TComboBox;
    Label4: TLabel;
    m_khac: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    b_xoa: TButton;
    b_sua: TButton;
    b_them: TButton;
    b_xoa_muc: TButton;
    sttb1: TStatusBar;
    tm1: TTimer;
    ttp_ngay_sinh: TDateTimePicker;
    lb_so_kh: TLabel;
    cbb_ngay_sinh: TComboBox;
    Label5: TLabel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    lv_ngoi_sao_tim: TListView;
    procedure FormCreate(Sender: TObject);
		procedure b_themClick(Sender: TObject);
		procedure them_dl(lua_chon: byte);
    procedure tm1Timer(Sender: TObject);
    procedure b_xoa_mucClick(Sender: TObject);
    procedure lv_khach_hangMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure b_suaClick(Sender: TObject);
    procedure lv_khach_hangColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv_khach_hangCompare(Sender: TObject; Item1, Item2: TListItem;
			Data: Integer; var Compare: Integer);
		procedure luu_thong_so;
		procedure ap_dung_thong_so;
    procedure b_timClick(Sender: TObject);
    procedure cbb_timChange(Sender: TObject);
    procedure cbb_timKeyPress(Sender: TObject; var Key: Char);
  private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
		da_tim:boolean;
		vi_tri_xem:integer;
	public
    { Public declarations }
  end;

var
	f_quan_ly_khach_hanh: Tf_quan_ly_khach_hanh;
	ma_ngoi_sao:string;
	ma_ngoi_sao_ht:string; // ma thấu kính hiển thị
	dl_ngoi_sao:TLDNam_dl;

implementation
                                 
{$R *.dfm}
procedure Tf_quan_ly_khach_hanh.ap_dung_thong_so;
var
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
begin
	dl_ngoi_sao.doc_thong_so;
	for I := 1 to dl_ngoi_sao.thong_so.Count do
	begin
		case i of
			1:f_quan_ly_khach_hanh.Left:=tach_s(dl_ngoi_sao.thong_so[i]);
			2:f_quan_ly_khach_hanh.top:=tach_s(dl_ngoi_sao.thong_so[i]);
			3:ma_ngoi_sao:= tach_c_md(dl_ngoi_sao.thong_so[i],'NS000000');
		end;
	end;
end;
//======================================== 
procedure Tf_quan_ly_khach_hanh.luu_thong_so;
begin
	dl_ngoi_sao.thong_so.Clear;
	dl_ngoi_sao.thong_so.Add(IntToStr(f_quan_ly_khach_hanh.Left));
	dl_ngoi_sao.thong_so.Add(IntToStr(f_quan_ly_khach_hanh.Top));
	dl_ngoi_sao.thong_so.Add(ma_ngoi_sao); 
	dl_ngoi_sao.luu_thong_so;
end;
//======================================== 
procedure Tf_quan_ly_khach_hanh.them_dl(lua_chon: byte);
var
	ngay_cn:string;
	dong_dl:string;
	dong_thong_tin:string;
	dong_khac:string;
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
		sttb1.Panels[0].Text := 'Bạn chưa nhập tên khach hang';
		tm1.Enabled := true;
	end
	else
	begin
		begin
			dong_dl := '';
		 if lua_chon=1 then
			begin
				them(ma_ngoi_sao); // 1
			end
			else
			begin
				them(ma_ngoi_sao_ht); // 1
			end;
			ho:=cbb_ten.Text;
			tach_ho_ten(ho,ten);
			ho:=ho+' '+ten;
			dong_thong_tin := n_dong_chuoi_mm(m_thong_tin);
			dong_khac:=n_dong_chuoi_mm(m_khac);   
			them(ho);
			them(cbb_ngay_sinh.Text);
			them(cbb_dia_chi.Text);
			them(cbb_sdt.text);
			them(dong_thong_tin);
			them(DateToStr(Now));
			them('');
			them(dong_khac);
			if lua_chon=1 then
			begin
				ma_ngoi_sao:=tang_chuoi_so_5(ma_ngoi_sao);
				dl_ngoi_sao.sl_dl.Add(dong_dl);
			end
			else
			begin
				sl_sua(dl_ngoi_sao.sl_dl,dong_dl);
			end;
		end;
		luu_thong_so;
		tm1.Enabled := true;
		sttb1.Panels[0].Text := 'Thành công';
		lb_so_kh.Caption := 'Số Ngôi sao: ' +IntToStr(dl_ngoi_sao.sl_dl.Count-1);
		sl_lv(dl_ngoi_sao.sl_dl,lv_khach_hang);
	end;
end;
procedure Tf_quan_ly_khach_hanh.tm1Timer(Sender: TObject);
begin
	sttb1.Panels[0].Text := '';
	tm1.Enabled := false;
end;

//========================================
procedure Tf_quan_ly_khach_hanh.b_timClick(Sender: TObject);
var
	sl:TStringList;
begin
	if da_tim=False then
	begin
		da_tim:=true;
		vi_tri_xem:=0;
		lv_ngoi_sao_tim.Clear;
		sl:=TStringList.Create;
		tim_kiem_sl(cbb_tim.Text,dl_ngoi_sao.sl_dl,sl);
		sl_lv(sl,lv_ngoi_sao_tim);
		lv_ngoi_sao_tim.CustomSort(@Sap_xep_so_lv,-9);
		sl.Free;
	end;
end;

procedure Tf_quan_ly_khach_hanh.b_suaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn sửa liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
		them_dl(0);
end;

procedure Tf_quan_ly_khach_hanh.b_themClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_quan_ly_khach_hanh.b_xoa_mucClick(Sender: TObject);
begin
	if lv_khach_hang.ItemIndex>=0 then
	begin
		if MessageDlg('Bạn có muốn xóa mục này!?', mtConfirmation, [mbYes, mbNo], 0) = idYes
		then
		begin
			sl_xoa(dl_ngoi_sao.sl_dl,ma_ngoi_sao_ht);
			dl_ngoi_sao.luu;
			luu_thong_so;
			lb_so_kh.Caption := 'Số Ngôi sao: ' + IntToStr(dl_ngoi_sao.sl_dl.Count-1);
			lv_khach_hang.Items.Delete(lv_khach_hang.itemindex);
		end;
	end;
end;

procedure Tf_quan_ly_khach_hanh.cbb_timChange(Sender: TObject);
begin
	da_tim:=sai;
end;

procedure Tf_quan_ly_khach_hanh.cbb_timKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then begin
		b_tim.Click;
		key:= #0;
	end;
end;

procedure Tf_quan_ly_khach_hanh.FormCreate(Sender: TObject);
begin
	duong_dan_goc := extractfilepath(application.ExeName);
	dl_ngoi_sao:=TLDNam_dl.tao('DL Ngoi Sao.LDN');
	ap_dung_thong_so;
	sl_lv(dl_ngoi_sao.sl_dl,lv_khach_hang);
	//ttp_ngay_du_tinh.date := date;
end;

procedure Tf_quan_ly_khach_hanh.lv_khach_hangColumnClick(Sender: TObject;
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
	//f_dl.lb_ngoi_sao_luu_lv(lv_khach_hang,7);
end;

procedure Tf_quan_ly_khach_hanh.lv_khach_hangCompare(Sender: TObject; Item1,
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

procedure Tf_quan_ly_khach_hanh.lv_khach_hangMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	thong_tin: string;
	ngay_cn:string;
	muc:string;
	khac:string;
begin
	if lv_khach_hang.itemindex <> -1 then
	begin
		ListItem := lv_khach_hang.Items[lv_khach_hang.ItemIndex];
		with ListItem do
	begin
		ma_ngoi_sao_ht:=Caption;
		cbb_ten.Text:=SubItems.Strings[0];
		cbb_ngay_sinh.Text:= SubItems.Strings[1];
		cbb_dia_chi.Text := SubItems.Strings[2];
		cbb_sdt.Text := SubItems.Strings[3];
		thong_tin := SubItems.Strings[4];
		ngay_cn := SubItems.Strings[5];
		muc := SubItems.Strings[6];
		khac:=SubItems.Strings[7];
		thong_tin:= StringReplace(thong_tin, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_thong_tin.Text := thong_tin;
		khac:= StringReplace(khac, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_khac.Text := khac;
	end;
	end;
end;

end.
