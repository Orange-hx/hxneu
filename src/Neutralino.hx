package;

import haxe.extern.EitherType;

#if (haxe_ver < 4)
import js.Promise;
#else
import js.lib.Promise;
#end

@:native("window")
extern class NeutralinoGlobal {
    public static var NL_APPID(default, null): String;
    public static var NL_ARGS(default, null): Array<String>;
    public static var NL_CVERSION(default, null): String;
    public static var NL_CWD(default, null): String;
    public static var NL_MODE(default, null): String;
    public static var NL_OS(default, null): String;
    public static var NL_PATH(default, null): String;
    public static var NL_PORT(default, null): UInt;
    public static var NL_TEST(default, null): String;
    public static var NL_TOKEN(default, null): String;
    public static var NL_VERSION(default, null): String;
}

typedef OpenActionOptions = {
    var ?url: String;
}

typedef NeutralinoResult = {
    var ?success: Bool;
}

typedef NeutralinoWindowConfig = {
    var ?title: String;
    var ?width: Int;
    var ?height: Int;
    var ?minWidth: Int;
    var ?minHeight: Int;
    var ?maxWidth: Int;
    var ?maxHeight: Int;
    var ?fullScreen: Bool;
    var ?icon: String;
    var ?alwaysOnTop: Bool;
    var ?enableInspector: Bool;
    var ?borderless: Bool;
    var ?maximize: Bool;
    var ?resizable: Bool;
    var ?hidden: Bool;
}

typedef NeutralinoCLIConfig = {
    var ?binaryName: String;
    var ?resourcesPath: String;
    var ?clientLibrary: String;
    var ?binaryVersion: String;
    var ?clientVersion: String;
}

typedef NeutralinoAppModes = {
    var ?window: NeutralinoWindowConfig;
    var ?browser: Dynamic;
    var ?cloud: Dynamic;
}

typedef NeutralinoConfig = {
    var ?applicationId: String;
    var ?port: UInt;
    var ?defaultMode: String;
    var ?enableHTTPServer: Bool;
    var ?enableNativeAPI: Bool;
    var ?url: String;
    var ?nativeBlockList: Array<String>;
    var ?globalVariables: Array<Dynamic>;
    var ?modes: NeutralinoAppModes;
    var ?cli: NeutralinoCLIConfig;
}

typedef NeutralinoConfigResult = {
    var ?config: NeutralinoConfig;
}

extern class NeutralinoApp {
    public var __esModule(default, null): Bool;
    public function exit(): Promise<NeutralinoResult>;
    public function keepAlive(): Promise<NeutralinoResult>;
    public function getConfig(): Promise<NeutralinoConfigResult>;
    public function open(options: OpenActionOptions): Promise<NeutralinoResult>;
}

typedef PathOptions = {
    var ?path: String;
}

typedef WriteFileOptions = {
    var ?fileName: String;
    var ?data: String;
}

typedef FileOptions = {
    var ?filename: String;
}

typedef FileReadResult = {
    var ?data: String;
    var ?success: Bool;
}

@:enum abstract EntryType(String) {
    var FILE;
    var DIRECTORY;
}

typedef FileEntry = {
    var ?entry: String;
    var ?type: EitherType<String, EntryType>;
}

typedef ReadDirectoryResult = {
    var ?entries: Array<FileEntry>;
}

extern class NeutralinoFS {
    public var __esModule(default, null): Bool;
    public function createDirectory(options: PathOptions): Promise<NeutralinoResult>;
    public function removeDirectory(options: PathOptions): Promise<NeutralinoResult>;
    public function writeFile(options: WriteFileOptions): Promise<NeutralinoResult>;
    public function readFile(options: FileOptions): Promise<FileReadResult>;
    public function removeFile(options: FileOptions): Promise<NeutralinoResult>;
    public function readDirectory(options: PathOptions): Promise<ReadDirectoryResult>;
}

typedef ExecCommandOptions = {
    var ?command: String;
}

typedef ExecCommandResult = {
    var ?output: String;
    var ?success: Bool;
}

