unit f_quan_ly_tai_khoan_ngan_hang_f.dcu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
	LDNam_sys,xu_ly_du_lieu,khai_bao_tu_dien,System.UITypes;
	
type
  Tf_quan_ly_tai_khoan_ngan_hang = class(TForm)
    lb_ds_tk: TListBox;
    Splitter1: TSplitter;
    Label1: TLabel;
    m_mo_ta: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    cbb_stk: TComboBox;
    lv_cac_khoan_ngan_hang: TListView;
    ttp_ngay_du_tinh: TDateTimePicker;
    p_nut_nhan: TPanel;
    bt_them_thu: TButton;
    bt_xoa: TButton;
    bt_sua: TButton;
    CheckBox1: TCheckBox;
    cbb_ten_khoan: TComboBox;
    cbb_ngay_cn: TComboBox;
    cbb_tien: TComboBox;
    Panel1: TPanel;
    bt_them_tk: TButton;
    Button2: TButton;
    bt_sua_tk: TButton;
    cbb_ten_tk: TComboBox;
    lv_ds_tk: TListView;
    cbb_ngan_hang: TComboBox;
    lb_cac_khoan_ngan_hang: TListBox;
    cbb_thu_chi: TComboBox;
    sttb1: TStatusBar;
    cbb_truc_thuoc: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bt_them_tkClick(Sender: TObject);
    procedure lv_ds_tkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure bt_them_thuClick(Sender: TObject);
		procedure bt_xoaClick(Sender: TObject);
		procedure them_dl(them: byte);
    procedure bt_sua_tkClick(Sender: TObject);
    procedure lv_cac_khoan_ngan_hangMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
	f_quan_ly_tai_khoan_ngan_hang: Tf_quan_ly_tai_khoan_ngan_hang;
	ten_file_chon:string;

implementation

{$R *.dfm}

uses
	f_nhu_y_f;

procedure Tf_quan_ly_tai_khoan_ngan_hang.bt_them_thuClick(Sender: TObject);
var
	so_dong,i: integer;
	 ngay_them: string;
	chuoi,dong_mo_ta,dong_dl:string;
	trung_lap:boolean;
	them:byte;
begin
	them:=1;
//	if chon = 't' then
//		chuoi:='Bạn chưa nhập tên khoản thu'
//	else if chon = 'c' then
//		chuoi:='Bạn chưa nhập tên khoản chi'
//	else if chon = 'd' then
//		chuoi:='Bạn chưa nhập tên khoản dự định chi'
//	else if chon = 'dt' then
//		chuoi:='Bạn chưa nhập tên khoản dự định thu';
			 
	if cbb_ten_khoan.Text = '' then
	begin
		sttb1.Panels[0].Text := 'E';
		//tm1.Enabled := true;
		exit;
	end
	else if cbb_tien.Text = '' then
	begin
		sttb1.Panels[0].Text := 'Bạn chưa nhập số tiền';
		//tm1.Enabled := true;
		exit;
	end
	else
	begin
		trung_lap := False;
