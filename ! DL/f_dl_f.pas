unit f_dl_f;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
	LDNam_sys,LDNam_xu_ly_du_lieu;

type
	Tf_dl = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    lb_cong_viec_cu: TListBox;
    Label3: TLabel;
    Label5: TLabel;
    lb_thien_su: TListBox;
    lb_tu_ghep: TListBox;
    Label6: TLabel;
    lb_Vat_tu: TListBox;
    Label7: TLabel;
    lb_cham_cong: TListBox;
    Label8: TLabel;
    lb_ds_cham_cong: TListBox;
    Label9: TLabel;
    lb_ha: TListBox;
    Label10: TLabel;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    lb_dl_cuoc_song: TListBox;
    lb_dl_nhom: TListBox;
    Label11: TLabel;
    lb_hoa_don: TListBox;
    lb_tu_dien: TListBox;
    Label12: TLabel;
    lb_don_hang: TListBox;
    Label13: TLabel;
    lb_bao_gia: TListBox;
    Label14: TLabel;
		procedure FormCreate(Sender: TObject);
//		procedure lb_cong_viec_luu;
		procedure lb_cong_viec_cu_luu;
		procedure lb_thien_su_luu;
		function lb_thien_su_luu_lv(var lv:TListView):boolean;
		procedure lb_tu_ghep_luu;
		function lb_tu_ghep_luu_lv(var lv:TListView):boolean;
		procedure lb_vat_tu_luu;
		procedure lb_vat_tu_luu1;
		procedure lb_vat_tu_tai;
		procedure lb_vat_tu_tai1;
		function lb_vat_tu_luu_lv(var lv:TListView):boolean;

		procedure lb_cham_cong_luu;
		function lb_cham_cong_luu_lv(var lv:TListView):boolean;
		procedure lb_ds_cham_cong_luu;
		function lb_ds_cham_cong_luu_lv(var lv:TListView):boolean;
		procedure lb_ha_luu;
		function lb_ha_luu_lv(var lv:TListView):boolean;

		procedure lb_hoa_don_luu;
		function lb_hoa_don_luu_lv(var lv:TListView):boolean;

		procedure lb_don_hang_luu;
		function lb_don_hang_luu_lv(var lv:TListView):boolean;
		procedure lb_bao_gia_luu(bg:string);
		function lb_bao_gia_luu_lv(var lv:TListView):boolean;
		procedure tai_bao_gia(bg:string);
  private
    { Private declarations }
  public
    { Public declarations }
	end;

	Class1 = class
	end;

var
	f_dl: Tf_dl;
	ten_f_dl_cong_viec_cu:string;
	ten_f_dl_thien_su:string;
	ten_f_dl_tu_ghep:string;
	ten_f_dl_vat_tu:string;
	ten_f_dl_cham_cong:string;
	ten_f_dl_ds_cham_cong:string;
	ten_f_dl_ha:string;
	ten_f_dlcs1:string;
	ten_f_dlcs3:string;
	ten_f_dl_hoa_don:string;
	ten_f_dl_don_hang:string;
	ten_f_dl_bao_gia:string;
const
	f_dl_cong_viec_cu = '\Du lieu\DL Cong viec cu.LDN'; // tên file du lieu cong viec củ
	f_dl_thau_kinh = '\Du lieu\DL Thau Kinh.LDN'; // tên file du lieu cong viec củ
	f_dl_thien_su = '\Du lieu\! Thien su\DL Thien Su.LDN'; // tên file du lieu cong viec củ
	f_dl_cham_cong = '\Du lieu\! Thien su\DL Cham cong.LDN';
	f_dl_ds_cham_cong = '\Du lieu\! Thien su\DL DS Cham cong.LDN';
	f_dl_tu_ghep = '\Du lieu\DL Tu ghep.LDN'; // tên file du lieu cong viec củ
	f_dl_vat_tu = '\Du lieu\! Nang luong\DL Vat tu'; // tên file du lieu vat tu
	f_dl_ha = '\Du lieu\Hinh anh\DL HA.LDN';
	f_dl_nhom = '\Du lieu\1 DLLDNam\DL nhom.LDN';
	f_dl_cuoc_song = '\Du lieu\1 DLLDNam\DL cuoc song.LDN';
	f_dl_hoa_don = '\Du lieu\DL Hoa Don.LDN'; // tên file du lieu hóa đơn
	f_dl_don_hang = '\Du lieu\2 Tiep thi\DL Don hang.LDN'; // tên file du lieu hóa đơn
	f_dl_bao_gia = '\Du lieu\2 Tiep thi\Bao gia\'; // tên file du lieu hóa đơn
