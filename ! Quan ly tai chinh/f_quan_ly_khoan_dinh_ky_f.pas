unit f_quan_ly_khoan_dinh_ky_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tf_quan_ly_khoan_dinh_ky = class(TForm)
    Panel1: TPanel;
    lv_dinh_ky: TListView;
    lb_dinh_ky: TListBox;
    ComboBox1: TComboBox;
    ttp_ngay_du_tinh: TDateTimePicker;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    cb_thuc_hien: TCheckBox;
    CheckBox2: TCheckBox;
    p_nut_nhan: TPanel;
    bt_them_thu: TButton;
    bt_xoa: TButton;
    bt_sua: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_quan_ly_khoan_dinh_ky: Tf_quan_ly_khoan_dinh_ky;

implementation

{$R *.dfm}

end.
