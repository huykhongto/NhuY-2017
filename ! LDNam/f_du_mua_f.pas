unit f_du_mua_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,LDNam_sys,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Imaging.pngimage;

type
  Tf_du_mua = class(TForm)
    m_1: TMemo;
    ppm1: TPopupMenu;
    Xa1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel8: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbb_ten_thau_kinh: TComboBox;
    cbb_don_vi_tinh: TComboBox;
    cbb_so_luong: TComboBox;
    b_tim_thau_kinh: TButton;
    CheckBox1: TCheckBox;
    cbb_don_gia: TComboBox;
    b_them: TButton;
    cbb_cu: TComboBox;
    Panel7: TPanel;
    lv_danh_sach_thau_kinh: TListView;
    Panel6: TPanel;
    lv_thau_kinh_tim: TListView;
    Button2: TButton;
    Button1: TButton;
    Panel5: TPanel;
    cbb_kt_f: TComboBox;
    Button3: TButton;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbb_ten: TComboBox;
    cbb_dia_chi: TComboBox;
    cbb_dien_thoai: TComboBox;
    b_tim: TButton;
    cb_tim_nang_cao: TCheckBox;
    Panel1: TPanel;
    cb_thu_ho: TCheckBox;
    e_tien_thu_ho: TEdit;
    cb_phi_vc: TCheckBox;
    m_ten_hang: TMemo;
    m_to: TMemo;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    lv_kh: TListView;
    procedure m_1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
		{ Public declarations }
	end;

var
	f_du_mua: Tf_du_mua;
	co_thay_doi:bool;

implementation

{$R *.dfm}

procedure Tf_du_mua.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if co_thay_doi=True then
	begin
		co_thay_doi:=false;
		m_luu_file(m_1,duong_dan_goc+'Du lieu\DL du mua.LDN');
	end;
	//f_ke_hoach_hom_nay.Free;
	Action:=caFree;
	f_du_mua:=nil;
end;

procedure Tf_du_mua.FormCreate(Sender: TObject);
begin
	duong_dan_goc:=extractfilepath(application.ExeName);
	m_tai_file(m_1,duong_dan_goc+'Du lieu\DL du mua.LDN');
	co_thay_doi:=false;
end;

procedure Tf_du_mua.m_1Change(Sender: TObject);
begin
	co_thay_doi:=true;
end;

end.
