unit f_cong_ty_ldnam_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  Tf_cong_ty_ldnam = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Button1: TButton;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    MainMenu1: TMainMenu;
    N5Binslinhun1: TMenuItem;
    procedure N5Binslinhun1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_cong_ty_ldnam: Tf_cong_ty_ldnam;

implementation

{$R *.dfm}

uses f_5_bien_so_loi_nhuan_f;

procedure Tf_cong_ty_ldnam.N5Binslinhun1Click(Sender: TObject);
begin
	f_5_bien_so_loi_nhuan.show;
end;

end.
