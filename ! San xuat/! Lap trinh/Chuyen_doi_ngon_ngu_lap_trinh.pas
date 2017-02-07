unit Chuyen_doi_ngon_ngu_lap_trinh;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,LDNam_sys;

type
  Tf_Chuyen_doi_ngon_ngu_lap_trinh = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    cb_Nguon: TComboBox;
    cb_Dich: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    b_Chuyen_doi: TButton;
    b_sao_chep: TButton;
    mm_Nguon: TMemo;
    mm_Dich: TMemo;
    b_dan: TButton;
    cb_ghep_dl: TCheckBox;
    procedure b_Chuyen_doiClick(Sender: TObject);
    function StrBinToHex(BinStr: string): string;
    procedure b_sao_chepClick(Sender: TObject);
    procedure b_danClick(Sender: TObject);
  private
    { Private declarations }
  public
		{ Public declarations }
		ngon_ngu_nguon:integer;
  end;

var
  f_Chuyen_doi_ngon_ngu_lap_trinh: Tf_Chuyen_doi_ngon_ngu_lap_trinh;

implementation

{$R *.dfm}

procedure Tf_Chuyen_doi_ngon_ngu_lap_trinh.b_Chuyen_doiClick(Sender: TObject);
	var
	i:integer;
	j:integer;
	co_dl:byte; // bien bao co du lieu tren hang
	kieu_vao:string;
	dong:string;
	dong_dich:string;
	gia_tri_chuoi:string;
	KT:string;
	so_ki_tu_tren_dong:integer;
	dl_dong:byte; // so du lieu tren mot dong
	//---------------------------------------- 
	nhan:string;
	chu_thich:string;
	du_lieu:string;
begin
	ngon_ngu_nguon:=1;
	if ngon_ngu_nguon=0 then
	begin
		dl_dong:=0;
		dong_dich:=Chr($9); // them tab vao dau dong
		mm_dich.Text:='const int8 Du_lieu[]='+xuong_dong+'{'+xuong_dong; // them dau enter
		for i:=0 to mm_nguon.Lines.Count-1 do
		begin
			co_dl:=0;
			dong:=mm_nguon.Lines[i];
			dong := StringReplace(dong,' ', '', [rfReplaceAll]); // thay the toan bo khoang trang trong chuoi
			//dong:= trim (dong); // xoa khoang trang 2 dau chuoi
			so_ki_tu_tren_dong:=length(dong);
			j:=0;
			kieu_vao:='D';
			while j<=so_ki_tu_tren_dong do
			begin
				j:=j+1;
				if co_dl=0 then
				begin
					KT:= copy(dong,j,5);
					if KT= 'RETLW' then
					begin
						co_dl:=1;
						j:=j+4; // bo qua 5 ki tu RETLW
					end;
				end else
				begin
					KT:=dong[j];
					if (KT= 'B') or (KT= 'b') then
					begin
						kieu_vao:='B';
						j:=j+2; // bo qua ki tu B và ky tu '
						gia_tri_chuoi:= copy(dong,j,8);
						j:=j+8;
						gia_tri_chuoi:=StrBinToHex(gia_tri_chuoi);
						dong_dich:=dong_dich+'0x'+gia_tri_chuoi+',';
						dl_dong:=dl_dong+1;
						if dl_dong>8 then
						begin
							dl_dong:=0;
							mm_dich.Lines.Add(dong_dich);
							dong_dich:=dau_tab; // them tab vao dau dong
						end;
					end;
				end;
			end;
		end;
		if dong_dich<>Chr($9) then
			mm_dich.Lines.Add(dong_dich);
		mm_dich.Lines.add('};');
	end 
	//---------------------------------------- 
	else
	begin
		mm_dich.Text:='';
		co_dl:=0;
		du_lieu:='';
		//mm_dich.Text:='const int8 Du_lieu[]='+xuong_dong+'{'+xuong_dong;
		for i:=0 to mm_nguon.Lines.Count-1 do
		begin
			
			dong:=AnsiLowerCase(mm_nguon.Lines[i]);
			nhan:=cat_lay_bo_chuoi(dong,':');
			chu_thich:=cat_sau_lay_bo_chuoi(dong,';');
			if chu_thich<>'' then
				chu_thich:=' // '+chu_thich;
			dong:=StringReplace(dong,' ','',[rfReplaceAll]);
			dong:=StringReplace(dong,'db','',[rfReplaceAll]);

			if (nhan<>'')and(dong<>'')and (cb_ghep_dl.Checked=sai) then
			begin
				mm_dich.Lines.add('const int8 '+nhan+'[]='+xuong_dong+'{');
				mm_dich.Lines.add(dau_tab+dong+',');
			end;
			if cb_ghep_dl.Checked=dung then
			begin
				if (nhan<>'')and(dong='') then
				begin
					if co_dl=1 then
					begin
						mm_dich.Lines.add(dau_tab+du_lieu+chu_thich);
						mm_dich.Lines.add('};');
						co_dl:=0;
						du_lieu:='';
						chu_thich:='';
					end;
					mm_dich.Lines.add('const int8 '+nhan+'[]='+xuong_dong+'{'+chu_thich);
				end
				else
				if (du_lieu<>'')and(co_dl=1) then
				begin
					mm_dich.Lines.add(dau_tab+du_lieu+','+chu_thich);
					du_lieu:='';
					chu_thich:='';
				end;
				if dong<>'' then
				begin
					du_lieu:=dong;
					co_dl:=1;
				end;
			end;

			
