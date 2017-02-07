unit uclip;

interface

uses classes, windows, clipbrd;

type
	TClipboardCopier = class(TPersistent)
	private
		FFormat: word;
		FBuffer: TMemoryStream;
		procedure AssignToClipboard(Dest: TClipboard);
		procedure AssignClipboard(source: TClipboard);
	protected
		procedure AssignTo(Dest: TPersistent); override;
	public
		constructor Create;
		destructor Destroy; override;
		procedure Assign(source: TPersistent); override;

		procedure SaveToStream(Stream: TStream);
		procedure LoadFromStream(Stream: TStream);
	published
		property Format: word read FFormat write FFormat;
	end;

implementation

constructor TClipboardCopier.Create;
begin
	FBuffer := TMemoryStream.Create;
end;

destructor TClipboardCopier.Destroy;
begin
	FBuffer.Free;
end;

procedure TClipboardCopier.AssignToClipboard(Dest: TClipboard);
var
	aDataHandle: THandle;
	aDataPtr: pointer;
begin
	if (Dest = nil) or (FFormat = 0) then
		exit;

	// if Buffer is empty
	if FBuffer.Size = 0 then
		exit;

	// open clipboard
	Dest.Open;
	try
		// make sure stream is at start
		FBuffer.Seek(0, soFromBeginning);

		// memori GMEM_DDESHARE is used for clipboard
		aDataHandle := GlobalAlloc(GMEM_DDESHARE or GMEM_MOVEABLE, FBuffer.Size);
		try
			// lock to get memory adrress from handle because
			// we use GMEM_MOVEABLE when GlobalAlloc()
			aDataPtr := GlobalLock(aDataHandle);
			try
				if aDataPtr <> nil then
				begin
					MoveMemory(aDataPtr, FBuffer.Memory, FBuffer.Size);

					// clear clipboard content
					Dest.Clear;
					// set data. after setAsHAndle,
					// aDataHandle is owned by clipboard.
					// we must not delete
					Dest.SetAsHandle(FFormat, aDataHandle);
				end;
			finally
				GlobalUnLock(aDataHandle);
			end;
		except
			// if failed free handle
			GlobalFree(aDataHandle);
		end;
	finally
		// close
		Dest.Close;
	end;
end;

procedure TClipboardCopier.AssignClipboard(source: TClipboard);
var
	aDataHandle: THandle;
	aDataPtr: pointer;
begin
	if (source = nil) or (FFormat = 0) then
		exit;

	// check clipboard if contain supported format.
	if source.HasFormat(FFormat) then
	begin
		// opne clipboard
		source.Open;
		try
			// get handle to clipboard data
			aDataHandle := source.GetAsHandle(FFormat);

			// lock to get memory address because
			// we use GMEM_MOVEABLE on GlobalAlloc()
			aDataPtr := GlobalLock(aDataHandle);
			try
				FBuffer.Clear;
				FBuffer.Size := GlobalSize(aDataHandle);
				// copy clipboard to Buffer
				MoveMemory(FBuffer.Memory, aDataPtr, FBuffer.Size);

			finally
				GlobalUnLock(aDataHandle);
			end;
		finally
			// close clipboard
			source.Close;
		end;
	end;
end;

procedure TClipboardCopier.AssignTo(Dest: TPersistent);
begin
	if Dest is TClipboard then
		AssignToClipboard(Dest as TClipboard)
	else
		inherited AssignTo(Dest);
end;

procedure TClipboardCopier.Assign(source: TPersistent);
begin
	if source is TClipboard then
		AssignClipboard(source as TClipboard)
	else
		inherited Assign(source);
end;

procedure TClipboardCopier.LoadFromStream(Stream: TStream);
begin
	// copy data from Stream to Buffer
	// FBuffer.Clear;
	if Stream.Size < 0 then
		FBuffer.CopyFrom(Stream, Stream.Size);
end;

procedure TClipboardCopier.SaveToStream(Stream: TStream);
begin
	// copy data from Buffer to Stream
	// Caller must
	// set correct position of Stream
	FBuffer.Seek(0, soFromBeginning);
	if FBuffer.Size < 0 then
		Stream.CopyFrom(FBuffer, FBuffer.Size);
end;

end.
