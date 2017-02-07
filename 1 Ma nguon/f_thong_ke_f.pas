unit f_thong_ke_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,LDNam_sys,khai_bao_tu_dien,
	VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,xu_ly_du_lieu,Vcl.ComCtrls,
	VCLTee.Series,System.DateUtils;

type
  Tf_thong_ke = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    l_tien_hien_tai: TLabel;
    l_tong_thu: TLabel;
    l_tong_chi: TLabel;
    l_tong: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbb_thang_chon: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    l_loi_nhuan: TLabel;
    Panel2: TPanel;
    Chart1: TChart;
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
		Series4: TPointSeries;
    Label2: TLabel;
    l_tien_mat_hien_co: TLabel;
    l_tu_thien: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    l_tiet_kiem: TLabel;
    l_dau_tu: TLabel;
    l_tra_no: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
		procedure cbb_thang_chonChange(Sender: TObject);
		procedure tinh_toan_theo_thang(thang_tinh: integer);
		function tinh_tong_theo_ngay(ngay_tinh,thang_tinh,nam_tinh:word;lv:TlistView):integer;
		function tong_tien_cua_thang(thang_tinh:integer; nam_tinh:integer):integer;
		function tong_tien_cua_thang_lv(thang_tinh:integer; nam_tinh:integer;lv: TlistView):integer;
  	function tong_tien_lv(lv: TlistView):integer;
	private
    { Private declarations }
  public
    { Public declarations }
	end;
const 
	tl_tiet_kiem = 10;
	tl_tra_no = 10;
	tl_tu_thien = 10;
var
	f_thong_ke: Tf_thong_ke;

implementation
	uses f_quan_ly_tai_chinh_f;

{$R *.dfm}

procedure Tf_thong_ke.cbb_thang_chonChange(Sender: TObject);
begin
	if cbb_thang_chon.ItemIndex>0 then 
		tinh_toan_theo_thang(cbb_thang_chon.ItemIndex)
	else
	begin
		f_quan_ly_tai_chinh.tinh_tien_du;
		f_quan_ly_tai_chinh.tinh_tong_tien;
  end;
end;

procedure Tf_thong_ke.FormCreate(Sender: TObject);
var 
	thang,nam,ngay:word;
begin
	thoi_gian:=now;
	DecodeDate(thoi_gian,nam,thang,ngay);
	cbb_thang_chon.ItemIndex:=thang;
	l_tien_mat_hien_co.Caption:=f_quan_ly_tai_chinh.l_tien_hien_tai.Caption;
	tinh_toan_theo_thang(cbb_thang_chon.ItemIndex);
end;
//======================================== 
procedure Tf_thong_ke.tinh_toan_theo_thang(thang_tinh: integer);
var
	tong_du_thu, tong_du_chi: integer;
	i: integer;
	tong_du_tinh:integer;
	nam_tinh:word;
	ngay,thang,nam:word;
	tong_thu, tong_chi: integer;
	a:integer;
	loi_nhuan:integer;
	tiet_kiem,tra_no,tu_thien:integer;