typedef GetEnvarOptions = {
    var ?key: String;
}

typedef GetEnvarResult = {
    var ?value: String;
    var ?success: Bool;
}

typedef DialogOpenOptions = {
    var ?title: String;
    var ?isDirectoryMode: Bool;
}

typedef DialogOpenResult = {
    var ?selectedEntry: Dynamic;
    var ?success: Bool;
}

typedef DialogSaveOptions = {
    var ?title: String;
}

typedef DialogSaveResult = {
    var ?selectedEntry: Dynamic;
    var ?success: Bool;
}

typedef NotificationOptions = {
    var ?summary: String;
    var ?body: Dynamic;
}

typedef MessageBoxOptions = {
    var ?title: String;
    var ?content: String;
    var ?type: NeutralinoMessageType;
}

typedef MessageBoxResult = {
    var ?yesButtonClicked: Bool;
    var ?success: Bool;
}

typedef TrayMenuItem = {
    var ?id: String;
    var ?text: String;
    var ?isDisabled: Bool;
    var ?isChecked: Bool;
}

typedef TrayOptions = {
    var ?icon: String;
    var ?menuItems: Array<TrayMenuItem>;
}

extern class NeutralinoOS {
    public var __esModule(default, null): Bool;
    public function execCommand(options: ExecCommandOptions): Promise<ExecCommandResult>;
    public function getEnvar(options: GetEnvarOptions): Promise<GetEnvarResult>;
    public function showDialogOpen(options: DialogOpenOptions): Promise<DialogOpenResult>;
    public function showDialogSave(options: DialogSaveOptions): Promise<DialogSaveResult>;
    public function showNotification(options: NotificationOptions): Promise<NeutralinoResult>;
    public function showMessageBox(options: MessageBoxOptions): Promise<MessageBoxResult>;
    public function setTray(options: TrayOptions): Promise<NeutralinoResult>;
}

typedef NeutralinoRAMUsage = {
    var ?total: Int;
    var ?available: UInt;
}

typedef NeutralinoComputerRAMResult = {
    var ?ram: NeutralinoRAMUsage;
    var ?success: Bool;
}

extern class NeutralinoComputer {
    public var __esModule(default, null): Bool;
    public function getRamUsage(): Promise<NeutralinoComputerRAMResult>;
}

@:enum abstract NeutralinoMessageType(String) {
    var INFO;
    var WARN;
    var ERROR;
    var QUESTION;
}

typedef NeutralinoLoggerType = {
    var ?INFO: String;
    var ?WARN: String;
    var ?ERROR: String;
}

typedef NeutralinoLogMessage = {
    var ?type: EitherType<String, NeutralinoMessageType>;
    var ?message: String;
}

typedef NeutralinoLogResult = {
    var ?message: String;
    var ?success: Bool;
}

typedef StorageWriterOptions = {
    var ?bucket: String;
    var ?data: String;
}

typedef StorageReaderOptions = {
    var ?bucket: String;
}

typedef NeutralinoReadDataResult = {
    var ?data: String;
    var ?success: Bool;
}

extern class NeutralinoStorage {
    public var __esModule(default, null): Bool;
    public function putData(options: StorageWriterOptions): Promise<NeutralinoResult>;
    public function getData(options: StorageReaderOptions): Promise<NeutralinoReadDataResult>;
}

extern class NeutralinoDebug {
    public var __esModule(default, null): Bool;
    public var LoggerType(default, null): NeutralinoLoggerType;
    public function log(message: NeutralinoLogMessage): Promise<NeutralinoLogResult>;
}

@:native("Neutralino")
extern class Neutralino {
    public static var __esModule(default, null): Bool;
    public static var app(default, null): NeutralinoApp;
    public static var filesystem(default, null): NeutralinoFS;
    public static var os(default, null): NeutralinoOS;
    public static var computer(default, null): NeutralinoComputer;
    public static var storage(default, null): NeutralinoStorage;
    public static var debug(default, null): NeutralinoDebug;
    public static var events(default, null): Dynamic;
}
