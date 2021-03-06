﻿unit f_ldnam_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
	LDNam_sys,LDNam_xu_ly_anh,PNGImage,AwResizeImage,LDNam_hinh_nen, Vcl.MPlayer, Data.FMTBcd, Data.DB,
	Data.SqlExpr, Datasnap.DBClient;

type
	Tf_ldnam = class(TForm)
		Button1: TButton;
		Panel1: TPanel;
    lv_thong_diep: TListView;
		lb_dl_cong_viec: TListBox;
		tm1: TTimer;
		ScrollBox1: TScrollBox;
		i_anh_vao: TImage;
		Button2: TButton;
    ScrollBox2: TScrollBox;
    i_mau: TImage;
    mp_1: TMediaPlayer;
		SQLDataSet1: TSQLDataSet;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    m_mo_ta: TMemo;
		procedure tm1Timer(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure hien_thi_thong_diep(thong_diep:string);
		procedure mo_am(ten_am:string);
	private
		{ Private declarations }
	public
    { Public declarations }
  end;

var
	f_ldnam: Tf_ldnam;
		doi_hinh:bool;
	che_do_am_thanh_:byte;
	tg_am_thanh_:integer;
const
	mau_xanh_la = clGreen;

implementation
uses f_nhu_y_f,f_thong_diep_f;


{$R *.dfm}

procedure Tf_ldnam.Button2Click(Sender: TObject);
var
PicPath : string;
begin
	//PicPath := duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg';
	//dat_hinh_nen(duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg',wsCenter);
	//PicPath := duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg';
	//dat_hinh_nen(duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg',wsCenter);
	//PicPath := duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg';
	//SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, Pointer(PicPath), SPIF_SENDWININICHANGE);
	//doi_hinh:=true;
	mo_am('at01.wma');
		//tg_am_thanh:=10;
		hien_thi_thong_diep('Kết thúc ngủ trưa');
end;
//======================================== 
procedure Tf_ldnam.hien_thi_thong_diep(thong_diep:string);
begin
	if f_thong_diep=nil then
		Application.CreateForm(Tf_thong_diep, f_thong_diep);
	f_thong_diep.viet_thong_diep(thong_diep);
	f_thong_diep.Show;                           
end;
//======================================== 
procedure Tf_ldnam.mo_am(ten_am:string);
begin
	//if mp_1.Position=0 then
	with mp_1 do
	begin
		FileName:=duong_dan_goc+'\Du lieu\Nhac\Am thanh\'+ten_am;
		Open;
		Play;
		che_do_am_thanh_:=am_thanh_bat;
		tg_am_thanh_:=2;
	end;
end;
//======================================== 
procedure Tf_ldnam.FormCreate(Sender: TObject);
begin
	duong_dan_goc:=extractfilepath(application.ExeName);
end;

procedure Tf_ldnam.tm1Timer(Sender: TObject);
var
	tg:string;
	PicPath : string;
	cao,rong:integer;
	trai,tren:integer;
const can_trai = 250;
	rong_max=1366;
	cao_max=768;
	cach_dong=25;
	cText = 'LÊ ĐĂNG NAM = NGUYỄN NGỌC NHƯ QUỲNH';
begin
	tg:=TimeToStr(now);
	if tg_am_thanh_>0 then
		tg_am_thanh_:=tg_am_thanh_-1;
{
	if tg='5:29:00 AM' then
	begin
		mo_am('at01.wma');
	end;

	if tg='5:41:00 AM' then // Băt đầu tập thể dục
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Tập thể dục!');
	end;

	if tg='5:59:00 AM' then // kết thúc tập thể dục
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Dừng tập thể dục!');
	end;
	if tg='6:00:00 AM' then // Bat dau nấu cơm
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Nấu cơm');
	end;
	if tg='6:20:00 AM' then // Bat dau nấu cơm
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc nấu cơm');
	end;
	
	if tg='6:30:00 AM' then // giờ ăn sáng
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Ăn sáng!');
	end;
	if tg='6:45:00 AM' then // hết giờ ăn sáng
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Nghĩ ngơi một chút!');
	end;
	if tg='7:30:00 AM' then // Bat dau lam việc
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Làm việc nào');
	end;
	if tg='11:20:00 AM' then // Bat dau nấu cơm
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Nấu cơm');
	end;
	if tg='11:40:00 AM' then // Bat dau nấu cơm
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc nấu cơm');
	end;

	if tg='11:50:00 AM' then // Bat dau ăn trua
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Ăn trưa');
	end;

	if tg='9:00:00 PM' then // Kết thúc ăn trưa
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Tắm rửa');
	end;

	if tg='9:30:00 PM' then // Kết thúc ăn trưa
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc tắm rửa');
	end;

	if tg='10:20:00 PM' then
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Thiền');
	end;

	if tg='11:10:00 PM' then
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc thiền');
	end;
	
	if tg='12:10:00 PM' then // Kết thúc ăn trưa
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc ăn trưa');
	end;

	if tg='12:30:00 PM' then // Bat dau ngủ trưa
	begin
		mo_am('at01.wma');
		hien_thi_thong_diep('Ngủ trưa');
	end;

	if tg='12:50:00 PM' then // Ket thúc ngử trưa
	begin
		mo_am('at02.wma');
		hien_thi_thong_diep('Kết thúc ngủ trưa');
	end;                          }
	//AImage.Assign(i_anh_lay_mau);
	//PNGImage: TPNGImage;
	if tg='10:30:00 PM' then
	with i_anh_vao do
	begin 
		//Canvas.StretchDraw(Rect(18, 18, 108, 108),AImage);
		//i_anh_vao.Picture.Bitmap.Width:=1366;
		//i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, 1366, 768), i_anh_vao.Picture.Bitmap);
		i_anh_vao.Picture.Bitmap.Width:=1366;
		i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(trai, tren, rong+trai, cao+tren), i_mau.Picture.Bitmap);
		canvas.font.name := 'Tahoma';
		Canvas.Pen.Width := 1;
		Canvas.Pen.Color := clGreen;
		Canvas.Brush.Style := bsClear;
		Canvas.Rectangle(2, 2, Width - 1, Height - 1);
		Canvas.Font.Size := 15;
		canvas.font.style := [fsbold];
		ve_chu_len_hinh(i_anh_vao,m_mo_ta);
	end;
	if tg='5:30:00 AM' then
	with i_anh_vao do
	begin 
		//Canvas.StretchDraw(Rect(18, 18, 108, 108),AImage);
		//i_anh_vao.Picture.Bitmap.Width:=1366;
		//i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, 1366, 768), i_anh_vao.Picture.Bitmap);
		i_anh_vao.Picture.Bitmap.Width:=1366;
		i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(trai, tren, rong+trai, cao+tren), i_mau.Picture.Bitmap);
		canvas.font.name := 'Tahoma';
		Canvas.Pen.Width := 1;
		Canvas.Pen.Color := clGreen;
		Canvas.Brush.Style := bsClear;
		//Canvas.Brush.Color := clYellow;
		Canvas.Rectangle(2, 2, Width - 1, Height - 1);
		Canvas.Font.Size := 15;
		canvas.font.style := [fsbold];
	 if tg='11:00:00 PM' then
	with i_anh_vao do
	begin 
		//Canvas.StretchDraw(Rect(18, 18, 108, 108),AImage);
		//i_anh_vao.Picture.Bitmap.Width:=1366;
		//i_anh_vao.Picture.Bitmap.Height:=768;
				i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, 1366, 768), i_anh_vao.Picture.Bitmap);
		i_anh_vao.Picture.Bitmap.Width:=1366;
		i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(trai, tren, rong+trai, cao+tren), i_mau.Picture.Bitmap);
		canvas.font.name := 'Tahoma';
		Canvas.Pen.Width := 1;
		Canvas.Pen.Color := clGreen;
		Canvas.Brush.Style := bsClear;
		Canvas.Rectangle(2, 2, Width - 1, Height - 1);
		Canvas.Font.Size := 15;
		canvas.font.style := [fsbold];
		ve_chu_len_hinh(i_anh_vao,m_mo_ta);
		doi_hinh:=true;
	end;	
		//Canvas.Font.Style := [fsStrikeOut];
		//Canvas.Font.Color := clGreen;
		
		begin
		{	Canvas.Font.Name := 'Tahoma';
			Canvas.Font.Style := [fsBold];
			Canvas.Font.Size := 16;      }
			// begin added code
			//Canvas.Brush.Color := clWhite;
			//Canvas.Brush.Color := clAqua;
			//Canvas.Pen.Style := psClear;
			//DrawTextOutline(Canvas, can_trai, 25, cText);
			// end added code
		 {	Canvas.Brush.Color := clGreen;  // $F0CAA6
			Canvas.Brush.Style := bsDiagCross;
			Canvas.Brush.Style := bsSolid;
			Canvas.Pen.Color := clYellow;
			//Canvas.Pen.Style := psDot;
			Canvas.Pen.Style := psClear;
			DrawTextOutline(Canvas, can_trai, 25, cText);  }
		end;
{	ttfc96 := TrueTypeFontClass.Create('Arial', 96);
		Image321.Bitmap.LoadFromFile(duong_dan_goc + 'Du lieu\Hinh anh\e1.jpg');
		ve_va_to(Image321.Bitmap, 20,170, 'LDNam', ttfc96, 1.8, $FF008000, $99C6EBAF);
		Image321.Bitmap.SaveToFile(duong_dan_goc + 'Du lieu\Hinh anh\e2.jpg');  }
		//GR32_Text.DrawAndOutline(Image321.Bitmap, 20,170, 'LDNam', ttfc96, 1.8, $FF008000, $99C6EBAF);
{	i_anh_vao.canvas.font.name := 'Arial';
	i_anh_vao.canvas.font.size := 18;
	i_anh_vao.canvas.font.style := [fsbold];
	with i_anh_vao.canvas do
	begin
	beginpath(i_anh_vao.canvas.handle);
	SetBKMode(Handle, 1);
	textout(300, 300, 'Tôi yêu em Quỳnh');
	endpath(i_anh_vao.canvas.handle);
	brush.color := clLime;
	pen.color := clGreen;
	pen.width := 1;
	StrokeAndFillPath(Handle);
	end;  
	with i_anh_vao.canvas do
	begin
	beginpath(i_anh_vao.canvas.handle);
	SetBKMode(Handle, 1);
	textout(200, 200, 'Quỳnh yêu Nam');
	endpath(i_anh_vao.canvas.handle);
	brush.color := clLime;
	pen.color := clGreen;
	pen.width := 1;
	StrokeAndFillPath(Handle);
	end;   }
		
	end;
	//dat_hinh_nen(duong_dan_goc+'Du lieu\Hinh anh\hn2.jpg',wsCenter);
	if doi_hinh=true then
	begin
		doi_hinh:=false;
    with i_anh_vao do
	begin 
		tai_anh_jpg(i_anh_vao,duong_dan_goc + 'Du lieu\Hinh anh\hn.jpg');
		tai_anh_jpg(i_mau,duong_dan_goc + 'Du lieu\Hinh anh\e1.jpg');
		rong:=i_mau.Picture.Bitmap.Width;
		cao:=i_mau.Picture.Bitmap.Height;
		trai:=(rong_max-rong)div 2;
		tren:=(cao_max-cao)div 2; 
				i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, 1366, 768), i_anh_vao.Picture.Bitmap);
		i_anh_vao.Picture.Bitmap.Width:=1366;
		i_anh_vao.Picture.Bitmap.Height:=768;
		i_anh_vao.Picture.Bitmap.Canvas.StretchDraw(Rect(trai, tren, rong+trai, cao+tren), i_mau.Picture.Bitmap);
		i_anh_vao.canvas.font.name := 'Tahoma';
		i_anh_vao.Canvas.Pen.Width := 1;
		i_anh_vao.Canvas.Pen.Color := clGreen;
		i_anh_vao.Canvas.Brush.Style := bsClear;
		i_anh_vao.Canvas.Rectangle(2, 2, Width - 1, Height - 1);
		i_anh_vao.Canvas.Font.Size := 14;
		i_anh_vao.canvas.font.style := [fsbold];
		ve_chu_len_hinh(i_anh_vao,m_mo_ta);
  end;
		luu_anh_jpg(i_anh_vao,duong_dan_goc + 'Du lieu\Hinh anh\hn2.jpg');  
		PicPath:=duong_dan_goc + 'Du lieu\Hinh anh\hn2.jpg';
		SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, Pointer(PicPath), SPIF_SENDWININICHANGE);
	end;
//	hn.dwStyle:=WPSTYLE_CENTER;
//	ActiveDesktop.SetWallpaperOptions(hn , 0);
	if (che_do_am_thanh_=am_thanh_bat) then
	begin
		if (mp_1.Position= mp_1.Length)and(tg_am_thanh_>0) then
		begin
				mp_1.Play;
		end;
		if (mp_1.Position= mp_1.Length)and(tg_am_thanh_=0) then
		begin
				che_do_am_thanh_:=am_thanh_tat;
				mp_1.close;
				//mp_1.Position:=0;
		end;
	end;
	
end;

end.
