unit f_in_to_gui_buu_pham_f;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, Jpeg, Printers, ComCtrls, Vcl.Imaging.pngimage,LDNam_sys,f_dl_f,LDNam_dl;

type
  Tf_in_to_gui_buu_pham = class(TForm)
    m_nguoi_gui: TMemo;
    Button3: TButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    m_to: TMemo;
    cb_thu_ho: TCheckBox;
    e_tien_thu_ho: TEdit;
    cb_phi_vc: TCheckBox;
    m_ten_hang: TMemo;
    i_logo: TImage;
    cbb_kt_f: TComboBox;
    PrintDialog1: TPrintDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    cbb_ten: TComboBox;
    cbb_dia_chi: TComboBox;
    cbb_dien_thoai: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lv_kh: TListView;
    b_tim: TButton;
    cb_tim_nang_cao: TCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
		Button1: TButton;
    ComboBoxEx1: TComboBoxEx;
		procedure Button3Click(Sender: TObject);
		procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
		procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
		procedure Button10Click(Sender: TObject);
		procedure ve_khung(x0,y0,x1,y1:integer);
		procedure ve_gach_duoi(x0,y0,x1:integer);
		procedure in_khung_chu(x0,y0:integer;tua_de:string;memo:tmemo);
    procedure b_timClick(Sender: TObject);
    procedure cbb_tenChange(Sender: TObject);
    procedure cbb_dia_chiChange(Sender: TObject);
		procedure cbb_dien_thoaiChange(Sender: TObject);
		procedure giai_ma_dl(vi_tri:integer);
    procedure cbb_tenKeyPress(Sender: TObject; var Key: Char);
    procedure lv_khMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure lv_khColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv_khCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
		{ Private declarations }
		sap_xep_tang: boolean;
		cot_sap_xep: integer;
  public
    { Public declarations }
  end;

var
	f_in_to_gui_buu_pham: Tf_in_to_gui_buu_pham;
	da_tim:boolean;
	vi_tri_xem:integer;
	tu_vua_tim:string;
	dong_dl:string;
	so_tu_tim_thay:integer;
	ty_le:integer;
	vi_tri_chon:integer;
	li_tam: TListItem;
	ten:string;
	dong,nghia_tu,tu_tra:string;
	vi_tri,vi_tri_dau,vi_tri_cuoi:integer;
	co_tu :bool;
	i:integer;
	tu_don:string; // tung tu don
	ListItem: TListItem;
	p:integer;
	cao_ma:integer;
	rong_ma:integer;

const 
	may_in_mac_dinh = 'Foxit Reader PDF Printer';

implementation


{$R *.DFM}
uses f_quan_ly_ngoi_sao_f;

procedure Tf_in_to_gui_buu_pham.b_timClick(Sender: TObject);
begin
	if da_tim=False then
	begin
		da_tim:=true;
		vi_tri_xem:=0;
		lv_kh.Clear;
		tu_vua_tim:=cbb_ten.Text;
		tu_tra:= tu_vua_tim;
		//sed_nghia.Lines.Clear;
		if cb_tim_nang_cao.Checked=false then
		begin
			for i:=1 to dl_ngoi_sao.sl_dl.Count-1 do  // tìm kiếm toàn bộ từ
			begin
				tu_tra:=bo_dau(tu_tra);
				tu_tra:= LowerCase(tu_tra);
				nghia_tu:=dl_ngoi_sao.sl_dl[i];
				nghia_tu:=bo_dau(nghia_tu);
				nghia_tu:=LowerCase(nghia_tu);
				p:=AnsiPos(tu_tra,nghia_tu); // tim tu trong dong
				if p>0 then
				begin
					giai_ma_dl(i);
				end;
			end;
			so_tu_tim_thay:=lv_kh.Items.Count;
			//l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' mục';
		end
		else
		begin  // tim kiếm tưng từ.co trong chuoi tim
			for i:=1 to dl_ngoi_sao.sl_dl.Count-1 do  // tìm kiếm toàn bộ từ
			begin
				nghia_tu:=dl_ngoi_sao.sl_dl[i];
