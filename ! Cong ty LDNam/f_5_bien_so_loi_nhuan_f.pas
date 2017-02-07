unit f_5_bien_so_loi_nhuan_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tf_5_bien_so_loi_nhuan = class(TForm)
    lv_thong_bao: TListView;
    Edit1: TEdit;
    Edit2: TEdit;
    e_lkh: TEdit;
    Edit3: TEdit;
    e_slmll: TEdit;
    Edit4: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_5_bien_so_loi_nhuan: Tf_5_bien_so_loi_nhuan;

implementation

{$R *.dfm}

end.