//======================================== 

implementation

{$R *.dfm}
const 
	dau_ma_thau_kinh = 'TK';


procedure Tf_dl.FormCreate(Sender: TObject);
begin
	duong_dan_goc := extractfilepath(application.ExeName);
	Tao_thu_muc(duong_dan_goc + '\Du lieu');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\! Nang luong');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\! Thien su');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\1 DLLDNam');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\! Hinh anh');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\2 Tiep thi');
	Tao_thu_muc(duong_dan_goc + '\Du lieu\2 Tiep thi\Bao gia');
//	//---------------------------------------- 
//	ten_f_dl_cong_viec := duong_dan_goc + f_dl_cong_viec;
//	lb_luu_file(lb_cong_viec,ten_f_dl_cong_viec);
	//---------------------------------------- 
	ten_f_dl_cong_viec_cu := duong_dan_goc + f_dl_cong_viec_cu;
	lb_luu_file(lb_cong_viec_cu,ten_f_dl_cong_viec_cu);
	//---------------------------------------- 
	ten_f_dl_thien_su := duong_dan_goc + f_dl_thien_su;
	lb_luu_file(lb_thien_su,ten_f_dl_thien_su);
	//---------------------------------------- 
	ten_f_dl_tu_ghep := duong_dan_goc + f_dl_tu_ghep;
	lb_luu_file(lb_tu_ghep,ten_f_dl_tu_ghep);
	//---------------------------------------- 
	ten_f_dl_vat_tu := duong_dan_goc + f_dl_vat_tu;
	lb_luu_file(lb_vat_tu,ten_f_dl_vat_tu+'1.LDN');
	ten_f_dl_vat_tu := duong_dan_goc + f_dl_vat_tu;
	lb_luu_file(lb_vat_tu,ten_f_dl_vat_tu+'.LDN');

	//---------------------------------------- 
	ten_f_dl_cham_cong := duong_dan_goc + f_dl_cham_cong;
	lb_luu_file(lb_cham_cong,ten_f_dl_cham_cong);
	//---------------------------------------- 
	ten_f_dl_ds_cham_cong := duong_dan_goc + f_dl_ds_cham_cong;
	lb_luu_file(lb_ds_cham_cong,ten_f_dl_ds_cham_cong);
	//---------------------------------------- 
	ten_f_dl_ha := duong_dan_goc + f_dl_ha;
	lb_luu_file(lb_ha,ten_f_dl_ha);
	//---------------------------------------- 
	ten_f_dl_hoa_don := duong_dan_goc + f_dl_hoa_don;
	lb_luu_file(lb_hoa_don,ten_f_dl_hoa_don);

	//---------------------------------------- 
	ten_f_dl_don_hang := duong_dan_goc + f_dl_don_hang;
	lb_luu_file(lb_don_hang,ten_f_dl_don_hang);

	//---------------------------------------- 
  tai_bao_gia('BG00001');

	Self.Hide;
	//f_dl.Hide;
end;

//---------------------------------------- 
procedure Tf_dl.tai_bao_gia(bg:string);
begin
	ten_f_dl_bao_gia := duong_dan_goc + f_dl_bao_gia;
	lb_luu_file(lb_bao_gia,ten_f_dl_bao_gia+bg+'.LDN');
end;

procedure Tf_dl.lb_bao_gia_luu(bg:string);
begin
	lb_bao_gia.Items.SaveToFile
			(ten_f_dl_bao_gia+bg+'.LDN', TEncoding.UTF8);
end;