//				nghia_tu:=bo_dau(nghia_tu);
//				nghia_tu:=LowerCase(nghia_tu);
				ty_le:=tim_tung_tu_kttt(tu_tra,nghia_tu);
				if ty_le>0 then
				begin
					giai_ma_dl(i);
				end;
			end;
			//(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv,column.index)
			//(Sender as TCustomListView).6(@Sap_xep_so_lv,column.index;
			lv_kh.CustomSort(@Sap_xep_so_lv,-4);
			so_tu_tim_thay:=lv_kh.Items.Count;
			//l_tim_thay.Caption:='Tìm thấy:'+IntToStr(so_tu_tim_thay)+' mục';
    end;
	end;
	if so_tu_tim_thay>0 then
	begin
		ListItem := lv_kh.Items[vi_tri_xem];
		vi_tri_chon:= StrToInt(ListItem.SubItems.Strings[4]);
		ten:=ListItem.Caption;
		cbb_dia_chi.Text:=ListItem.SubItems.Strings[0];
		cbb_dien_thoai.Text:=ListItem.SubItems.Strings[1];
		dong:=copy(dong,vi_tri_dau,vi_tri_cuoi-vi_tri_dau);
		cbb_ten.Text:=ten;
		vi_tri_xem:=vi_tri_xem+1;
		if vi_tri_xem>=so_tu_tim_thay then vi_tri_xem:=0;
		m_to.Clear;
		m_to.Lines.Add(ten);
		m_to.Lines.Add(cbb_dia_chi.Text);
		m_to.Lines.Add('Tel: '+cbb_dien_thoai.Text);
	end;
end;


procedure Tf_in_to_gui_buu_pham.Button1Click(Sender: TObject);
begin
	Button1.Caption:=IntToStr(dem_chuoi_trong_chuoi('dw','dwdddwgdgggeajdhsfjdwlakjlk kflkajlfkj kaldfkjdw kjflkajklj dkfjjl'))
end;

procedure Tf_in_to_gui_buu_pham.Button3Click(Sender: TObject);
var
 dong:string;
	cao_1: integer;
begin
	Printer.SetPrinter(may_in_mac_dinh,'','',0);
	Printer.Title:='In BP';
	Printer.BeginDoc;
	in_khung_chu(400 div 2,400 div 2,'From: ',m_nguoi_gui);
	cao_1:=cao_ma+50;
	in_khung_chu(rong_ma-200,cao_1,'',m_ten_hang);
	in_khung_chu(500,cao_ma+50,'To: ',m_to);
	
	if cb_thu_ho.Checked=true then
	begin
		dong:='Thu hộ: '+e_tien_thu_ho.Text;
		if cb_phi_vc.Checked=true then
		begin
			dong:=dong+' + Phí vận chuyển';
		end;
		Printer.Canvas.TextOut(400,cao_1,dong);
		//in_khung_chu(400,cao_1,'',dong)
  end;
	Printer.EndDoc; 
end;
//======================================== 
procedure Tf_in_to_gui_buu_pham.in_khung_chu(x0,y0:integer;tua_de:string;memo:tmemo);
var
	x,y,x_toi_da,i:integer;
	dong_dai:integer;
const rong_dong_ke=4;
begin
	Printer.Canvas.Font:=memo.Font;
	Printer.Canvas.Font.Size:=StrToInt(cbb_kt_f.Text);
	Printer.Canvas.Font.Style:= [TFontStyle.fsBold];
	x:=x0+50; // tọa độ của đầu ra văn bản
	y:=y0+40;
	Printer.Canvas.TextOut(x,y,tua_de);
	x:=x+Printer.Canvas.TextExtent(tua_de).cx;
	x_toi_da:=x;
	//y:=y+Printer.Canvas.TextExtent('From: ').cy;
	Printer.Canvas.Font:=memo.Font;
	Printer.Canvas.Font.Size:=StrToInt(cbb_kt_f.Text);
	for i:=0 to memo.Lines.Count-1 do
	begin                                    // TextExtent -  chiều cao dòng
	 Printer.Canvas.TextOut(x,y,memo.Lines[i]);
	 dong_dai:=Printer.Canvas.TextExtent(memo.Lines[i]).cx;
	 y:=y+Printer.Canvas.TextExtent(memo.Lines[i]).cy; // trên đường mòn. hàng
	 ve_gach_duoi(x,y,dong_dai);
	 y:=y+4;
		if x_toi_da<dong_dai+x then 
			x_toi_da:=dong_dai+x;
	end;
	Printer.Canvas.Pen.Width:=rong_dong_ke;
	Printer.Canvas.Pen.Color:=clRed;
	rong_ma:=x_toi_da+50;
	cao_ma:=y+40;
	ve_khung(x0,y0,rong_ma,cao_ma);
	
end;

procedure Tf_in_to_gui_buu_pham.lv_khColumnClick(Sender: TObject;
  Column: TListColumn);
