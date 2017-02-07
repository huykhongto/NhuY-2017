unit f_xem_truoc_in_f;
(*
This unit is a utility for easy printing and copying of graphs.
It enables the selection of a mode for copy or print, and to set the printer.

If there are multiple graphs, each buffered by XYPutBuffer, it also
enables a selection of one of these with a ComboBox.
For each graph the information is presented like:
	LL {N} WWxHH [CVM] [BMP] [STR] [B4D]
meaning: LL    the label of the graph as set by XYPutBuffer
				 {N}   the number of graph elements (calls to XYStartGraph, 1-8)
				 WWxHH dimensions of the canvas in pixels
				 CVM   graph is plotted in canvas mode, no high-res or metafiles
				 BMP   graph contains a bitmap that is saved as a bitmap in metafiles
				 B4D   graph contains a 4D bitmap that is changed in high-res or metafiles
				 STR   graph contains red/green stereo image
A preceding dot indicates that this graph is visible on the active form.
If there are no graphs stored into the buffer the combobox is disabled and
will show information of the present graph(s) with -- as label.

How to implement this utility:
- add XYCopy.pas to your project: click Project | Add to Project ...
- add XYCopy to the uses clause of your program/unit
- start the utility with a call to XYCopyStart

It is possible to set default names for .BMP or .WMF files with the variables
	xybmpname and xywmfname.
The variable xywmfback determines if a frame and background is to be
	created in metafiles (default = false).
*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, ExtCtrls, Vcl.ComCtrls,LDNam_sys,xygraph3d,Math, 
	Printers,LDNam_xu_ly_anh;

type
  Tf_xem_truoc_in = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
		pb_ve: TPaintBox;
    Edit1: TEdit;
    Button1: TButton;
    TabSheet2: TTabSheet;
    PaintBox2: TPaintBox;
    TabSheet3: TTabSheet;
    PaintBox3: TPaintBox;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ComboBox2: TComboBox;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBox1: TScrollBox;
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
		procedure pb_vePaint(Sender: TObject);
		procedure lam_moi;
    procedure PaintBox2Paint(Sender: TObject);
    procedure PaintBox3Paint(Sender: TObject);
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
  f_xem_truoc_in: Tf_xem_truoc_in;

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
	 f_xem_truoc_in.showmodal;
end;

procedure Tf_xem_truoc_in.BitBtn3Click(Sender: TObject);
begin f_xem_truoc_in.modalresult := 1; end;

procedure Tf_xem_truoc_in.Button2Click(Sender: TObject);
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

procedure Tf_xem_truoc_in.BitBtn2Click(Sender: TObject);
begin printersetupdialog1.execute; end;

procedure go;
var ok : boolean;
begin
  ok := xywmfback;
  if buf then xygetbuffer(bufl);
	case f_xem_truoc_in.radiogroup1.itemindex of
	 0 : begin xycopytoclipboard; showmessage('Graph copied to clipboard'); end;
   1 : begin xyprint(true); end;
	 2 : begin xyprint2(0); end;
   3 : begin xysaveasbitmap(xybmpname,msgon,ok); end;
   4 : begin xysaveasmetafile(xywmfname,msgon,ok,1); end;
	 5 : begin xysaveasmetafile(xywmfname,msgon,ok,2); end;
	 6 : begin xysaveasmetafile(xywmfname,msgon,ok,4); end;
	end;
end;

procedure Tf_xem_truoc_in.BitBtn1Click(Sender: TObject);
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

	//f_xem_truoc_in.modalresult := 1;
	//f_xem_truoc_in.hide;
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


procedure Tf_xem_truoc_in.FormCreate(Sender: TObject);
var
	logscale:boolean;
	i:integer;
begin
	pb_ve.Height:= cao_a4*2;
	pb_ve.Width:=rong_a4*2;
	
	randomize; for i := 1 to 12 do res[i] := 100 + random(50);
  for i := 1 to 12 do err[i] := 5 + random(10);
	setlength(labels,12); for i := 0 to 11 do labels[i] := inttostr(i+1);
	//checkbox1.hint := '|change to: graph 1: log scale, symbol legend; graph 2: labelaxis, errorbar; graph 3: fixed Y/X ratio';
	//button3.hint := '|print, copy or save graph';
  pb_ve.hint := '|graph area; click for ruler function; control-click to zoom';
  paintbox2.hint := '|graph area; click for ruler function; control-click to zoom';
  paintbox3.hint := '|graph area; click for ruler function; control-click to zoom';
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
	with f_xem_truoc_in.RadioGroup1 do with xybuffers[n] do
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

procedure Tf_xem_truoc_in.lam_moi;
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

procedure Tf_xem_truoc_in.FormShow(Sender: TObject);
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

procedure Tf_xem_truoc_in.pb_vePaint(Sender: TObject);
var
	logscale:boolean;
	e,y,i:integer;
	b_ha : Tbitmap;
begin
	b_ha := Tbitmap.create;
	b_ha.LoadFromFile(duong_dan_goc+'/LDN.bmp');
	ResizeBitmap(b_ha,100,100);
	pb_ve.Canvas.Draw(300, 300, b_ha); 
	xycleargraph(pb_ve,clwhite,clblack,8/8);
	pb_ve.Canvas.Draw(0, 0, b_ha); 
	//xycleargraph.Canvas.Draw(0, 0, b_ha); 

	 { - - - first graph - - - }

	
	 xystartgraph(0,50,4,65,40,70,50,40,clipon);
	 xyxaxis(clblack,1,100,0,0,'X-axis',1,gridoff,logscale,sci{fixed},0);
	 xyyaxis(clblack,1,100,0,0,'@First',1,gridoff,logscale,fixed);
	 xybrush.style := bsdiagcross;
	 xy3dquad(point3d(1,1,0),point3d(1,100,0),point3d(100,100,0),-1,clyellow,false,false);
	 xybrush.style := bssolid;

	 xymove(0,0); for i := 1 to 9 do
		 begin xydraw(i*10,i*10); xysymbol(1,0,1); end;
	 if logscale then xylegendentry(3,'symb 1')
							 else xylegendentry(0,'line 1');

	 xysetlinestyle(16,0,0);
	 xyyaxis(clblue,1,10,0,0,'Second',2,gridoff,logscale,fixed);
   xylinewidth(1);
   xymove(0,0); for i := 1 to 9 do
		 begin
       xydraw(i*10,i*10);
       xysymbol(2,8,1);
		 end;
   if logscale then xylegendentry(3,'symb 2')
               else xylegendentry(0,'line 2');
	 xysetlinestyle(0,0,0);

   xyyaxis(clgreen,1,10000,0,0,'Third',3,gridoff,logscale,fixed);
	 xylinewidth(2);
   xymove(0,0); for i := 1 to 9 do
     begin xydraw(i*10,i*10); xysymbol(3,8,0); end;
	 if logscale then xylegendentry(3,'symb 3')
               else xylegendentry(0,'line 3');
   xylinewidth(1);

   xyyaxis(clred,1,1000,0,0,'@Fourth',4,gridoff,logscale,fixed);
   xymove(0,0); for i := 1 to 9 do
		 begin xydraw(i*10,i*10); xysymbol(4,8,2); end;
   if logscale then xylegendentry(3,'symb 4')
               else xylegendentry(0,'line 4'); 
	 xytitle(clgray,'GRAPH 1');

   { - - - second graph - - - }

   xystartgraph(50,100,4,65,70,10,30,20,clipon);
	 with in_hoa_dondata[0] do
		 xy3dquad(point3d(x1,y1,0),point3d(x1,y2,0),point3d(x2,y2,0),
     -1,$d0ffd0,false,false);

	// if checkbox1.checked then xylabelaxis(clblack,labels,gridoff)
		 //else 
		 xyyearaxis(clblack,3,0,gridoff);
	 xyset(45,-90,3); xyset(41,1,3);
   xyyaxis(clblack,0,180,0,0,'Results',5,gridon,lin,fixed);
   if logscale then
		 begin
       xypen.color := clfuchsia;
       for i := 1 to 12 do
				 begin
					 y := res[i]; e := err[i];
           if (i=1) then xymove(i,y) else xydraw(i,y);
					 xyerrorbar(i,y,0,0.4,0.4,e*2,-e*2,e,-e,rel,userc,0);
         end;
       xylegendentry(4,'errbar');
		 end
   else
     begin
			 for i := 1 to 12 do xybar(clfuchsia,i,0.7,res[i],0);
       xylegendentry(1,'bar');
     end;

   {xybar2(7,1.8,50,25,clyellow,clblue,-1,22,20,1,1+2);}
   {xybar2(8,3.5,30,70,clyellow,clblue,-1,6,3,6,1);}
	 {xylegendentry(5,'bar2');}
   xytitle(clgray,'GRAPH 2');

	 { - - - third graph - - - }

   xysetfont('Times New Roman',10,2,0,0);
	 xystartgraph(0,100,65,100,35,55,20,25,clipon);
   //if checkbox1.checked then xysetratio(1);
   xyxaxis(clblack,-10,10,0,0,'',gridoff,logscale,fixed);
	 xyyaxis(clblack,-1.05,1.05,0,0,'sine functions',5,gridoff,logscale,fixed);
   xylinewidth(2);
   xysetlinestyle(15,60,2);
	 //xydrawfunction(4,sinx);
   xypen.color := clred;
   xylinewidth(1);
	 xysetlinestyle(0,0,0);
   //xydrawfunction(0,sinx2,-9,9);

	 xyfinish;

   xytitle(clgray,'GRAPH 3');
	 xydeffont;

	 { - - - additional instructions - - - }

	 xylegendmake(3,pb_ve.width div 2,24,0,1,
		 0,round(pb_ve.height*0.55),0,frameon);

	 xysetusercoordinates(0,0);
	 xytextangle(clblack,'XYGRAPH|(C) 2002',pb_ve.width-10,
		 round(pb_ve.height*0.82),0,1,1,-90);
	 xytitle(clmaroon,'@2D CARTESIAN CO-ORDINATES');

	 xyinitruler(clgray,20,round(pb_ve.height*0.65)-xycharheight div 2,1,8);
	 pb_ve.Canvas.Draw(200, 200, b_ha); 
	 b_ha.Free;
end;

procedure Tf_xem_truoc_in.p_vPaint(Sender: TObject);
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
	xycleargraph(pb_ve,clwhite,clblack,1);
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
	y:=hoa_don(p_v.Canvas,p_v.Width,y,'SỐ: HD00004');

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

procedure Tf_xem_truoc_in.PaintBox2Paint(Sender: TObject);
var i : integer;
begin
	 xycleargraph(paintbox2,clwhite,clblack,8/8);
  {--------- POLAR DEMO ----------------------------------------}

   xystartgraph(0,50,5,100,40,40,40,40,clipon);
	 with in_hoa_dondata[0] do
    xy3dcircle(point3d((x1+x2) div 2,(y1+y2) div 2,0),point3d(0,0,0),
      min((x2-x1) div 2,(y2-y1) div 2),0,-1,$fff0f0,false,false,0);

	 //if checkbox1.checked then
	 //     xypolargraph(clmaroon,1,2,90,0,reverse,angle,gridon,true)
//   else 
xypolargraph(clmaroon,1,2, 0,0,normal,straight,gridon,true);
   xypen.color := clblue; xylinewidth(2);
   xymove(0,1); for i := 1 to 100 do xydraw(1+i/100,i*10);
   xytitle(clgray,'POLAR GRAPH');

   xystartgraph(50,100,5,100,40,40,40,40,clipon);
	 //if checkbox1.checked then
			 // xyradargraph(clnavy,axes,2,90,1,normal,straight,sci,0)
	 //else 
	 xyradargraph(clnavy,axes,0,90,1,normal,straight,sci,0);
   xylinewidth(2);
   xypen.color := clred; xyradardraw([0.5,1,1.5,2,2.5],1,1);
   xypen.color := clgreen; xyradardraw([0.8,0.8,0.8,0.8,0.8],1,2);
   xypen.color := clblue; xyradardraw([0.5,1,0.5,1,0.5,1,0.5,1],1,2);
   xytitle(clgray,'RADAR GRAPH');  

   xyfinish;
   xytitle(clmaroon,'@2D POLAR CO-ORDINATES');
	 xyinitruler(clblack,paintbox2.width div 2,paintbox2.height-16,1,0);
end;

procedure Tf_xem_truoc_in.PaintBox3Paint(Sender: TObject);
	var tm : boolean;
begin
  xycleargraph(paintbox3,clwhite,clblack,1.0);

  {--------- TIMEAXIS DEMO ----------------------------------------}

  if checkbox1.checked then
    begin
      dmin := 1;
      xystartgraph(0,100,0,40,30,20,30,60,clipon);
      xytimeaxis(clblack,d0-dd,d0+dd,'date',1,0,0,0,2,false,tm);
    end
  else
    begin
      dmin := 1/24/60/60;
      xystartgraph(0,100,0,40,30,20,30,50,clipon);
      xytimeaxis(clblack,d0-dd,d0+dd,'date|time and date '+ystring,-1,1,1+4,1,2,false,tm);
    end;
  xyyaxis(clblack,0,100,0,0,'',1,gridoff,lin,fixed);
  xymove(d0,0); xydraw(d0,100);
  d1 := encodedate(y,m,d)+encodetime(h,n,s,0); xymove(d1,0); xydraw(d1,90);
  d1 := encodedate(y,m,d)+encodetime(h,n,0,0); xymove(d1,0); xydraw(d1,80);
  d1 := encodedate(y,m,d)+encodetime(h,0,0,0); xymove(d1,0); xydraw(d1,70);
  d1 := encodedate(y,m,d); xymove(d1,0); xydraw(d1,60);
  d1 := encodedate(y,m,1); xymove(d1,0); xydraw(d1,50);
  d1 := encodedate(y,1,1); xymove(d1,0); xydraw(d1,40);
  d1 := encodedate(2000,1,1); xymove(d1,0); xydraw(d1,30);
  d1 := encodedate(1900,1,1); xymove(d1,0); xydraw(d1,20);
  xytitle(clmaroon,'TimeAxis demo, press + to zoom in, - to zoom out, SPACE to reset');

  {------- PLOTARRAY DEMO ------------------------------------------}

  xystartgraph(0,33,45,100,30,0,20,40,clipon);
  if checkbox1.checked then
    begin
    end
  else
    begin
      xyxaxis(clblack,0,20,0,0,'X-axis',false,false,false);
      xyyaxis(clgreen,0,25,0,0,'Y-axis',1,false,false,false);
      xysymbol(2,4,2);
    end;
  xyplotarray(data,0,2);
  xytitle(clmaroon,'PlotArray single');

  xystartgraph(33,67,45,100,30,0,20,40,clipon);
  if checkbox1.checked then
    begin
      {do nothing - xyplotarray defines axes }
    end
  else
    begin
      xyxaxis(clblack,0,20,0,0,'X-axis',false,false,false);
      xyyaxis(clblack,0,50,0,0,'Y-1',1,false,false,false);
      xyyaxis(clred,0,50,0,0,'Y-2',2,false,false,false);
      xyyaxis(clblue,0,50,0,0,'Y-3',3,false,false,false);
      xysymbol(2,4,2);
    end;
  xyplotarray(data2,0,3);
  xytitle(clmaroon,'PlotArray multiple');

  xystartgraph(67,100,45,100,30,8,20,40,clipon);
  if checkbox1.checked then
    begin
      xylabels[0] := 'X data';
    end
  else
    begin
      xyxaxis(clblack,0,20,0,0,'X-axis',false,false,false);
      xyyaxis(clblack,0,40,0,0,'Y-axis',1,false,false,false);
    end;
  xyplotarray(data3,0,3);
  xytitle(clmaroon,'PlotArray advanced');

  if checkbox1.checked then
     xyinitruler(clred,8,round(paintbox3.height * 0.45)-20,1,3)
  else
		 xyinitruler(clmaroon,8,round(paintbox3.height * 0.45)-20,1,0)
end;

procedure Tf_xem_truoc_in.ComboBox1Change(Sender: TObject);
var n : integer;
begin
  n := combobox1.itemindex;
  bufl := xybuffers[n+1].lbl;
  setmode(n+1);
  oldindex := n;
end;

procedure Tf_xem_truoc_in.Edit2Change(Sender: TObject);
begin
	p_v.Refresh;
end;

procedure Tf_xem_truoc_in.Timer1Timer(Sender: TObject);
{this timer delay ensures that the graphs are refreshed
  before they are copied from the screen}
begin
  timer1.enabled := false; go;
end;

end.
