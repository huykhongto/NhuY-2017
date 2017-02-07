unit f_tu_ghep_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
	LDNam_sys,LDNam_xu_ly_du_lieu;

type
	Tf_tu_ghep = class(TForm)
    bt_them: TButton;
    cbb_tu: TComboBox;
    bt_xoa: TButton;
    bt_sua: TButton;
    b_tim: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    lv_tu_ghep: TListView;
		Splitter1: TSplitter;
		lb_danh_sach_tu: TListBox;
		procedure them_dl(lua_chon: byte);
    procedure bt_themClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure cap_nhat_tu_hien_co();
    procedure lv_tu_ghepMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
    procedure bt_suaClick(Sender: TObject);
    procedure bt_xoaClick(Sender: TObject);
		procedure b_timClick(Sender: TObject);
		procedure lb_to_lv_dong_tim(vi_tri:integer);
    procedure cbb_tuKeyPress(Sender: TObject; var Key: Char);
	private
    { Private declarations }
  public
    { Public declarations }
  end;

var
	f_tu_ghep: Tf_tu_ghep;
	vi_tri_chon: Integer;
	ty_le:integer;

implementation

{$R *.dfm}


uses f_dl_f;
procedure Tf_tu_ghep.cap_nhat_tu_hien_co();
begin
	lb_lb(f_dl.lb_tu_ghep,lb_danh_sach_tu,0);
end;

procedure Tf_tu_ghep.cbb_tuKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then begin
		b_tim.Click;
		key:= #0;
	end;
end;

procedure Tf_tu_ghep.bt_suaClick(Sender: TObject);
begin
 them_dl(0);
end;

procedure Tf_tu_ghep.bt_themClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_tu_ghep.bt_xoaClick(Sender: TObject);
begin
if MessageDlg('Bạn có muốn xóa từ này!?',mtConfirmation,[mbYes, mbNo],0) = idYes then
	begin
		f_dl.lb_tu_ghep.items.Delete(vi_tri_chon+1); //Remove selected item
		f_dl.lb_tu_ghep_luu;
		cap_nhat_tu_hien_co;
		bt_xoa.Enabled:=sai;
	end;
end;

//======================================== 
procedure Tf_tu_ghep.lb_to_lv_dong_tim(vi_tri:integer);
var
	ListItem: TListItem;
begin
	cap_nhat_tu_hien_co;
	ListItem:=lv_tu_ghep.Items.Add;
	with ListItem do
	begin
		Caption:= lb_danh_sach_tu.Items[vi_tri];
		SubItems.Add(IntToStr(vi_tri));
		SubItems.Add(IntToStr(ty_le));
	end;
end;

procedure Tf_tu_ghep.b_timClick(Sender: TObject);
var i:integer;
dong:string;
begin
	lv_tu_ghep.Clear;
	for i:=1 to f_dl.lb_tu_ghep.Items.Count-1 do  // tìm kiếm toàn bộ từ
	begin
		dong:=f_dl.lb_tu_ghep.Items[i];
		ty_le:=tim_tung_tu_kttt(cbb_tu.text,dong);
		if ty_le>0 then
		begin
			lb_to_lv_dong_tim(i-1);
		end;
	end;
	lv_tu_ghep.CustomSort(@Sap_xep_so_lv,-2);
end;

procedure Tf_tu_ghep.FormCreate(Sender: TObject);
begin
	cap_nhat_tu_hien_co;
	//lb_lv
	//for I := 0 to f_dl.lb_tu_ghep.Items.Count-1 do
		
end;

procedure Tf_tu_ghep.lv_tu_ghepMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
begin
	if lv_tu_ghep.Items.Count=0 then 
	begin
		bt_xoa.Enabled:=false;
		bt_sua.Enabled:=sai;
	end;
	if lv_tu_ghep.ItemIndex=-1 then
	begin
		bt_xoa.Enabled:=false;
		bt_sua.Enabled:=sai;
		Exit;
	end; 
	ListItem:=lv_tu_ghep.Items[lv_tu_ghep.ItemIndex];
	with ListItem do
	begin
		vi_tri_chon:=StrToInt(SubItems.Strings[0]);
	end;
	f_dl.lb_tu_ghep.ItemIndex:=vi_tri_chon;
	f_dl.lb_tu_ghep.Selected[vi_tri_chon];
	//chon_lb;
	bt_xoa.Enabled:=true;
	bt_sua.Enabled:=true;
	cbb_tu.Text:=ListItem.Caption;
	//sua_tu:=false; // cho phep sửa từ
end;

procedure Tf_tu_ghep.them_dl(lua_chon: byte);
var
	dong_dl:string;
	procedure them(c: string);
	begin
		dong_dl:=dong_dl+c+phan_cot;
	end;
begin
	if cbb_tu.Text='' then
	begin                       
		exit;
	end ;
	if chuoi_co_trong_lb(cbb_tu.text,lb_danh_sach_tu) then
		exit;
	dong_dl := '';
	them(trim(cbb_tu.text)); 
	them('0');
	if lua_chon=1 then
	begin
		lb_danh_sach_tu.items.Add(trim(cbb_tu.text));
		f_dl.lb_tu_ghep.Items.Add(dong_dl);
	end
	else
	begin
		f_dl.lb_tu_ghep.Items[vi_tri_chon+1]:=dong_dl;
		cap_nhat_tu_hien_co;
	end;
	f_dl.lb_tu_ghep_luu;
end;
//======================================== 
end.