//		for i := 0 to cbb_ten_khoan.Items.Count - 1 do
//		begin
//			if (cbb_ten_khoan.Items[i] = cbb_ten_khoan.Text) then
//			begin
//				trung_lap := true;
//				sttb1.Panels[0].Text := 'Trùng lặp tên khoản thu chi';
//				Beep;
//				tm1.Enabled := true;
//				exit;
//			end;
//		end;
		if trung_lap = False then
		begin
			dong_mo_ta := m_mo_ta.Lines[0]; // nạp dòng đầu tiên
			so_dong := m_mo_ta.Lines.Count;
			dong_dl := '';
			i := 0;
			While i < so_dong - 1 Do
			begin
				i := i + 1;
				dong_mo_ta := dong_mo_ta + phan_dong + m_mo_ta.Lines[i];
			end;
			if them=1 then
				ngay_them := DateTimeToStr(now)
			else
				ngay_them := cbb_ngay_cn.Text;
			dong_dl := cbb_ten_khoan.Text + phan_cot + cbb_tien.Text + phan_cot +
				cbb_thu_chi.Text + phan_cot + ngay_them + phan_cot + cbb_truc_thuoc.Text + phan_cot +
				dong_mo_ta + phan_cot;
			lb_cac_khoan_ngan_hang.Items.Add(dong_dl);
			lb_cac_khoan_ngan_hang.Items.SaveToFile(duong_dan_goc+'\Du lieu\DLN\D'+ten_file_chon+'LDNNH',
				TEncoding.UTF8);
			lb_lv(lb_cac_khoan_ngan_hang,lv_cac_khoan_ngan_hang,5);
			sttb1.Panels[0].Text := 'Thành công!';

			//sttb1.Color:=clGreen;
		end;
	end;
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.bt_them_tkClick(Sender: TObject);
begin
	them_dl(1);
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.them_dl(them: byte);
Var dong_dl,dong_mo_ta:string;
i,so_dong:integer;
	ten_du_lieu:string;
