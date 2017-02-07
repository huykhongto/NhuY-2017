unit xu_ly_du_lieu;

interface
uses
	LDNam_sys,Vcl.ComCtrls,Vcl.StdCtrls,System.SysUtils,khai_bao_tu_dien;
type
	Txu_ly_du_lieu = class
	private
	protected
	public
	end;
	function lb_lv(var lb:TListBox; var lv:TListView; so_cot:integer):boolean ;
	procedure lb_lv_cu(var lb:TListBox; var lv:TListView; so_cot:integer);
	procedure lb_cu__moi(var lb:TListBox; ten_file:string);
	function lv_lb(var lv:TListView; var lb:TListBox;so_cot:integer;ten_file:string):boolean;
	procedure lb_luu_file(var lb:TListBox; ten_file:string);
	function doi_so_thanh_tien(so_vao:string):string;
	implementation

function lv_lb(var lv:TListView; var lb:TListBox;so_cot:integer;ten_file:string):boolean;
var
	i,j, so_dong: integer;
	dong_dl: string;
	ListItem: TListItem;
begin
	lb.Clear;
	so_dong := lv.Items.Count - 1;
	//cbb_ten_khoan.Clear;
	for i := 0 to so_dong do
	begin
		ListItem := lv.Items[i];
		with ListItem do
		begin
			dong_dl := Caption+phan_cot;
			for j := 0 to so_cot-1 do
			begin
				dong_dl:=dong_dl+SubItems.Strings[j]+phan_cot;
			end;
			if Checked then dong_dl:=dong_dl+'v';
		end;
		// hoan_thanh:='s';
		// if ht=True then
		// hoan_thanh:='d';
		//dong_dl := ten + '~~1' + so_tien + '~~2' + ngay_thu + '~~3' + truc_thuoc +
		//	'~~4' + mo_ta + '~~5';
		//cbb_ten_khoan.Items.Add(ten);
		lb.Items.Add(dong_dl);
	end;
	//tm1.Enabled := true;
	lb.Items.Insert(0,phien_ban_du_lieu);
	lb.Items.SaveToFile(ten_file,TEncoding.UTF8);
	Result:=True;
end;
//======================================== 
function lb_lv(var lb:TListBox; var lv:TListView; so_cot:integer):boolean;
var
	i,j, so_dong: integer;
	vi_tri_cuoi: integer;
	dong_dl: string;
	ListItem: TListItem;
	a: array [0..10] of string;
	danh_dau:boolean;
begin
	Result:=dung;
	if lb.Items[0]<>phien_ban_du_lieu then
	begin
		Result:=sai;
		exit;
	end;
	so_dong := lb.Items.Count-1;
	lv.Clear;
	for i := 1 to so_dong do
	begin
		dong_dl := lb.Items[i];
		danh_dau:=sai;
		for j := 0 to so_cot do
		begin
			vi_tri_cuoi := AnsiPos(phan_cot, dong_dl);
			a[j]:=copy(dong_dl, 1, vi_tri_cuoi-1);
			dong_dl:=copy(dong_dl,vi_tri_cuoi+2,Length(dong_dl));
		end;
		if copy(dong_dl, 1, Length(dong_dl))='v' then danh_dau:=dung;
		ListItem := lv.Items.Add;
		with ListItem do
		begin
			Caption := a[0];
			for j := 1 to so_cot do
			begin
				SubItems.Add(a[j]);
      end;
			Checked := danh_dau;
		end;
	end;
end;
//---------------------------------------- 
procedure lb_lv_cu(var lb:TListBox; var lv:TListView; so_cot:integer);
var
	i,j, so_dong: integer;
	vi_tri_dau, vi_tri_cuoi: integer;
	dong_dl: string;
	ListItem: TListItem;
	a: array [0..10] of string;
begin   
	lv.Clear;
	so_dong := lb.Items.Count - 1;
	for i := 0 to so_dong do
	begin
		dong_dl := lb.Items[i];
		vi_tri_dau := 1;
		vi_tri_cuoi := AnsiPos('~~1', dong_dl);
		a[0]:=copy(dong_dl, vi_tri_dau, vi_tri_cuoi - vi_tri_dau);
		vi_tri_dau := vi_tri_cuoi + 3;
		vi_tri_cuoi := AnsiPos('~~2', dong_dl);
		a[1]:=copy(dong_dl, vi_tri_dau, vi_tri_cuoi - vi_tri_dau);
		vi_tri_dau := vi_tri_cuoi + 3;
		vi_tri_cuoi := AnsiPos('~~3', dong_dl);
		a[2]:= copy(dong_dl, vi_tri_dau, vi_tri_cuoi - vi_tri_dau);
		vi_tri_dau := vi_tri_cuoi + 3;
		vi_tri_cuoi := AnsiPos('~~4', dong_dl);
		a[3]:= copy(dong_dl, vi_tri_dau, vi_tri_cuoi - vi_tri_dau);
		vi_tri_dau := vi_tri_cuoi + 3;
		vi_tri_cuoi := AnsiPos('~~5', dong_dl);
		a[4]:= copy(dong_dl, vi_tri_dau, vi_tri_cuoi - vi_tri_dau);
		ListItem := lv.Items.Add;
		with ListItem do
		begin
			Caption := a[0];
			for j := 1 to so_cot do
			begin
				SubItems.Add(a[j]);
      end;
			Checked := false;
		end;
	end;
end;

//---------------------------------------- 
procedure lb_cu__moi(var lb:TListBox; ten_file:string);
var
	i,j, so_dong: integer;
	dong_dl: string;
begin   
	so_dong := lb.Items.Count - 1;
	for i := 0 to so_dong do
	begin
		dong_dl := lb.Items[i];
		lb.Items.Delete(i);
		for j := 1 to 9 do
			dong_dl := StringReplace(dong_dl,'~~'+IntToStr(j),phan_cot,[rfReplaceAll]);
		lb.Items.Insert(i,dong_dl);
	end;
	lb.Items.Insert(0,phien_ban_du_lieu);
	lb.Items.SaveToFile(ten_file,TEncoding.UTF8);
end;
//---------------------------------------- 
procedure lb_luu_file(var lb:TListBox; ten_file:string);
begin   
	if FileExists(ten_file) = False then
	begin
		lb.Items.Insert(0,phien_ban_du_lieu);
		lb.Items.SaveToFile(ten_file,TEncoding.UTF8);
	end;
	lb.Items.LoadFromFile(ten_file,TEncoding.UTF8);
end;
//========================================
function doi_so_thanh_tien(so_vao:string):string;
var
	i: integer;
	boi:string;
begin
	AnsiLowerCase(so_vao);
	boi:=so_vao[Length(so_vao)];
	if boi='k' then
		boi:='000'
	else
	if boi='m' then
		boi:='000000'
	else
		boi:='';
	Result:='';
	For I:=1 to Length(so_vao) do
		If Ansipos(copy(so_vao,i,1),'0123456789.')<> 0 then
		Result:=Result+Copy(so_vao, I, 1);
	Result:=Result+boi;
end;

end.
