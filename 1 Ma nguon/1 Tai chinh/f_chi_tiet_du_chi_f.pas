unit f_chi_tiet_du_chi_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tf_chi_tiet_du_chi = class(TForm)
    cbb_ten_khoan: TComboBox;
    cbb_so_tien: TComboBox;
    cbb_truc_thuoc: TComboBox;
    m_mo_ta: TMemo;
    cbb_tien_them: TComboBox;
    bt_cong: TButton;
    bt_tru: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_congClick(Sender: TObject);
    procedure bt_truClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_chi_tiet_du_chi: Tf_chi_tiet_du_chi;

implementation
uses f_quan_ly_tai_chinh_f;

{$R *.dfm}

procedure Tf_chi_tiet_du_chi.bt_congClick(Sender: TObject);
begin
	if cbb_tien_them.text<>'' then
		cbb_so_tien.Text:=IntToStr(StrToInt(cbb_tien_them.text)+StrToInt(cbb_so_tien.Text));
end;

procedure Tf_chi_tiet_du_chi.bt_truClick(Sender: TObject);
begin
	cbb_so_tien.Text:=IntToStr(StrToInt(cbb_so_tien.Text)-StrToInt(cbb_tien_them.text));
end;

procedure Tf_chi_tiet_du_chi.Button1Click(Sender: TObject);
begin
	f_quan_ly_tai_chinh.cbb_ten_khoan.Text:=cbb_ten_khoan.Text;
	f_quan_ly_tai_chinh.cbb_tien_thu.Text:= cbb_so_tien.Text;
	f_quan_ly_tai_chinh.cbb_truc_thuoc_thu.text:=cbb_truc_thuoc.text;
	f_quan_ly_tai_chinh.m_mo_ta.Text:=m_mo_ta.Text;
	f_quan_ly_tai_chinh.them_dl(0);
	f_chi_tiet_du_chi.Release;
end;

procedure Tf_chi_tiet_du_chi.FormCreate(Sender: TObject);
begin
	cbb_ten_khoan.Text:=f_quan_ly_tai_chinh.cbb_ten_khoan.Text;
	cbb_so_tien.Text:=f_quan_ly_tai_chinh.cbb_tien_thu.Text;
	cbb_truc_thuoc.text:=f_quan_ly_tai_chinh.cbb_truc_thuoc_thu.text;
	m_mo_ta.Text:=f_quan_ly_tai_chinh.m_mo_ta.Text;
end;

procedure Tf_chi_tiet_du_chi.FormShow(Sender: TObject);
begin
  cbb_ten_khoan.Text:=f_quan_ly_tai_chinh.cbb_ten_khoan.Text;
end;

end.