function Tf_dl.lb_bao_gia_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_bao_gia);
	lb_bao_gia_luu('BG00010');
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_don_hang_luu;
begin
	lb_don_hang.Items.SaveToFile
			(ten_f_dl_don_hang, TEncoding.UTF8);
end;

function Tf_dl.lb_don_hang_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_don_hang);
	lb_don_hang_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_hoa_don_luu;
begin
	lb_hoa_don.Items.SaveToFile
			(ten_f_dl_hoa_don, TEncoding.UTF8);
end;

function Tf_dl.lb_hoa_don_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_hoa_don);
	lb_hoa_don_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_ha_luu;
begin
	lb_ha.Items.SaveToFile
			(ten_f_dl_ha, TEncoding.UTF8);
end;

function Tf_dl.lb_ha_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_ha);
	lb_ha_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_ds_cham_cong_luu;
begin
	lb_ds_cham_cong.Items.SaveToFile
			(ten_f_dl_ds_cham_cong, TEncoding.UTF8);
end;

function Tf_dl.lb_ds_cham_cong_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_ds_cham_cong);
	lb_ds_cham_cong_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_vat_tu_luu;
begin
	lb_vat_tu.Items.SaveToFile
			(ten_f_dl_vat_tu+'.LDN', TEncoding.UTF8);
end;
procedure Tf_dl.lb_vat_tu_luu1;
begin
	lb_vat_tu.Items.SaveToFile
			(ten_f_dl_vat_tu+'1.LDN', TEncoding.UTF8);
end;

function Tf_dl.lb_vat_tu_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_vat_tu);
	lb_vat_tu_luu;
	Result:=True;
end;
procedure Tf_dl.lb_vat_tu_tai;
begin
	ten_f_dl_vat_tu := duong_dan_goc + f_dl_vat_tu;
	lb_luu_file(lb_vat_tu,ten_f_dl_vat_tu+'.LDN');
end;

procedure Tf_dl.lb_vat_tu_tai1;
begin
	ten_f_dl_vat_tu := duong_dan_goc + f_dl_vat_tu;
	lb_luu_file(lb_vat_tu,ten_f_dl_vat_tu+'1.LDN');
end;
//---------------------------------------- 
//---------------------------------------- 
procedure Tf_dl.lb_cham_cong_luu;
begin
	lb_cham_cong.Items.SaveToFile
			(ten_f_dl_cham_cong, TEncoding.UTF8);
		

end;

function Tf_dl.lb_cham_cong_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_cham_cong);
	lb_cham_cong_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_tu_ghep_luu;
begin
	lb_tu_ghep.Items.SaveToFile
			(ten_f_dl_tu_ghep, TEncoding.UTF8);
end;

function Tf_dl.lb_tu_ghep_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_tu_ghep);
	lb_tu_ghep_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_thien_su_luu;
begin
	lb_thien_su.Items.SaveToFile
			(ten_f_dl_thien_su, TEncoding.UTF8);
end;

function Tf_dl.lb_thien_su_luu_lv(var lv:TListView):boolean;
begin
	lv_lb_k(lv,lb_thien_su);
	lb_thien_su_luu;
	Result:=True;
end;
//---------------------------------------- 
procedure Tf_dl.lb_cong_viec_cu_luu;
begin
	lb_cong_viec_cu.Items.SaveToFile
			(ten_f_dl_cong_viec_cu, TEncoding.UTF8);
end;
//
//function Tf_dl.lb_cong_viec_cu_luu_lv(var lv:TListView):boolean;
//begin
//	lv_lb_k(lv,lb_cong_viec);
//	lb_cong_viec_luu;
//	Result:=True;
//end;
////---------------------------------------- 
//procedure Tf_dl.lb_cong_viec_luu;
//begin
//	lb_cong_viec.Items.SaveToFile
//			(ten_f_dl_cong_viec, TEncoding.UTF8);
//end;

//function Tf_dl.lb_cong_viec_luu_lv(var lv:TListView):boolean;
//begin
//	lv_lb_k(lv,lb_cong_viec);
//	lb_cong_viec_luu;
//	Result:=True;
//end;
//---------------------------------------- 
end.