begin
	if (cbb_stk.text='')or(cbb_ten_tk.text='')or(cbb_ngan_hang.text='') then
		exit;
	if them=1 then
	begin
		ten_du_lieu:=IntToStr(ten_file_dl_ngan_hang);
		ten_du_lieu:=duong_dan_goc+'\Du lieu\DLN\D'+ten_du_lieu+'LDNNH';
		lb_cac_khoan_ngan_hang.Items.Clear;
		lb_luu_file(lb_cac_khoan_ngan_hang,ten_du_lieu);
		ten_file_dl_ngan_hang:=ten_file_dl_ngan_hang+1;
		f_nhu_y.t_ghi_ini.Enabled:=true;
  end;
	dong_dl:='';
	i := 0;
	dong_mo_ta := m_mo_ta.Lines[0]; // nạp dòng đầu tiên
	so_dong := m_mo_ta.Lines.Count;
	While i < so_dong - 1 Do
	begin
		i := i + 1;
		dong_mo_ta := dong_mo_ta + '``' + m_mo_ta.Lines[i];
	end;
	dong_dl:=cbb_ten_tk.Text+phan_cot +cbb_stk.Text+phan_cot +cbb_ngan_hang.text +
	phan_cot + dong_mo_ta +phan_cot + IntToStr(ten_file_dl_ngan_hang)+ phan_cot;;
	if them=1 then
	begin
		lb_ds_tk.Items.Add(dong_dl);
		lb_ds_tk.Items.SaveToFile(duong_dan_goc + '\Du lieu\DSTK.LDN',
							TEncoding.UTF8);
		lb_lv(lb_ds_tk,lv_ds_tk,4)
	end else
	begin
		lb_ds_tk.Items[lv_ds_tk.itemindex+1]:=dong_dl;
		lb_ds_tk.Items.SaveToFile(duong_dan_goc + '\Du lieu\DSTK.LDN',
			TEncoding.UTF8);
		lb_lv(lb_ds_tk,lv_ds_tk,4);		
	end;
	
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.bt_xoaClick(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn xóa dữ liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
	begin
		lb_cac_khoan_ngan_hang.Items.Delete(lv_cac_khoan_ngan_hang.ItemIndex+1); // Remove selected item
		lb_cac_khoan_ngan_hang.Items.SaveToFile(duong_dan_goc+'\Du lieu\DLN\D'+ten_file_chon+'LDNNH',
			TEncoding.UTF8);
		lv_cac_khoan_ngan_hang.Items.Delete(lv_cac_khoan_ngan_hang.ItemIndex);
	end;
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.Button2Click(Sender: TObject);
begin
	if MessageDlg('Bạn có muốn xóa dữ liệu này!?', mtConfirmation, [mbYes, mbNo],
		0) = idYes then
	begin
			lb_ds_tk.Items.Delete(lv_ds_tk.ItemIndex+1); // Remove selected item
			lb_ds_tk.Items.SaveToFile(duong_dan_goc + '\Du lieu\DSTK.LDN',
				TEncoding.UTF8);
			lv_ds_tk.Items.Delete(lv_ds_tk.ItemIndex);
			xoa_file(duong_dan_goc+'\Du lieu\DLN\D'+ten_file_chon+'LDNNH');
	end;
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.bt_sua_tkClick(Sender: TObject);
begin
	them_dl(0);
	bt_sua_tk.Enabled:=false;
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.FormCreate(Sender: TObject);
begin
	lb_luu_file(lb_ds_tk,duong_dan_goc + '\Du lieu\DSTK.LDN');
	lb_lv(lb_ds_tk,lv_ds_tk,4)
	//lv_lb(lv_ds_tk,lb_ds_tk,2,duong_dan_goc + '\Du lieu\DSTK.LDN');
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.lv_cac_khoan_ngan_hangMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
	mo_ta:string;
begin
	if lv_cac_khoan_ngan_hang.ItemIndex = -1 then
		Exit;
	bt_sua_tk.Enabled:=true;
	lb_cac_khoan_ngan_hang.ItemIndex := lv_cac_khoan_ngan_hang.ItemIndex+1;
	lb_cac_khoan_ngan_hang.Selected[lb_cac_khoan_ngan_hang.ItemIndex];
	ListItem := lv_cac_khoan_ngan_hang.Items[lv_cac_khoan_ngan_hang.ItemIndex];
	with ListItem do
	begin
		cbb_ten_khoan.Text:=Caption;
		cbb_tien.Text := SubItems.Strings[0];
		cbb_thu_chi.Text := SubItems.Strings[1];
		cbb_ngay_cn.Text := SubItems.Strings[2];
		cbb_truc_thuoc.Text := SubItems.Strings[3];
		mo_ta := SubItems.Strings[4];
		mo_ta:= StringReplace(mo_ta, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_mo_ta.Text := mo_ta;
	end;
	//lb_cac_khoan_ngan_hang.Items.Clear;
	//lb_luu_file(lb_cac_khoan_ngan_hang,duong_dan_goc+'\Du lieu\DLN\D'+ten_file_chon+'LDNNH');
	//lb_lv(lb_cac_khoan_ngan_hang,lv_cac_khoan_ngan_hang,5)
end;

procedure Tf_quan_ly_tai_khoan_ngan_hang.lv_ds_tkMouseDown(Sender: TObject;
	Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	ListItem: TListItem;
		mo_ta:string;
begin
	if lv_ds_tk.ItemIndex = -1 then
		Exit;
	bt_sua_tk.Enabled:=true;
	lb_ds_tk.ItemIndex := lv_ds_tk.ItemIndex+1;
	lb_ds_tk.Selected[lb_ds_tk.ItemIndex];
	ListItem := lv_ds_tk.Items[lv_ds_tk.ItemIndex];
	with ListItem do
	begin
		cbb_ten_tk.Text:=Caption;
		cbb_stk.Text := SubItems.Strings[0];
		cbb_ngan_hang.Text := SubItems.Strings[1];
		mo_ta := SubItems.Strings[2];
		mo_ta:= StringReplace(mo_ta, phan_dong, Chr($0D) + Chr($0A), [rfReplaceAll]);
		m_mo_ta.Text := mo_ta;
		ten_file_chon := SubItems.Strings[3];
		
	end;
	lb_cac_khoan_ngan_hang.Items.Clear;
	lb_luu_file(lb_cac_khoan_ngan_hang,duong_dan_goc+'\Du lieu\DLN\D'+ten_file_chon+'LDNNH');
	lb_lv(lb_cac_khoan_ngan_hang,lv_cac_khoan_ngan_hang,5)
end;

end.
