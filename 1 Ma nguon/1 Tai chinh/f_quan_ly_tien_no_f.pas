unit f_quan_ly_tien_no_f;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, f_nhu_y_f, Vcl.ExtCtrls,
	LDNam_sys;

type
	Tf_quan_ly_tien_no = class(TForm)
		Label1: TLabel;
		Edit1: TEdit;
		Label2: TLabel;
		Edit2: TEdit;
		Label3: TLabel;
		Edit3: TEdit;
		Label4: TLabel;
		Edit4: TEdit;
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	f_quan_ly_tien_no: Tf_quan_ly_tien_no;

implementation

{$R *.dfm}

procedure Tf_quan_ly_tien_no.Button1Click(Sender: TObject);
begin
	Image1.Picture.Bitmap:=lay_hinh_nen_desktop;
end;

end.
