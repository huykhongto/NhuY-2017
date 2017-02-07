library DllHook;

uses
  SysUtils,
  Windows,
  Classes;//,
//  Dialogs;

{$R *.res}

// D�finition d'un buffer interm�diaire de stockage des touches
// 127 touches maxi en attente de lecture pas GetNextKey()
type
  PKeyBuffer = ^TKeyBuffer;
  TKeyBuffer = record
    kbIN: Integer;
    kbOUT: Integer;
    kbKEY: array[0..127] of Integer;
    kbID: array[0..127] of Integer;
  end;

// Handle des acc�s aux Hook et FileMapping par l'application principale
// Ces donn�es bien que globales ne sont pas accessible par les autres
// process. Elles ne peuvent donc pas �tre utilis�es par la fonction
// CallBack du hook.
var
  HandleHook: Integer = 0;
  HandleFile: Integer = 0;
  Pointeur: PKeyBuffer = nil;
  //HandleProg  :Hwnd;//Integer;//    =0;

// procedure fSendMsg();
 // begin
 // showmessage(IntToStr(HandleProg));
 // end;
// Fonction CallBack du hook plac� sur le clavier. Les touches lues sont plac�es
// dans le buffer pour �tre ensuite lues par la fonction GetNextKey().

function KeyboardHook(code: Integer; wparam: WPARAM; lparam: LPARAM): LRESULT stdcall;
type
  ptr_hwnd = ^hwnd;

var
  HandleFileLocal: Integer;
  PointeurLocal: PKeyBuffer;
  Adresse: Integer;
  ptr: ptr_hwnd;
  idmsg: Integer;


begin
//----------------------------------------
//message
  HandleFileLocal := OpenFileMapping(FILE_MAP_READ, False, 'HWNDFORM');
  if HandleFileLocal <> 0 then
  begin
     // showmessage('mappage ds dll ok');
    ptr := ptr_hwnd(MapViewOfFile(HandleFileLocal, FILE_MAP_READ, 0, 0, 0));
    if ptr <> nil then
    begin
      idmsg := RegisterWindowMessage('MY_CDOPEN');
      PostMessage(ptr^, idmsg, 0, 0); //)
    end
    else
      //showmessage('mappage ds dll OK');
  end
  else
    //showmessage('Erreur de mappage ds dll');
  CloseHandle(HandleFileLocal);


//-----------------------------------------
 //   fSendMsg();
  // Il faut penser que cette fonction s'ex�cute dans chaque process actif.
  // Les donn�es globales de la dll ne sont donc pas accessibles. Le file
  // mapping permet de palier � ce probl�me en offre un espace m�moire
  // facile d'acc�s en n'en connaissant que le nom.
  HandleFileLocal := OpenFileMapping(FILE_MAP_WRITE, False, 'KEYHOOK');
  if HandleFileLocal <> 0 then
  begin
    PointeurLocal := PKeyBuffer(MapViewOfFile(HandleFileLocal, FILE_MAP_WRITE, 0, 0, 0));
    if PointeurLocal <> nil then
    begin

      // Une fois le FileMapping effectu�, le buffer est en acc�s direct, on ajoute
      // alors la nouvelle touche � la suite de la file
      // WParam contient le code de touche virtuel
      // Le bit 31 de LParam est � 0 pour un KeyDown et � 1 pour un KeyUp
      Adresse := (PointeurLocal^.kbIN + 1) and 127;
      PointeurLocal^.kbID[Adresse] := GetCurrentProcessId;
      PointeurLocal^.kbKEY[Adresse] := (WParam and $0000FFFF) + (LParam and Longint($80000000));
      PointeurLocal^.kbIN := Adresse;
      UnMapViewOfFile(PointeurLocal);
    end;
    CloseHandle(HandleFileLocal);
  end;
  Result := CallNextHookEx(HandleHook, code, wparam, lparam);
end;

// Proc�dure d'initialisation du Hook et de cr�ation du FileMapping
// Elle doit �tre appel�e une fois et une seule en d�but de votre application

function StartHook(): Boolean; stdcall;
begin
  // HandleProg:=hwndprog;
//showmessage(IntToStr(HandleProg));
     // showmessage('create');

  HandleFile := CreateFileMapping($FFFFFFFF // Handle m�moire => partage de m�moire et non de fichier
    , nil // S�curit� par d�faut
    , PAGE_READWRITE // Acc�s en lecture/�criture
    , 0 // Taille de la zone partag�e   HIGH
    , SizeOf(TKeyBuffer) // Taille de la zone partag�e   LOW
    , 'KEYHOOK'); // Nom du partage
  if HandleFile <> 0
    then Pointeur := PKeyBuffer(MapViewOfFile(HandleFile // Handle obtenu par CreateFileMapping
      , FILE_MAP_WRITE // Acc�s en lecture/�criture
      , 0 // Pas d'offset
      , 0 // Pas d'offset
      , 0)); // Mapping de tout le fichier
  if Pointeur <> nil
    then begin
    Pointeur^.kbIN := 0; // Initialisation de la file d'attente
    Pointeur^.kbOUT := 0;
  end;
  HandleHook := SetWindowsHookEx(WH_KEYBOARD // Type de HOOK utilis� ( sur le clavier ici )
    , KeyboardHook // Adresse de la fonction CallBack qui sera appel�e
    , hInstance // Handle de la dll demandant le Hook
    , 0); // Pas d'ID Thread, car on veut un Hook syst�me
  Result := (HandleHook <> 0) and (HandleFile <> 0) and (Pointeur <> nil);
end;

// Proc�dure de fermeture du Hook
// Doit �tre appel�e en fin d'application

function StopHook: Boolean; stdcall;
begin
  Result := True;
  if Pointeur <> nil then UnMapViewOfFile(Pointeur); // Lib�ration du mapping
  if HandleFile <> 0 then CloseHandle(HandleFile); // Fermeture du fichier
  if HandleHook <> 0 then Result := UnHookWindowsHookEx(HandleHook); // Suppression du Hook
end;

// Proc�dure de lecture du buffer des touches par l'application.
// Chaque appel de la fonction envoi la touche suivante. La fonction renvoi True si une touche
// est effectivement disponible dans le buffer. Dans ce cas Key contient le code virtuel de la touche
// avec en plus dans le bit 31 de key, l'�tat KeyUP/KeyDown.
// Si le buffer est vide, la fonction renvoie False.

function GetNextKey(var Key, ID: Integer): Boolean; stdcall;
var Adresse: Integer;
begin
  if Pointeur^.kbIN <> Pointeur^.kbOUT
    then begin
    Adresse := (Pointeur^.kbOUT + 1) and 127;
    ID := Pointeur^.kbID[Adresse];
    Key := Pointeur^.kbKEY[Adresse];
    Pointeur^.kbOUT := Adresse;
    Result := True;
  end
  else Result := False;
end;

exports StartHook, StopHook, GetNextKey;

end.