//			so_ki_tu_tren_dong:=length(dong);
//			j:=0;
//			while j<=so_ki_tu_tren_dong do
//			begin
//				j:=j+1;
//				if co_dl=0 then
//				begin
//					KT:= copy(dong,j,5);
//					if KT= 'RETLW' then
//					begin
//						co_dl:=1;
//						j:=j+4; // bo qua 5 ki tu RETLW
//					end;
//				end else
//				begin
//					KT:=dong[j];
//					if (KT= 'B') or (KT= 'b') then
//					begin
//						kieu_vao:='B';
//						j:=j+2; // bo qua ki tu B và ky tu '
//						gia_tri_chuoi:= copy(dong,j,8);
//						j:=j+8;
//						gia_tri_chuoi:=StrBinToHex(gia_tri_chuoi);
//						dong_dich:=dong_dich+'0x'+gia_tri_chuoi+',';
//						dl_dong:=dl_dong+1;
//						if dl_dong>8 then
//						begin
//							dl_dong:=0;
//							mm_dich.Lines.Add(dong_dich);
//							dong_dich:=Chr($9); // them tab vao dau dong
//						end;
//					end;
//				end;
//			end;
		end;
		if dong_dich<>Chr($9) then
			mm_dich.Lines.Add(dong_dich);
		mm_dich.Lines.add('};');	
	end;
end;
//========================================
procedure Tf_Chuyen_doi_ngon_ngu_lap_trinh.b_danClick(Sender: TObject);
begin
	mm_nguon.Clear;
  mm_nguon.PasteFromClipboard;
	//mm_nguon.SelectAll ;
end;

procedure Tf_Chuyen_doi_ngon_ngu_lap_trinh.b_sao_chepClick(Sender: TObject);
begin
  mm_dich.SelectAll;
  mm_dich.CopyToClipboard;
  //mm_dich.ClearSelection;
end;

function Tf_Chuyen_doi_ngon_ngu_lap_trinh.StrBinToHex(BinStr: string): string;
const
  BinArray: array[0..15, 0..1] of string =
    (('0000', '0'), ('0001', '1'), ('0010', '2'), ('0011', '3'),
     ('0100', '4'), ('0101', '5'), ('0110', '6'), ('0111', '7'),
     ('1000', '8'), ('1001', '9'), ('1010', 'A'), ('1011', 'B'),
     ('1100', 'C'), ('1101', 'D'), ('1110', 'E'), ('1111', 'F'));
var
  Error: Boolean;
  j: Integer;
  BinPart: string;
begin
  Result:='';

  Error:=False;
  for j:=1 to Length(BinStr) do
    if not (BinStr[j] in ['0', '1']) then
    begin
      Error:=True;
      ShowMessage('Đây không phải là số nhị phân');
      Break;
    end;

  if not Error then
  begin
    case Length(BinStr) mod 4 of
      1: BinStr:='000'+BinStr;
      2: BinStr:='00'+BinStr;
      3: BinStr:='0'+BinStr;
    end;

    while Length(BinStr)>0 do
    begin
      BinPart:=Copy(BinStr, Length(BinStr)-3, 4);
      Delete(BinStr, Length(BinStr)-3, 4);
      for j:=1 to 16 do
        if BinPart=BinArray[j-1, 0] then
          Result:=BinArray[j-1, 1]+Result;
    end;
  end;
end;
end.