begin
	nam_tinh:=2016;
	tong_du_thu := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_du_thu);
	tong_du_chi := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_du_chi);
	tong_du_tinh := tong_du_thu - tong_du_chi;

	tong_thu := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_bang_thu);
	tong_chi := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_bang_chi);
	l_tien_hien_tai.Caption := IntToStr(tong_thu - tong_chi);
	l_tong_thu.Caption:=IntToStr(tong_thu);
	l_tong_chi.Caption:=IntToStr(tong_chi);

	thoi_gian:=EndOfAMonth(nam_tinh, thang_tinh);
	DecodeDate(thoi_gian,nam,thang,ngay);
	Series1.Clear;
	Series2.Clear;
	Series3.Clear;
	Series4.Clear;
	for i := 1 to ngay do
	begin
		a:=tinh_tong_theo_ngay(i,thang,nam,f_quan_ly_tai_chinh.lv_bang_thu);
		if (a>0) or (i=1) or (i=ngay) then
			Series1.AddXY(i,a);
		a:=tinh_tong_theo_ngay(i,thang,nam,f_quan_ly_tai_chinh.lv_bang_chi);
		if a>0 then
			Series2.AddXY(i,a);
		a:=tinh_tong_theo_ngay(i,thang,nam,f_quan_ly_tai_chinh.lv_du_thu);
		if a>0 then
			Series3.AddXY(i,a);
		a:=tinh_tong_theo_ngay(i,thang,nam,f_quan_ly_tai_chinh.lv_du_chi);
		if a>0 then
			Series4.AddXY(i,a);
	end;

	l_tong.Caption:=IntToStr(StrToInt(l_tien_hien_tai.Caption)+tong_du_tinh);
	if (thang=7) and (nam = 2015) then
	begin
		loi_nhuan:=StrToInt(l_tong.Caption)-tong_tien_thang_6;
		l_loi_nhuan.Caption:=IntToStr(loi_nhuan)
	end 
	else
	begin
		loi_nhuan:=tong_tien_cua_thang(thang,nam);
		l_loi_nhuan.Caption:=IntToStr(loi_nhuan);
	end;
	tu_thien:=loi_nhuan div tl_tu_thien;
	tu_thien:=tu_thien-tu_thien mod 50000;
	l_tu_thien.Caption:=IntToStr(tu_thien);
	tiet_kiem:=loi_nhuan div tl_tiet_kiem;
	tiet_kiem:=tiet_kiem-tiet_kiem mod 50000;
	l_tiet_kiem.Caption:=IntToStr(tiet_kiem);
	tra_no:=loi_nhuan div tl_tra_no;
	tra_no:=tra_no-tra_no mod 50000;
	l_tra_no.Caption:=IntToStr(tra_no);
	l_dau_tu.Caption:=IntToStr(loi_nhuan-(tiet_kiem+tu_thien+tra_no));
end;
//======================================== 
function Tf_thong_ke.tinh_tong_theo_ngay(ngay_tinh,thang_tinh,nam_tinh:word;lv:TlistView):integer;
var
	tien: string;
	i: integer;
	ListItem: TListItem;
	thang,nam,ngay:word;
begin
	Result := 0;
	for i := 0 to lv.Items.Count - 1 do
	begin
		ListItem := lv.Items[i];
		with ListItem do
		begin
			tien := SubItems.Strings[0];
			thoi_gian:=strtodatetime(SubItems.Strings[1]);
		end;
		DecodeDate(thoi_gian,nam,thang,ngay);
		if (thang_tinh=thang) and (ngay_tinh=ngay) and (nam_tinh=nam) then
			Result := Result + StrToInt(tien);
	end;
end;
//========================================
function Tf_thong_ke.tong_tien_cua_thang(thang_tinh:integer; nam_tinh:integer):integer;
var
	tong_du_thu, tong_du_chi: integer;
	tong_du_tinh:integer;
	tong_thu, tong_chi: integer;
	tong_thu_chi:integer;
begin
	tong_du_thu := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_du_thu);
	tong_du_chi := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_du_chi);
	tong_du_tinh := tong_du_thu - tong_du_chi;
	tong_thu := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_bang_thu);
	tong_chi := tong_tien_cua_thang_lv(thang_tinh,nam_tinh,f_quan_ly_tai_chinh.lv_bang_chi);
	tong_thu_chi := tong_thu - tong_chi;
	Result := tong_thu_chi+ tong_du_tinh;
end;
//======================================== 
function Tf_thong_ke.tong_tien_cua_thang_lv(thang_tinh:integer; nam_tinh:integer;lv: TlistView):integer;
var
	tien: string;
	i: integer;
	ListItem: TListItem;
	ngay,thang,nam:word;
	tg : TDateTime;
begin
	Result := 0;
	for i := 0 to lv.Items.Count - 1 do
	begin
		ListItem := lv.Items[i];
		with ListItem do
		begin
			tien := SubItems.Strings[0];
			tg:=strtodatetime(SubItems.Strings[1]);
		end;
		DecodeDate(tg,nam,thang,ngay);
		if (thang_tinh=thang) and (nam_tinh=nam) then
			Result := Result + StrToInt(tien);
	end;
end;
//======================================== 
function Tf_thong_ke.tong_tien_lv(lv: TlistView):integer;
var
	tien: string;
	i: integer;
	ListItem: TListItem;
begin
	Result := 0;
	for i := 0 to lv.Items.Count - 1 do
	begin
		ListItem := lv.Items[i];
		with ListItem do
		begin
			tien := SubItems.Strings[0];
		end;
		Result := Result + StrToInt(tien);
	end;
end;
end.
