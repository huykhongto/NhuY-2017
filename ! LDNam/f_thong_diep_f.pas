unit f_thong_diep_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs,LDNam_xu_ly_anh, Vcl.ExtCtrls;

type
	Tf_thong_diep = class(TForm)
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure viet_thong_diep(TextToDraw: string) ;
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
	f_thong_diep: Tf_thong_diep;
	HRgn: THandle;

implementation

{$R *.dfm}

procedure Tf_thong_diep.viet_thong_diep(TextToDraw: string) ;
begin
		Color := clGreen;//clLime;
		DeleteObject(HRgn);

		Canvas.Font.Name  := 'Tahoma';  // Comic Sans MS
		Canvas.Font.Size  := 50;//32;
		Canvas.Font.Style := [fsBold];

		self.width:=Canvas.TextWidth(TextToDraw)+60;
		self.height:=Canvas.TextHeight('▐');

		BeginPath(Canvas.Handle);
		SetBkMode( Canvas.Handle, TRANSPARENT );

		Canvas.Pen.Width := 1;
		Canvas.Pen.Color := clGreen;
		Canvas.Brush.Style := bsClear;
		//Canvas.Rectangle(2, 2, Width - 1, Height - 1);
		//Canvas.Font.Size := 14;
		canvas.font.style := [fsbold];
		canvas.Brush.Color := clGreen;  // $F0CAA6
			//Canvas.Brush.Style := bsDiagCross;
		//canvas.Brush.Style := bsSolid;
		canvas.Pen.Color := clLime;
			//Canvas.Pen.Style := psDot;
		canvas.Pen.Style := psSolid;
		//DrawTextOutline(canvas, 5, 0, TextToDraw);
		Canvas.TextOut(5, 0, ' '+ TextToDraw +' ');  //' Das ist ein Test ');

		//Canvas.Rectangle(0,0,width,height);
		//Canvas.Rectangle(5,5,width-5,height-5);

    EndPath(Canvas.Handle);
    HRgn := PathToRegion(Canvas.Handle);
    SetWindowRgn(Handle, HRgn, True);
		SetWindowPos(Handle,HWND_TOPMOST, 0, 0, 0, 0,SWP_NOMOVE + SWP_NOSIZE);
		left:=(1366-Width) div 2;
		top:= (768-Height) div 2;
end;

procedure Tf_thong_diep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	DeleteObject(HRgn);
	Action:=caFree;
	f_thong_diep:=nil;
end;

procedure Tf_thong_diep.FormDblClick(Sender: TObject);
begin
	f_thong_diep.Close;
end;

end.
