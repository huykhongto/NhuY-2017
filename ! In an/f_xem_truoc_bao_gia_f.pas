unit f_xem_truoc_bao_gia_f;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, ExtCtrls, Vcl.ComCtrls,LDNam_sys,xygraph3d,Math, 
	Printers,LDNam_xu_ly_anh;

type
  Tf_xem_truoc_bao_gia = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    PageControl1: TPageControl;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ComboBox2: TComboBox;
    Button2: TButton;
    PaintBox1: TPaintBox;
    TabSheet4: TTabSheet;
    ScrollBox2: TScrollBox;
    p_v: TPaintBox;
    Button3: TButton;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
		procedure lam_moi;
    procedure Button2Click(Sender: TObject);
    procedure p_vPaint(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
		
  private
		{ Private declarations }
		
  public
		{ Public declarations }
		var
			rong_trang,cao_trang:integer;
  end;

var
  f_xem_truoc_bao_gia: Tf_xem_truoc_bao_gia;

  xybmpname : string = '';
  xywmfname : string = '';
	xywmfback : boolean = false;
	res,err : array[1..12] of integer;
	bitmap2: TBitmap;
	


procedure xycopystart;

implementation

uses in_hoa_don, f_in_hoa_don_ban_hang_f;

{$R *.DFM}
const nspokes=6;
var buf : boolean;
    bufl : integer;
    frm : string;
		oldindex : integer;
	data, data2, data3 : Tdatatype;
    labels : array of string;
    d0,d1,dd : double;
		y,m,d,h,n,s : word;
    dmin : double;
		ystring : string;
		 axes : array[0..nspokes-1] of Tradar;
		bdata : array of Tbardata;


procedure xycopystart;
begin
   frm := screen.activeform.name;
	 f_xem_truoc_bao_gia.showmodal;
end;

procedure Tf_xem_truoc_bao_gia.BitBtn3Click(Sender: TObject);
begin f_xem_truoc_bao_gia.modalresult := 1; end;

procedure Tf_xem_truoc_bao_gia.Button2Click(Sender: TObject);
begin 
end;

//======================================== 
function Tinh_rong_dong(var mi:TPaintBox;dong:string): integer;
begin
	Result:=mi.Canvas.TextExtent(dong).cx;
end;
procedure ve_khung_mi(Var mi:TPaintBox;x0,y0,x1,y1:integer);
begin
	mi.Canvas.MoveTo(x0,y0);
	mi.Canvas.LineTo(x0,y1);
	mi.Canvas.LineTo(x1,y1);
	mi.Canvas.LineTo(x1,y0);
	mi.Canvas.LineTo(x0,y0);
end;
//======================================== 
procedure ve_gach_duoi_mi(Var mi:TPaintBox;x0,y0,x1:integer);
begin
	mi.Canvas.Pen.Width:=2;
	mi.Canvas.Pen.Color:=clLime;
	mi.Canvas.MoveTo(x0,y0);
	mi.Canvas.LineTo(x0+x1,y0);
end;
//======================================== 
procedure ve_duong_ngan_pb(Var mi:TPaintBox;x0,y0,x1:integer);
begin
	mi.Canvas.Pen.Width:=4;
//	mi.Canvas.Pen.Color:=clLime;
	mi.Canvas.MoveTo(x0,y0);
	mi.Canvas.LineTo(x1,y0);
end;
procedure in_khung_chu_mi(var mi:TPaintBox;x0,y0:integer;tua_de:string;memo:tmemo);
var
	x,y,x_toi_da,i:integer;
	dong_dai:integer;
const rong_dong_ke=4;
begin
 //	mi.Canvas.Font:=memo.Font;
//	mi.Canvas.Font.Size:=StrToInt(cbb_kt_f.Text);
//	mi.Canvas.Font.Style:= [TFontStyle.fsBold];
	x:=x0+50; // tọa độ của đầu ra văn bản
	y:=y0+40;
	mi.Canvas.TextOut(x,y,tua_de);
	x:=x+mi.Canvas.TextExtent(tua_de).cx;
	x_toi_da:=x;
	//y:=y+Printer.Canvas.TextExtent('From: ').cy;
 //	mi.Canvas.Font:=memo.Font;
	//mi.Canvas.Font.Size:=StrToInt(cbb_kt_f.Text);
	for i:=0 to memo.Lines.Count-1 do
	begin                                    // TextExtent -  chiều cao dòng
	 mi.Canvas.TextOut(x,y,memo.Lines[i]);
	 dong_dai:=mi.Canvas.TextExtent(memo.Lines[i]).cx;
	 y:=y+mi.Canvas.TextExtent(memo.Lines[i]).cy; // trên đường mòn. hàng
	 ve_gach_duoi_mi(mi,x,y,dong_dai);
	 y:=y+4;
		if x_toi_da<dong_dai+x then 
			x_toi_da:=dong_dai+x;
	end;
	mi.Canvas.Pen.Width:=rong_dong_ke;
	mi.Canvas.Pen.Color:=clRed;
	rong_ma:=x_toi_da+50;
	cao_ma:=y+40;
	ve_khung_mi(mi,x0,y0,rong_ma,cao_ma);
	
end;

procedure Tf_xem_truoc_bao_gia.BitBtn2Click(Sender: TObject);
begin printersetupdialog1.execute; end;

procedure go;
var ok : boolean;
begin
  ok := xywmfback;
  if buf then xygetbuffer(bufl);
	case f_xem_truoc_bao_gia.radiogroup1.itemindex of
	 0 : begin xycopytoclipboard; showmessage('Graph copied to clipboard'); end;
   1 : begin xyprint(true); end;
	 2 : begin xyprint2(0); end;
   3 : begin xysaveasbitmap(xybmpname,msgon,ok); end;
   4 : begin xysaveasmetafile(xywmfname,msgon,ok,1); end;
	 5 : begin xysaveasmetafile(xywmfname,msgon,ok,2); end;
	 6 : begin xysaveasmetafile(xywmfname,msgon,ok,4); end;
	end;
end;

procedure Tf_xem_truoc_bao_gia.BitBtn1Click(Sender: TObject);
{this enters filenames and starts the action by a timer delay}
var s : string;
   ok : boolean;
procedure getname1;
begin
  s := xybmpname;
  ok := inputquery('Save graph as bitmap file','Enter filename',s);
  if (s='') then ok := false; if not ok then exit;
  s := changefileext(s,'.bmp'); xybmpname := s;
end;
procedure getname2;
begin
  s := xywmfname;
  ok := inputquery('Save graph as metafile','Enter filename',s);
  if (s='') then ok := false; if not ok then exit;
  s := changefileext(s,'.wmf'); xywmfname := s;
end;
begin
	frm := screen.activeform.name;
	lam_moi;
   //copyform.showmodal;

	//f_xem_truoc_bao_gia.modalresult := 1;
	//f_xem_truoc_bao_gia.hide;
  ok := true;
  case radiogroup1.itemindex of
   3 : getname1; 4..6 : getname2; end;
 if ok then timer1.enabled := true;
end;


procedure setarrays;
var i : integer;
const styl1 : array[1..7] of integer = (4,clfuchsia,1,4,2,2,2);
      styl2 : array[1..7] of integer = (1,clblack,2,4,0,0,0);
      styl3 : array[1..7] of integer = (0,clgreen,1,0,1,6,1);
begin
	xysetdataarray(data,20,1);
  for i := 1 to 20 do data[i,1] := i+random*5;

  xysetdataarray(data2,19,3);
  for i := 1 to 19 do data2[i,1] := i+random*5;
  for i := 1 to 19 do data2[i,2] := i+random*2+12;
  for i := 1 to 19 do data2[i,3] := i+random*5+20;
  data2[0,2] := 2;

  xysetdataarray(data3,20+7,3);
  for i := 1 to 20 do
    begin data3[i+7,0] := i; data3[i+7,1] := 10+random*10;
      data3[i+7,2] := 18+random*10; data3[i+7,3] := 26+random*10; end;
  for i := 1 to 7 do
    begin data3[i,1] := styl1[i]; data3[i,2] := styl2[i]; data3[i,3] := styl3[i];end;
  data3[0,0] := 1; data3[0,1] := 1; data3[0,2] := 1; data3[0,3] := 1;
end; 


procedure Tf_xem_truoc_bao_gia.FormCreate(Sender: TObject);
var
	logscale:boolean;
	i:integer;
begin
	randomize; for i := 1 to 12 do res[i] := 100 + random(50);
  for i := 1 to 12 do err[i] := 5 + random(10);
	setlength(labels,12); for i := 0 to 11 do labels[i] := inttostr(i+1);
  for i := 1 to nspokes do with axes[i-1] do
    begin txt := 'Nr. '+inttostr(i); mi := 0; ma := i; end;
  setlength(bdata,3);
  with bdata[0] do begin ypos := 20; col := clred; end;
  with bdata[1] do begin ypos := 30; col := clgreen; end;
	with bdata[2] do begin ypos := 40; col := clblue; end;
	//d0 := date+time; dd := 1; decodedate(d0,y,m,d); decodetime(d0,h,n,s,ms);

	
	setarrays;
	radiogroup1.itemindex := 0;
	oldindex := 0;
end;


procedure setmode(n : integer);
{this disables some options for graphs in canvas mode}
begin
	with f_xem_truoc_bao_gia.RadioGroup1 do with xybuffers[n] do
	begin
	Tradiobutton(components[2]).enabled := not cvm;
	Tradiobutton(components[4]).enabled := not (cvm);
  Tradiobutton(components[5]).enabled := not (cvm);
	Tradiobutton(components[6]).enabled := not (cvm);
	if (cvm) then
	 if itemindex in [4,5,6] then itemindex := 3;
	if cvm then
	 if (itemindex=2) then itemindex := 1;
	end;
end;

procedure Tf_xem_truoc_bao_gia.lam_moi;
{this will fill the combobox with correct information}
var i,n : integer;
function tekst(n:integer): string;
var s : string;
begin
	with xybuffers[n] do
    begin
			if (n=0) then s := '--' else s := inttostr(lbl);
			s := s+' {'+inttostr(ngr)+'} '+inttostr(cw)+'x'+inttostr(ch);
      if cvm then s := s + ' CVM' else
      if bmp then s := s + ' BMP' else
      if b4d then s := s + ' B4D' else
      if str then s := s + ' STR';
      if (frm=form) then s := #149' '+s else s := '   ' + s;
    end;
  result := s;
end;
begin
  n := length(xybuffers);
  with combobox1 do with items do
  if (n=1) then
    begin
      text := tekst(0); buf := false;
      itemindex := 0; enabled := false;
      setmode(0); oldindex := 0;
    end
  else
    begin
      text := '';
      for i := 1 to n-1 do add(tekst(i));
      if (oldindex>n-2) then oldindex := 0;
      itemindex := oldindex; enabled := true;
      buf := true; bufl := xybuffers[1].lbl;
      setmode(1);
    end;
end;
//======================================== 

procedure Tf_xem_truoc_bao_gia.FormShow(Sender: TObject);
{this will fill the combobox with correct information}
var i,n : integer;
function tekst(n:integer): string;
var s : string;
begin
	with xybuffers[n] do
    begin
			if (n=0) then s := '--' else s := inttostr(lbl);
			s := s+' {'+inttostr(ngr)+'} '+inttostr(cw)+'x'+inttostr(ch);
      if cvm then s := s + ' CVM' else
      if bmp then s := s + ' BMP' else
      if b4d then s := s + ' B4D' else
      if str then s := s + ' STR';
      if (frm=form) then s := #149' '+s else s := '   ' + s;
    end;
  result := s;
end;
begin
  n := length(xybuffers);
  with combobox1 do with items do
  if (n=1) then
    begin
      text := tekst(0); buf := false;
      itemindex := 0; enabled := false;
      setmode(0); oldindex := 0;
    end
  else
    begin
      text := '';
      for i := 1 to n-1 do add(tekst(i));
      if (oldindex>n-2) then oldindex := 0;
      itemindex := oldindex; enabled := true;
      buf := true; bufl := xybuffers[1].lbl;
      setmode(1);
    end;
end;
//======================================== 
procedure Tf_xem_truoc_bao_gia.p_vPaint(Sender: TObject);
var
	y:integer;

	x:longint;
	can_le:integer; // 200
	don_vi:integer;
	don_vi0:integer;

	a4_rong:integer;
	st :TStringlist;
	tg:string;
	c:string;
	procedure chuyen_doi(chuoi:string);
	begin
		c:=dinh_dang_so_c(chuoi);	
		x:=Tinh_rong_dong(p_v,c);
	end;
const 
	tl_anh = 7;
	tl_le=20; // ty le le
	tl_cach_dong=31;
	vt_gach_duoi=19;
	
begin
	xycleargraph(p_v,clwhite,clblack,1);
	if Edit2.Text <>'' then
	a4_rong:=CmToPix(rong_a4/10);
	p_v.Height:=CmToPix(cao_a4/10);
	p_v.Width:=CmToPix(rong_a4/10);
	don_vi0:=p_v.Width div a4_rong;
	don_vi:=don_vi0;
	rong_trang:=p_v.Width;
	xycleargraph(p_v,clwhite,clblack,1);
	don_vi0:=don_vi;
	can_le:=44*don_vi0;
	
	rong_trang:=rong_trang-can_le;
	//---------------------------------------- 
	y:=thong_tin_cong_ty(p_v.Canvas,p_v.Width);
	y:=bao_gia(p_v.Canvas,p_v.Width,y,'SỐ: BG00001');

	st :=TStringlist.Create;
	st.Add(f_in_hoa_don_ban_hang.cbb_ten.text);
	st.Add(f_in_hoa_don_ban_hang.cbb_dia_chi.text);
	st.Add(f_in_hoa_don_ban_hang.cbb_dien_thoai.text);
	y:=thong_tin_ngoi_sao(p_v.Canvas,p_v.Width,y,st);
	y:=in_danh_sach(p_v.Canvas,p_v.Width,y,f_in_hoa_don_ban_hang.lv_danh_sach_thau_kinh);

	st.Clear;
	chuyen_doi(inttostr(tong_cong));
	st.Add(c);
	chuyen_doi(f_in_hoa_don_ban_hang.cbb_cu.Text);
	st.Add(c);
	tong_cong:= tong_cong+StrToInt(f_in_hoa_don_ban_hang.cbb_cu.Text);
	chuyen_doi(IntToStr(tong_cong));
	st.Add(c);
	st.Add(so_ra_chu(strtoint64(IntToStr(tong_cong)),sai,dung));
	y:=in_tong_cong(p_v.Canvas,p_v.Width,y,st);
	DateTimeToString(tg,shortdateformat,f_in_hoa_don_ban_hang.dtp_ngay_xuat.DateTime);
	y:=in_ngay_ky_ten(p_v.Canvas,p_v.Width,y,'Ngày '+tg); 
	p_v.Canvas.Font.Color:=clWebDarkOrange;	
	in_loi_cam_on(p_v.Canvas,p_v.Width,y,f_in_hoa_don_ban_hang.m_cam_on);
	st.Free;
end;

procedure Tf_xem_truoc_bao_gia.ComboBox1Change(Sender: TObject);
var n : integer;
begin
	n := combobox1.itemindex;
	bufl := xybuffers[n+1].lbl;
	setmode(n+1);
	oldindex := n;
end;

procedure Tf_xem_truoc_bao_gia.Edit2Change(Sender: TObject);
begin
	p_v.Refresh;
end;

procedure Tf_xem_truoc_bao_gia.Timer1Timer(Sender: TObject);
{this timer delay ensures that the graphs are refreshed
  before they are copied from the screen}
begin
  timer1.enabled := false; go;
end;

end.
