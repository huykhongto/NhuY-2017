unit f_truc_thuoc_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
	khai_bao_tu_dien,xu_ly_du_lieu,LDNam_sys;

type
  Tf_truc_thuoc = class(TForm)
    p_1: TPanel;
    cbb_truc_thuoc_thu: TComboBox;
    lb_truc_thuoc: TListBox;
    p_2: TPanel;
    bt_xoa: TButton;
    bt_sua: TButton;
    bt_them_thu: TButton;
    lv_truc_thuoc: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_truc_thuoc: Tf_truc_thuoc;

implementation

{$R *.dfm}

procedure Tf_truc_thuoc.FormCreate(Sender: TObject);
begin
	lb_luu_file(lb_truc_thuoc,duong_dan_goc + '\Du lieu\DL truc thuoc.LDN');
	lb_lv(lb_truc_thuoc,lv_truc_thuoc,0)
end;

end.
