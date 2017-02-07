unit VisibleResourcesUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, checklst,f_dl_f,LDNam_sys;

type
  TVisibleResources = class(TForm)
    clb_nhom: TCheckListBox;
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    b_them: TButton;
    b_sua: TButton;
    e_nhom: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure clb_nhomMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure b_themClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VisibleResources: TVisibleResources;

implementation

//Uses f_quan_ly_cuoc_song_f;

{$R *.DFM}

procedure TVisibleResources.FormShow(Sender: TObject);
var
  I : Integer;
begin
  // Check the template and check any resources currently
  // visible in the grid
//	With f_quan_ly_cuoc_song.JvTFDays1.Template do
//		For I := 0 to clb_nhom.Items.Count - 1 do
//			clb_nhom.Checked[I] :=
//        CompNames.IndexOf(clb_nhom.Items[I]) > -1;
end;

procedure TVisibleResources.b_themClick(Sender: TObject);
var
	i:integer;
begin
//	if e_nhom.text='' then
//		exit;
//	for i:=0 to clb_nhom.items.Count-1 do
//	begin
//		if e_nhom.Text=clb_nhom.Items[i] then
//		exit;
//	end;
//	clb_nhom.items.Add(e_nhom.text);
//	f_dl.lb_dl_nhom.Items.add(e_nhom.text+phan_cot);
//	f_dl.lb_dl_nhom.Items.SaveToFile
//				(ten_f_dlcs1, TEncoding.UTF8);
//	f_quan_ly_cuoc_song.FormShow(nil);
//	f_quan_ly_cuoc_song.chuyen_ngay;
end;

procedure TVisibleResources.clb_nhomMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	e_nhom.Text:=clb_nhom.Items[clb_nhom.ItemIndex];
end;

procedure TVisibleResources.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I : Integer;
begin
  If ModalResult = mrOK Then
  begin
//      // First, clear the old resources from the template
//      f_quan_ly_cuoc_song.JvTFDays1.Template.CompNames.Clear;
//      f_quan_ly_cuoc_song.JvTFWeeks1.SchedNames.Clear;
//      f_quan_ly_cuoc_song.JvTFMonths1.SchedNames.Clear;
//
//			// Next, add the new resources to the template
//			For I := 0 to clb_nhom.Items.Count - 1 do
//				 If clb_nhom.Checked[I] Then
//         begin
//						 f_quan_ly_cuoc_song.JvTFDays1.Template.CompNames.Add(clb_nhom.Items[I]);
//						 f_quan_ly_cuoc_song.JvTFWeeks1.SchedNames.Add(clb_nhom.Items[I]);
//             f_quan_ly_cuoc_song.JvTFMonths1.SchedNames.Add(clb_nhom.Items[I]);
//         end;
  end;
end;

end.