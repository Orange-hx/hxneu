package;

import haxe.Int64;
import haxe.extern.EitherType;

#if (haxe_ver < 4)
import js.Promise;
import js.html.ArrayBuffer;
#else
import js.lib.Promise;
import js.lib.ArrayBuffer;
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
    public static var NL_PID(default, null): String;
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

typedef WindowSizeOptions = {
    var ?width: Int;
    var ?height: Int;
    var ?minWidth: Int;
    var ?minHeight: Int;
    var ?maxWidth: Int;
    var ?maxHeight: Int;
    var ?resizable: Bool;
}

typedef WindowOptions = {
    var ?title: String;
    var ?icon: String;
    var ?fullScreen: Bool;
    var ?alwaysOnTop: Bool;
    var ?enableInspector: Bool;
    var ?borderless: Bool;
    var ?maximize: Bool;
    var ?hidden: Bool;
    var ?maximizable: Bool;
    var ?processArgs: Array<String>;
}

typedef WindowConfig = {
    var ?url: String;
    var ?options: WindowOptions;
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
    public function killProcess(): Promise<NeutralinoResult>;
    public function keepAlive(): Promise<NeutralinoResult>;
    public function getConfig(): Promise<NeutralinoConfigResult>;
    public function open(options: OpenActionOptions): Promise<NeutralinoResult>;
}

extern class NeutralinoWindow {
    public var __esModule(default, null): Bool;
    public function setTitle(title: String): Promise<NeutralinoResult>;
    public function minimize(): Promise<NeutralinoResult>;
    public function maximize(): Promise<NeutralinoResult>;
    public function isMaximized(): Bool;
    public function setFullScreen(): Promise<NeutralinoResult>;
    public function exitFullScreen(): Promise<NeutralinoResult>;
    public function isFullScreen(): Bool;
    public function show(): Promise<NeutralinoResult>;
    public function hide(): Promise<NeutralinoResult>;
    public function isVisible(): Bool;
    public function focus(): Promise<NeutralinoResult>;
    public function move(x: Int, y: Int): Promise<NeutralinoResult>;
    public function setIcon(icon: String): Promise<NeutralinoResult>;
    public function setDraggableRegion(domId: String): Promise<NeutralinoResult>;
    public function setSize(options: WindowSizeOptions): Promise<NeutralinoResult>;
}

typedef PathOptions = {
    var ?path: String;
}

typedef PathStats = {
    var ?success: Bool;
    var ?size: Int64;
    var ?isFile: Bool;
    var ?isDirectory: Bool;
}

typedef WriteFileOptions = {
    var ?fileName: String;
    var ?data: EitherType<String, ArrayBuffer>;
}

typedef FileOptions = {
    var ?filename: String;
}

typedef FileReadResult = {
    var ?data: EitherType<String, ArrayBuffer>;
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

typedef FileOperationOptions = {
    var ?source: String;
    var ?destination: String;
}

extern class NeutralinoFS {
    public var __esModule(default, null): Bool;
    public function createDirectory(options: PathOptions): Promise<NeutralinoResult>;
    public function removeDirectory(options: PathOptions): Promise<NeutralinoResult>;
    public function writeFile(options: WriteFileOptions): Promise<NeutralinoResult>;
    public function writeBinaryFile(options: WriteFileOptions): Promise<NeutralinoResult>;
    public function readFile(options: FileOptions): Promise<FileReadResult>;
    public function readBinaryFile(options: FileOptions): Promise<FileReadResult>;
    public function removeFile(options: FileOptions): Promise<NeutralinoResult>;
    public function readDirectory(options: PathOptions): Promise<ReadDirectoryResult>;
    public function copyFile(options: FileOperationOptions): Promise<NeutralinoResult>;
    public function moveFile(options: FileOperationOptions): Promise<NeutralinoResult>;
    public function getStats(options: PathOptions): Promise<PathStats>;
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

extern class NeutralinoEvents {
    public var __esModule(default, null): Bool;
    public function on(eventName: String, handler: haxe.Constraints.Function): Promise<NeutralinoResult>;
    public function off(eventName: String, handler: haxe.Constraints.Function): Promise<NeutralinoResult>;
    public function dispatch(eventName: String, data: Dynamic): Promise<NeutralinoResult>;
}

@:native("Neutralino")
extern class Neutralino {
    public static var __esModule(default, null): Bool;
    public static var app(default, null): NeutralinoApp;
    public static var window(default, null): NeutralinoWindow;
    public static var filesystem(default, null): NeutralinoFS;
    public static var os(default, null): NeutralinoOS;
    public static var computer(default, null): NeutralinoComputer;
    public static var storage(default, null): NeutralinoStorage;
    public static var debug(default, null): NeutralinoDebug;
    public static var events(default, null): NeutralinoEvents;
}