begin
	sap_xep_tang := not sap_xep_tang; // inversion du précédent ordre de tri
	cot_sap_xep := Column.Index; // Quel colonne est à trier ?
	// Ensuite on détermine quel est le type de colonne à trier:
	// on peut aussi les déterminer en spécifiant un tag particulier dans chaque colonne
	if (AnsiPos('Ngày thêm', Column.Caption) > 0) or
		(AnsiPos('Ngày hoàn thành', Column.Caption) > 0) then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_thoi_gian_lv,
				-Column.Index)
	end
	else if (AnsiPos('Dự tính', Column.Caption) > 0) then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang_lv,
				Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_ngay_thang_lv,
				-Column.Index)
	end
	else if AnsiPos('Quan trọng', Column.Caption) > 0 then
	begin
		if sap_xep_tang then
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, Column.Index)
		else
			(Sender as TCustomListView).CustomSort(@Sap_xep_so_lv, -Column.Index)
	end
	else
		(Sender as TCustomListView).AlphaSort;
	//f_dl.lb_ngoi_sao_luu_lv(lv_khach_hang,7);
end;

procedure Tf_in_to_gui_buu_pham.lv_khCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
	ix: integer;
begin
	if sap_xep_tang then
		if cot_sap_xep = 0 then
			Compare := CompareText(Item1.Caption, Item2.Caption)
		else
		begin
			ix := cot_sap_xep - 1;
			Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
		end
	else if cot_sap_xep = 0 then
		Compare := CompareText(Item2.Caption, Item1.Caption)
	else
	begin
		ix := cot_sap_xep - 1;
		Compare := CompareText(Item2.SubItems[ix], Item1.SubItems[ix]);
	end;
end;

procedure Tf_in_to_gui_buu_pham.lv_khMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	muc:string;
begin
	if lv_kh.itemindex <> -1 then
	begin
		ListItem := lv_kh.Items[lv_kh.ItemIndex];
		with ListItem do
	begin
		cbb_ten.Text:=Caption;
		cbb_dia_chi.Text := SubItems.Strings[0];
		cbb_dien_thoai.Text := SubItems.Strings[1];
		muc := SubItems.Strings[2];
	end;
		m_to.Clear;
		m_to.Lines.Add(cbb_ten.text);
		m_to.Lines.Add(cbb_dia_chi.Text);
		m_to.Lines.Add('Tel: '+cbb_dien_thoai.Text);
	end;
end;

//======================================== 
procedure Tf_in_to_gui_buu_pham.ve_gach_duoi(x0,y0,x1:integer);
begin
	Printer.Canvas.Pen.Width:=2;
	Printer.Canvas.Pen.Color:=clLime;
	Printer.Canvas.MoveTo(x0,y0);
	Printer.Canvas.LineTo(x0+x1,y0);
end;
//======================================== 
procedure Tf_in_to_gui_buu_pham.ve_khung(x0,y0,x1,y1:integer);
begin
	Printer.Canvas.MoveTo(x0,y0);
	Printer.Canvas.LineTo(x0,y1);
	Printer.Canvas.LineTo(x1,y1);
	Printer.Canvas.LineTo(x1,y0);
	Printer.Canvas.LineTo(x0,y0);
end;
//======================================== 
procedure Tf_in_to_gui_buu_pham.Button5Click(Sender: TObject);
begin
 //выводимое изображение содержится в образе Image1
 Printer.SetPrinter(may_in_mac_dinh,'','',0);
 Printer.Title:='In BP';
 Printer.BeginDoc;
 Printer.Canvas.Draw(1000,1000,i_logo.Picture.Bitmap);
 Printer.EndDoc;
end;

procedure Tf_in_to_gui_buu_pham.Button6Click(Sender: TObject);
var
 logo:TBitMap;
begin
//загрузка логотипа
 logo:=TBitMap.Create;
 logo.LoadFromFile('LDN.bmp');  //логотип
//начало вывода
	Printer.SetPrinter(may_in_mac_dinh,'','',0);
 Printer.Title:='In BP';
 Printer.BeginDoc;
//вывод логотипа
 Printer.Canvas.Draw(100,100,logo);
//вывод реквизитов
 Printer.Canvas.Font.Name:='Courier';
 Printer.Canvas.Font.Style:=[fsBold]+[fsItalic];
 Printer.Canvas.Font.Size:=14;
 Printer.Canvas.TextOut(Printer.PageWidth div 2,100,'ООО "Moidodyr"');
 Printer.Canvas.Font.Style:=[];
 Printer.Canvas.Font.Size:=10;
 Printer.Canvas.TextOut(Printer.PageWidth div 2,150,'Спб, Хреновская ул., 34');
 Printer.Canvas.Font.Size:=10;
 Printer.Canvas.TextOut(Printer.PageWidth div 2,200,'Тел: 111-22-33, Факс: 444-55-66');
