unit f_ke_hoach_hom_nay_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,LDNam_sys;

type
  Tf_ke_hoach_hom_nay = class(TForm)
    m_1: TMemo;
    procedure m_1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
	end;

var
	f_ke_hoach_hom_nay: Tf_ke_hoach_hom_nay;
	co_thay_doi:bool;

implementation

{$R *.dfm}

procedure Tf_ke_hoach_hom_nay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if co_thay_doi=True then
	begin
		co_thay_doi:=false;
		m_luu_file(m_1,duong_dan_goc+'Du lieu\DL ke hoach.LDN');
	end;
	//f_ke_hoach_hom_nay.Free;
	Action:=caFree;
	f_ke_hoach_hom_nay:=nil;
end;

procedure Tf_ke_hoach_hom_nay.FormCreate(Sender: TObject);
begin
	duong_dan_goc:=extractfilepath(application.ExeName);
	m_tai_file(m_1,duong_dan_goc+'Du lieu\DL ke hoach.LDN');
	co_thay_doi:=false;
end;

procedure Tf_ke_hoach_hom_nay.m_1Change(Sender: TObject);
begin
	co_thay_doi:=true;
end;

end.
