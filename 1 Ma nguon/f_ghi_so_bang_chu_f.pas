unit f_ghi_so_bang_chu_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,LDNam_sys;

type
  Tf_ghi_so_bang_chu = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
		{ Public declarations }
	end;

var
	f_ghi_so_bang_chu: Tf_ghi_so_bang_chu;

implementation

{$R *.dfm}

procedure Tf_ghi_so_bang_chu.Edit1Change(Sender: TObject);
begin
	if Edit1.Text <> '' then
		Label1.Caption:=so_ra_chu(StrToInt64(Edit1.Text),true,true);
end;

end.