//chia dòng đầu ra
 Printer.Canvas.Pen.Style:=psDash;
 Printer.Canvas.MoveTo(100,250);
 Printer.Canvas.LineTo(Printer.PageWidth-100,250);
//завершение вывода
 Printer.EndDoc;
//удаление экземпляра объекта TBitMap
 logo.Free; 
end;


procedure Tf_in_to_gui_buu_pham.Button8Click(Sender: TObject);
begin
 PrinterSetupDialog1.Execute;
	//PrinterSetupDialog1.Execute()
end;

procedure Tf_in_to_gui_buu_pham.Button9Click(Sender: TObject);
var
 i, start, stop: integer;
begin
 PrintDialog1.Options:=[poPageNums,poSelection];
 PrintDialog1.FromPage:=1;
 PrintDialog1.MinPage:=1;
 if not PrintDialog1.Execute then Exit;
 if PrintDialog1.PrintRange=prAllPages
 then
	begin
	 Start:=PrintDialog1.MinPage-1;
	 Stop:=PrintDialog1.MaxPage-1;
	end
 else // если выбрано отличное от 'Print All'
	if PrintDialog1.PrintRange=prSelection
	then
	 begin
		Stop:=Start;
	 end
 else // если выбрано отличное от 'Выделенный фрагмент'
	begin
	 Start:=PrintDialog1.FromPage-1;
	 Stop:=PrintDialog1.ToPage-1;
	end;
 // начало печати
 Printer.BeginDoc;
 for i:=start to stop do
	begin
	 if i<>stop
	 then Printer.NewPage;
	end;
 Printer.EndDoc;  
end;

procedure Tf_in_to_gui_buu_pham.cbb_dia_chiChange(Sender: TObject);
begin
	da_tim:=false;
end;

procedure Tf_in_to_gui_buu_pham.cbb_dien_thoaiChange(Sender: TObject);
begin
	da_tim:=false;
end;

procedure Tf_in_to_gui_buu_pham.cbb_tenChange(Sender: TObject);
begin
	da_tim:=false;
end;

procedure Tf_in_to_gui_buu_pham.cbb_tenKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then begin
		b_tim.Click;
		key:= #0;
	end;
end;

procedure Tf_in_to_gui_buu_pham.Button10Click(Sender: TObject);
var
 x1,x2,y1,y2: integer;
 PointsX, PointsY: double;
 PrintDlg: TPrintDialog;
begin
 // создание и отображеие стандартного окна печати
 PrintDlg:=TPrintDialog.Create(Owner);
 if PrintDlg.Execute then
  begin
   // новый документ
   Printer.BeginDoc;
   Printer.Canvas.Refresh; // обновление инф-ии на холсте принтера
   // инф-я о разрешении принтера (70 - коэф-т масштабирования)
   PointsX:=GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSX)/70;
   PointsY:=GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSY)/70;
   // рассчет размеров изображения
	 x1:=round((Printer.PageWidth-i_logo.Picture.Bitmap.Width*PointsX)/2);
	 y1:=round((Printer.PageHeight-i_logo.Picture.Bitmap.Height*PointsY)/2);
	 x2:=round(x1+i_logo.Picture.Bitmap.Width*PointsX);
	 y2:=round(y1+i_logo.Picture.Bitmap.Height*PointsY);
   // вывод изображения на печать
	 Printer.Canvas.CopyRect(Rect(x1,y1,x2,y2),i_logo.Picture.Bitmap.Canvas,
				Rect(0,0,i_logo.Picture.Bitmap.Width,i_logo.Picture.Bitmap.Height));
   Printer.EndDoc;
  end;
 // уничтожение созданного окна печати
 PrintDlg.Free;
end;
//======================================== 
procedure Tf_in_to_gui_buu_pham.giai_ma_dl(vi_tri:integer);

var
	j: integer;
	vi_tri_cuoi: integer;
	ListItem: TListItem;
	a: array [0..10] of string;
begin
	dong_dl:=dl_ngoi_sao.sl_dl[vi_tri];
		for j := 0 to 8 do
		begin
			vi_tri_cuoi := AnsiPos(phan_cot, dong_dl);
			a[j]:=copy(dong_dl, 1, vi_tri_cuoi-1);
			dong_dl:=copy(dong_dl,vi_tri_cuoi+2,Length(dong_dl));
		end;
		ListItem := lv_kh.Items.Add;
		with ListItem do
		begin
			Caption := a[1];
			SubItems.Add(a[3]);
			SubItems.Add(a[4]);
			SubItems.Add(a[7]);
			if cb_tim_nang_cao.Checked=true then SubItems.Add(IntToStr(ty_le))
			else SubItems.Add('0');
			SubItems.Add(IntToStr(vi_tri));
		end;
	end;
end.
