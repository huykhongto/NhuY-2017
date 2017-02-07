unit f_thong_bao_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tf_thong_bao = class(TForm)
    lb_thong_bao: TListBox;
    lv_thong_bao: TListView;
    procedure lb_thong_baoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_thong_bao: Tf_thong_bao;

implementation

{$R *.dfm}

procedure Tf_thong_bao.lb_thong_baoClick(Sender: TObject);
begin
	lb_thong_bao.Hint:=lb_thong_bao.Items[lb_thong_bao.ItemIndex];
end;

end.
