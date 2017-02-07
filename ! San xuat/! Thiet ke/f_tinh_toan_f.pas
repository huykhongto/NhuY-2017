unit f_tinh_toan_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tf_tinh_toan = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_tinh_toan: Tf_tinh_toan;

implementation

{$R *.dfm}

end.
