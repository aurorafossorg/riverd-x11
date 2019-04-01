/*
                                    __
                                   / _|
  __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
 / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
| (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
 \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/

Copyright (C) 2018-2019 Aurora Free Open Source Software.

This file is part of the Aurora Free Open Source Software. This
organization promote free and open source software that you can
redistribute and/or modify under the terms of the GNU Lesser General
Public License Version 3 as published by the Free Software Foundation or
(at your option) any later version approved by the Aurora Free Open Source
Software Organization. The license is available in the package root path
as 'LICENSE' file. Please review the following information to ensure the
GNU Lesser General Public License version 3 requirements will be met:
https://www.gnu.org/licenses/lgpl.html .

Alternatively, this file may be used under the terms of the GNU General
Public License version 3 or later as published by the Free Software
Foundation. Please review the following information to ensure the GNU
General Public License requirements will be met:
http://www.gnu.org/licenses/gpl-3.0.html.

NOTE: All products, services or anything associated to trademarks and
service marks used or referenced on this file are the property of their
respective companies/owners or its subsidiaries. Other names and brands
may be claimed as the property of others.

For more info about intellectual property visit: aurorafoss.org or
directly send an email to: contact (at) aurorafoss.org .
*/

module riverd.x11.types;

import core.stdc.config;
import core.stdc.stddef;

alias int Bool;
alias int Status;
alias uint VisualID;
alias byte* XPointer;

alias void Display;
alias uint XID;
alias XID Window;
alias XID Drawable;
alias XID Font;
alias XID Pixmap;
alias XID Cursor;
alias XID Colormap;
alias XID GContext;
alias XID KeySym;

struct Visual
{
	XExtData* ext_data;
	VisualID visualid;
	int _class;
	uint red_mask, green_mask, blue_mask;
	int bits_per_rgb;
	int map_entries;
}

struct XVisualInfo
{
	Visual* visual;
	VisualID visualid;
	int screen;
	int depth;
	int _class;
	uint red_mask;
	uint green_mask;
	uint blue_mask;
	int colormap_size;
	int bits_per_rgb;
}

alias uint Mask;
alias uint Atom;
alias uint Time;
alias ubyte KeyCode;

/*****************************************************************
 * RESERVED RESOURCE AND CONSTANT DEFINITIONS
 *****************************************************************/

enum None = 0; /* universal null resource or null atom */

enum ParentRelative = 1L; /* background pixmap in CreateWindow
				    and ChangeWindowAttributes */

enum CopyFromParent = 0L; /* border pixmap in CreateWindow
				       and ChangeWindowAttributes
				   special VisualID and special window
				       class passed to CreateWindow */

enum PointerWindow = 0L; /* destination window in SendEvent */
enum InputFocus = 1L; /* destination window in SendEvent */

enum PointerRoot = 1L; /* focus window in SetInputFocus */

enum AnyPropertyType = 0L; /* special Atom, passed to GetProperty */

enum AnyKey = 0L; /* special Key Code, passed to GrabKey */

enum AnyButton = 0L; /* special Button Code, passed to GrabButton */

enum AllTemporary = 0L; /* special Resource ID passed to KillClient */

enum CurrentTime = 0L; /* special Time */

enum NoSymbol = 0L; /* special KeySym */

/*****************************************************************
 * EVENT DEFINITIONS
 *****************************************************************/

/* Input Event Masks. Used as event-mask window attribute and as arguments
   to Grab requests.  Not to be confused with event names.  */

enum NoEventMask = 0L;
enum KeyPressMask = (1L << 0);
enum KeyReleaseMask = (1L << 1);
enum ButtonPressMask = (1L << 2);
enum ButtonReleaseMask = (1L << 3);
enum EnterWindowMask = (1L << 4);
enum LeaveWindowMask = (1L << 5);
enum PointerMotionMask = (1L << 6);
enum PointerMotionHintMask = (1L << 7);
enum Button1MotionMask = (1L << 8);
enum Button2MotionMask = (1L << 9);
enum Button3MotionMask = (1L << 10);
enum Button4MotionMask = (1L << 11);
enum Button5MotionMask = (1L << 12);
enum ButtonMotionMask = (1L << 13);
enum KeymapStateMask = (1L << 14);
enum ExposureMask = (1L << 15);
enum VisibilityChangeMask = (1L << 16);
enum StructureNotifyMask = (1L << 17);
enum ResizeRedirectMask = (1L << 18);
enum SubstructureNotifyMask = (1L << 19);
enum SubstructureRedirectMask = (1L << 20);
enum FocusChangeMask = (1L << 21);
enum PropertyChangeMask = (1L << 22);
enum ColormapChangeMask = (1L << 23);
enum OwnerGrabButtonMask = (1L << 24);

/* Event names.  Used in "type" field in XEvent structures.  Not to be
confused with event masks above.  They start from 2 because 0 and 1
are reserved in the protocol for errors and replies. */

enum KeyPress = 2;
enum KeyRelease = 3;
enum ButtonPress = 4;
enum ButtonRelease = 5;
enum MotionNotify = 6;
enum EnterNotify = 7;
enum LeaveNotify = 8;
enum FocusIn = 9;
enum FocusOut = 10;
enum KeymapNotify = 11;
enum Expose = 12;
enum GraphicsExpose = 13;
enum NoExpose = 14;
enum VisibilityNotify = 15;
enum CreateNotify = 16;
enum DestroyNotify = 17;
enum UnmapNotify = 18;
enum MapNotify = 19;
enum MapRequest = 20;
enum ReparentNotify = 21;
enum ConfigureNotify = 22;
enum ConfigureRequest = 23;
enum GravityNotify = 24;
enum ResizeRequest = 25;
enum CirculateNotify = 26;
enum CirculateRequest = 27;
enum PropertyNotify = 28;
enum SelectionClear = 29;
enum SelectionRequest = 30;
enum SelectionNotify = 31;
enum ColormapNotify = 32;
enum ClientMessage = 33;
enum MappingNotify = 34;
enum GenericEvent = 35;
enum LASTEvent = 36; /* must be bigger than any event # */

/* Key masks. Used as modifiers to GrabButton and GrabKey, results of QueryPointer,
   state in various key-, mouse-, and button-related events. */

enum ShiftMask = (1 << 0);
enum LockMask = (1 << 1);
enum ControlMask = (1 << 2);
enum Mod1Mask = (1 << 3);
enum Mod2Mask = (1 << 4);
enum Mod3Mask = (1 << 5);
enum Mod4Mask = (1 << 6);
enum Mod5Mask = (1 << 7);

/* modifier names.  Used to build a SetModifierMapping request or
   to read a GetModifierMapping request.  These correspond to the
   masks defined above. */
enum ShiftMapIndex = 0;
enum LockMapIndex = 1;
enum ControlMapIndex = 2;
enum Mod1MapIndex = 3;
enum Mod2MapIndex = 4;
enum Mod3MapIndex = 5;
enum Mod4MapIndex = 6;
enum Mod5MapIndex = 7;

/* button masks.  Used in same manner as Key masks above. Not to be confused
   with button names below. */

enum Button1Mask = (1 << 8);
enum Button2Mask = (1 << 9);
enum Button3Mask = (1 << 10);
enum Button4Mask = (1 << 11);
enum Button5Mask = (1 << 12);

enum AnyModifier = (1 << 15); /* used in GrabButton, GrabKey */

/* button names. Used as arguments to GrabButton and as detail in ButtonPress
   and ButtonRelease events.  Not to be confused with button masks above.
   Note that 0 is already defined above as "AnyButton".  */

enum Button1 = 1;
enum Button2 = 2;
enum Button3 = 3;
enum Button4 = 4;
enum Button5 = 5;

/* Notify modes */

enum NotifyNormal = 0;
enum NotifyGrab = 1;
enum NotifyUngrab = 2;
enum NotifyWhileGrabbed = 3;

enum NotifyHint = 1; /* for MotionNotify events */

/* Notify detail */

enum NotifyAncestor = 0;
enum NotifyVirtual = 1;
enum NotifyInferior = 2;
enum NotifyNonlinear = 3;
enum NotifyNonlinearVirtual = 4;
enum NotifyPointer = 5;
enum NotifyPointerRoot = 6;
enum NotifyDetailNone = 7;

/* Visibility notify */

enum VisibilityUnobscured = 0;
enum VisibilityPartiallyObscured = 1;
enum VisibilityFullyObscured = 2;

/* Circulation request */

enum PlaceOnTop = 0;
enum PlaceOnBottom = 1;

/* protocol families */

enum FamilyInternet = 0; /* IPv4 */
enum FamilyDECnet = 1;
enum FamilyChaos = 2;
enum FamilyInternet6 = 6; /* IPv6 */

/* authentication families not tied to a specific protocol */
enum FamilyServerInterpreted = 5;

/* Property notification */

enum PropertyNewValue = 0;
enum PropertyDelete = 1;

/* Color Map notification */

enum ColormapUninstalled = 0;
enum ColormapInstalled = 1;

/* GrabPointer, GrabButton, GrabKeyboard, GrabKey Modes */

enum GrabModeSync = 0;
enum GrabModeAsync = 1;

/* GrabPointer, GrabKeyboard reply status */

enum GrabSuccess = 0;
enum AlreadyGrabbed = 1;
enum GrabInvalidTime = 2;
enum GrabNotViewable = 3;
enum GrabFrozen = 4;

/* AllowEvents modes */

enum AsyncPointer = 0;
enum SyncPointer = 1;
enum ReplayPointer = 2;
enum AsyncKeyboard = 3;
enum SyncKeyboard = 4;
enum ReplayKeyboard = 5;
enum AsyncBoth = 6;
enum SyncBoth = 7;

/* Used in SetInputFocus, GetInputFocus */

enum RevertToNone = None;
enum RevertToPointerRoot = PointerRoot;
enum RevertToParent = 2;

/*****************************************************************
 * ERROR CODES
 *****************************************************************/

enum Success = 0; /* everything's okay */
enum BadRequest = 1; /* bad request code */
enum BadValue = 2; /* int parameter out of range */
enum BadWindow = 3; /* parameter not a Window */
enum BadPixmap = 4; /* parameter not a Pixmap */
enum BadAtom = 5; /* parameter not an Atom */
enum BadCursor = 6; /* parameter not a Cursor */
enum BadFont = 7; /* parameter not a Font */
enum BadMatch = 8; /* parameter mismatch */
enum BadDrawable = 9; /* parameter not a Pixmap or Window */
enum BadAccess = 10; /* depending on context:
				 - key/button already grabbed
				 - attempt to free an illegal
				   cmap entry
				- attempt to store into a read-only
				   color map entry.
 				- attempt to modify the access control
				   list from other than the local host.
				*/
enum BadAlloc = 11; /* insufficient resources */
enum BadColor = 12; /* no such colormap */
enum BadGC = 13; /* parameter not a GC */
enum BadIDChoice = 14; /* choice not in range or already used */
enum BadName = 15; /* font or color name doesn't exist */
enum BadLength = 16; /* Request length incorrect */
enum BadImplementation = 17; /* server is defective */

enum FirstExtensionError = 128;
enum LastExtensionError = 255;

/*****************************************************************
 * WINDOW DEFINITIONS
 *****************************************************************/

/* Window classes used by CreateWindow */
/* Note that CopyFromParent is already defined as 0 above */

enum InputOutput = 1;
enum InputOnly = 2;

/* Window attributes for CreateWindow and ChangeWindowAttributes */

enum CWBackPixmap = (1L << 0);
enum CWBackPixel = (1L << 1);
enum CWBorderPixmap = (1L << 2);
enum CWBorderPixel = (1L << 3);
enum CWBitGravity = (1L << 4);
enum CWWinGravity = (1L << 5);
enum CWBackingStore = (1L << 6);
enum CWBackingPlanes = (1L << 7);
enum CWBackingPixel = (1L << 8);
enum CWOverrideRedirect = (1L << 9);
enum CWSaveUnder = (1L << 10);
enum CWEventMask = (1L << 11);
enum CWDontPropagate = (1L << 12);
enum CWColormap = (1L << 13);
enum CWCursor = (1L << 14);

/* ConfigureWindow structure */

enum CWX = (1 << 0);
enum CWY = (1 << 1);
enum CWWidth = (1 << 2);
enum CWHeight = (1 << 3);
enum CWBorderWidth = (1 << 4);
enum CWSibling = (1 << 5);
enum CWStackMode = (1 << 6);

/* Bit Gravity */

enum ForgetGravity = 0;
enum NorthWestGravity = 1;
enum NorthGravity = 2;
enum NorthEastGravity = 3;
enum WestGravity = 4;
enum CenterGravity = 5;
enum EastGravity = 6;
enum SouthWestGravity = 7;
enum SouthGravity = 8;
enum SouthEastGravity = 9;
enum StaticGravity = 10;

/* Window gravity + bit gravity above */

enum UnmapGravity = 0;

/* Used in CreateWindow for backing-store hint */

enum NotUseful = 0;
enum WhenMapped = 1;
enum Always = 2;

/* Used in GetWindowAttributes reply */

enum IsUnmapped = 0;
enum IsUnviewable = 1;
enum IsViewable = 2;

/* Used in ChangeSaveSet */

enum SetModeInsert = 0;
enum SetModeDelete = 1;

/* Used in ChangeCloseDownMode */

enum DestroyAll = 0;
enum RetainPermanent = 1;
enum RetainTemporary = 2;

/* Window stacking method (in configureWindow) */

enum Above = 0;
enum Below = 1;
enum TopIf = 2;
enum BottomIf = 3;
enum Opposite = 4;

/* Circulation direction */

enum RaiseLowest = 0;
enum LowerHighest = 1;

/* Property modes */

enum PropModeReplace = 0;
enum PropModePrepend = 1;
enum PropModeAppend = 2;

/*****************************************************************
 * GRAPHICS DEFINITIONS
 *****************************************************************/

/* graphics functions, as in GC.alu */

enum GXclear = 0x0; /* 0 */
enum GXand = 0x1; /* src AND dst */
enum GXandReverse = 0x2; /* src AND NOT dst */
enum GXcopy = 0x3; /* src */
enum GXandInverted = 0x4; /* NOT src AND dst */
enum GXnoop = 0x5; /* dst */
enum GXxor = 0x6; /* src XOR dst */
enum GXor = 0x7; /* src OR dst */
enum GXnor = 0x8; /* NOT src AND NOT dst */
enum GXequiv = 0x9; /* NOT src XOR dst */
enum GXinvert = 0xa; /* NOT dst */
enum GXorReverse = 0xb; /* src OR NOT dst */
enum GXcopyInverted = 0xc; /* NOT src */
enum GXorInverted = 0xd; /* NOT src OR dst */
enum GXnand = 0xe; /* NOT src OR NOT dst */
enum GXset = 0xf; /* 1 */

/* LineStyle */

enum LineSolid = 0;
enum LineOnOffDash = 1;
enum LineDoubleDash = 2;

/* capStyle */

enum CapNotLast = 0;
enum CapButt = 1;
enum CapRound = 2;
enum CapProjecting = 3;

/* joinStyle */

enum JoinMiter = 0;
enum JoinRound = 1;
enum JoinBevel = 2;

/* fillStyle */

enum FillSolid = 0;
enum FillTiled = 1;
enum FillStippled = 2;
enum FillOpaqueStippled = 3;

/* fillRule */

enum EvenOddRule = 0;
enum WindingRule = 1;

/* subwindow mode */

enum ClipByChildren = 0;
enum IncludeInferiors = 1;

/* SetClipRectangles ordering */

enum Unsorted = 0;
enum YSorted = 1;
enum YXSorted = 2;
enum YXBanded = 3;

/* CoordinateMode for drawing routines */

enum CoordModeOrigin = 0; /* relative to the origin */
enum CoordModePrevious = 1; /* relative to previous point */

/* Polygon shapes */

enum Complex = 0; /* paths may intersect */
enum Nonconvex = 1; /* no paths intersect, but not convex */
enum Convex = 2; /* wholly convex */

/* Arc modes for PolyFillArc */

enum ArcChord = 0; /* join endpoints of arc */
enum ArcPieSlice = 1; /* join endpoints to center of arc */

/* GC components: masks used in CreateGC, CopyGC, ChangeGC, OR'ed into
   GC.stateChanges */

enum GCFunction = (1L << 0);
enum GCPlaneMask = (1L << 1);
enum GCForeground = (1L << 2);
enum GCBackground = (1L << 3);
enum GCLineWidth = (1L << 4);
enum GCLineStyle = (1L << 5);
enum GCCapStyle = (1L << 6);
enum GCJoinStyle = (1L << 7);
enum GCFillStyle = (1L << 8);
enum GCFillRule = (1L << 9);
enum GCTile = (1L << 10);
enum GCStipple = (1L << 11);
enum GCTileStipXOrigin = (1L << 12);
enum GCTileStipYOrigin = (1L << 13);
enum GCFont = (1L << 14);
enum GCSubwindowMode = (1L << 15);
enum GCGraphicsExposures = (1L << 16);
enum GCClipXOrigin = (1L << 17);
enum GCClipYOrigin = (1L << 18);
enum GCClipMask = (1L << 19);
enum GCDashOffset = (1L << 20);
enum GCDashList = (1L << 21);
enum GCArcMode = (1L << 22);

enum GCLastBit = 22;
/*****************************************************************
 * FONTS
 *****************************************************************/

/* used in QueryFont -- draw direction */

enum FontLeftToRight = 0;
enum FontRightToLeft = 1;

enum FontChange = 255;

/*****************************************************************
 *  IMAGING
 *****************************************************************/

/* ImageFormat -- PutImage, GetImage */

enum XYBitmap = 0; /* depth 1, XYFormat */
enum XYPixmap = 1; /* depth == drawable depth */
enum ZPixmap = 2; /* depth == drawable depth */

/*****************************************************************
 *  COLOR MAP STUFF
 *****************************************************************/

/* For CreateColormap */

enum AllocNone = 0; /* create map with no entries */
enum AllocAll = 1; /* allocate entire map writeable */

/* Flags used in StoreNamedColor, StoreColors */

enum DoRed = (1 << 0);
enum DoGreen = (1 << 1);
enum DoBlue = (1 << 2);

/*****************************************************************
 * CURSOR STUFF
 *****************************************************************/

/* QueryBestSize Class */

enum CursorShape = 0; /* largest size that can be displayed */
enum TileShape = 1; /* size tiled fastest */
enum StippleShape = 2; /* size stippled fastest */

/*****************************************************************
 * KEYBOARD/POINTER STUFF
 *****************************************************************/

enum AutoRepeatModeOff = 0;
enum AutoRepeatModeOn = 1;
enum AutoRepeatModeDefault = 2;

enum LedModeOff = 0;
enum LedModeOn = 1;

/* masks for ChangeKeyboardControl */

enum KBKeyClickPercent = (1L << 0);
enum KBBellPercent = (1L << 1);
enum KBBellPitch = (1L << 2);
enum KBBellDuration = (1L << 3);
enum KBLed = (1L << 4);
enum KBLedMode = (1L << 5);
enum KBKey = (1L << 6);
enum KBAutoRepeatMode = (1L << 7);

enum MappingSuccess = 0;
enum MappingBusy = 1;
enum MappingFailed = 2;

enum MappingModifier = 0;
enum MappingKeyboard = 1;
enum MappingPointer = 2;

/*****************************************************************
 * SCREEN SAVER STUFF
 *****************************************************************/

enum DontPreferBlanking = 0;
enum PreferBlanking = 1;
enum DefaultBlanking = 2;

enum DisableScreenSaver = 0;
enum DisableScreenInterval = 0;

enum DontAllowExposures = 0;
enum AllowExposures = 1;
enum DefaultExposures = 2;

/* for ForceScreenSaver */

enum ScreenSaverReset = 0;
enum ScreenSaverActive = 1;

/*****************************************************************
 * HOSTS AND CONNECTIONS
 *****************************************************************/

/* for ChangeHosts */

enum HostInsert = 0;
enum HostDelete = 1;

/* for ChangeAccessControl */

enum EnableAccess = 1;
enum DisableAccess = 0;

/* Display classes  used in opening the connection
 * Note that the statically allocated ones are even numbered and the
 * dynamically changeable ones are odd numbered */

enum StaticGray = 0;
enum GrayScale = 1;
enum StaticColor = 2;
enum PseudoColor = 3;
enum TrueColor = 4;
enum DirectColor = 5;

/* Byte order  used in imageByteOrder and bitmapBitOrder */

enum LSBFirst = 0;
enum MSBFirst = 1;

//XLib
enum True = 1;
enum False = 0;

enum QueuedAlready = 0;
enum QueuedAfterReading = 1;
enum QueuedAfterFlush = 2;

struct XrmHashBucketRec;

/*
 * Extensions need a way to hang private data on some structures.
 */
struct XExtData
{
	int number; /* number returned by XRegisterExtension */
	XExtData* next; /* next item on list of data for structure */
	/* called to free private storage */
	int function(XExtData* extension) free_private;
	XPointer private_data; /* data private to this extension. */
}

/*
 * This file contains structures used by the extension mechanism.
 */
struct XExtCodes
{ /* public to extension, cannot be changed */
	int extension; /* extension number */
	int major_opcode; /* major op-code assigned by server */
	int first_event; /* first event number for the extension */
	int first_error; /* first error number for the extension */
}

/*
 * Data structure for retrieving info about pixmap formats.
 */

struct XPixmapFormatValues
{
	int depth;
	int bits_per_pixel;
	int scanline_pad;
}

/*
 * Data structure for setting graphics context.
 */
struct XGCValues
{
	int function_; /* logical operation */
	c_ulong plane_mask; /* plane mask */
	c_ulong foreground; /* foreground pixel */
	c_ulong background; /* background pixel */
	int line_width; /* line width */
	int line_style; /* LineSolid, LineOnOffDash, LineDoubleDash */
	int cap_style; /* CapNotLast, CapButt,
				   CapRound, CapProjecting */
	int join_style; /* JoinMiter, JoinRound, JoinBevel */
	int fill_style; /* FillSolid, FillTiled,
				   FillStippled, FillOpaeueStippled */
	int fill_rule; /* EvenOddRule, WindingRule */
	int arc_mode; /* ArcChord, ArcPieSlice */
	Pixmap tile; /* tile pixmap for tiling operations */
	Pixmap stipple; /* stipple 1 plane pixmap for stipping */
	int ts_x_origin; /* offset for tile or stipple operations */
	int ts_y_origin;
	Font font; /* default text font for text operations */
	int subwindow_mode; /* ClipByChildren, IncludeInferiors */
	Bool graphics_exposures; /* boolean, should exposures be generated */
	int clip_x_origin; /* origin for clipping */
	int clip_y_origin;
	Pixmap clip_mask; /* bitmap clipping; other calls for rects */
	int dash_offset; /* patterned/dashed line information */
	char dashes;
}

struct _XGC;
alias GC = _XGC*;

/*
 * Depth structure; contains information for each possible depth.
 */
struct Depth
{
	int depth; /* this depth (Z) of the depth */
	int nvisuals; /* number of Visual types at this depth */
	Visual* visuals; /* list of visuals possible at this depth */
}

/*
 * Information about the screen.  The contents of this structure are
 * implementation dependent.  A Screen should be treated as opaque
 * by application code.
 */

struct Screen
{
	XExtData* ext_data; /* hook for extension to hang data */
	Display* display; /* back pointer to display structure */
	Window root; /* Root window id. */
	int width, height; /* width and height of screen */
	int mwidth, mheight; /* width and height of  in millimeters */
	int ndepths; /* number of depths possible */
	Depth* depths; /* list of allowable depths on the screen */
	int root_depth; /* bits per pixel */
	Visual* root_visual; /* root visual */
	GC default_gc; /* GC for the root root visual */
	Colormap cmap; /* default color map */
	c_ulong white_pixel;
	c_ulong black_pixel; /* White and Black pixel values */
	int max_maps, min_maps; /* max and min color maps */
	int backing_store; /* Never, WhenMapped, Always */
	Bool save_unders;
	c_long root_input_mask; /* initial root input mask */
}

/*
 * Format structure; describes ZFormat data the screen will understand.
 */
struct ScreenFormat
{
	XExtData* ext_data; /* hook for extension to hang data */
	int depth; /* depth of this image format */
	int bits_per_pixel; /* bits/pixel at this depth */
	int scanline_pad; /* scanline must padded to this multiple */
}

/*
 * Data structure for setting window attributes.
 */
struct XSetWindowAttributes
{
	Pixmap background_pixmap; /* background or None or ParentRelative */
	c_ulong background_pixel; /* background pixel */
	Pixmap border_pixmap; /* border of the window */
	c_ulong border_pixel; /* border pixel value */
	int bit_gravity; /* one of bit gravity values */
	int win_gravity; /* one of the window gravity values */
	int backing_store; /* NotUseful, WhenMapped, Always */
	c_ulong backing_planes; /* planes to be preseved if possible */
	c_ulong backing_pixel; /* value to use in restoring planes */
	Bool save_under; /* should bits under be saved? (popups) */
	c_long event_mask; /* set of events that should be saved */
	c_long do_not_propagate_mask; /* set of events that should not propagate */
	Bool override_redirect; /* boolean value for override-redirect */
	Colormap colormap; /* color map to be associated with window */
	Cursor cursor; /* cursor to be displayed (or None) */
}

struct XWindowAttributes
{
	int x, y; /* location of window */
	int width, height; /* width and height of window */
	int border_width; /* border width of window */
	int depth; /* depth of window */
	Visual* visual; /* the associated visual structure */
	Window root; /* root of screen containing window */
	int class_; /* InputOutput, InputOnly*/
	int bit_gravity; /* one of bit gravity values */
	int win_gravity; /* one of the window gravity values */
	int backing_store; /* NotUseful, WhenMapped, Always */
	c_ulong backing_planes; /* planes to be preserved if possible */
	c_ulong backing_pixel; /* value to be used when restoring planes */
	Bool save_under; /* boolean, should bits under be saved? */
	Colormap colormap; /* color map to be associated with window */
	Bool map_installed; /* boolean, is color map currently installed*/
	int map_state; /* IsUnmapped, IsUnviewable, IsViewable */
	c_long all_event_masks; /* set of events all people have interest in*/
	c_long your_event_mask; /* my event mask */
	c_long do_not_propagate_mask; /* set of events that should not propagate */
	Bool override_redirect; /* boolean value for override-redirect */
	Screen* screen; /* back pointer to correct screen */
}

/*
 * Data structure for host setting; getting routines.
 *
 */

struct XHostAddress
{
	int family; /* for example FamilyInternet */
	int length; /* length of address, in bytes */
	char* address; /* pointer to where to find the bytes */
}

/*
 * Data structure for ServerFamilyInterpreted addresses in host routines
 */
struct XServerInterpretedAddress
{
	int typelength; /* length of type string, in bytes */
	int valuelength; /* length of value string, in bytes */
	char* type; /* pointer to where to find the type string */
	char* value; /* pointer to where to find the address */
}

/*
 * Data structure for "image" data, used by image manipulation routines.
 */
struct XImage
{
	int width, height; /* size of image */
	int xoffset; /* number of pixels offset in X direction */
	int format; /* XYBitmap, XYPixmap, ZPixmap */
	char* data; /* pointer to image data */
	int byte_order; /* data byte order, LSBFirst, MSBFirst */
	int bitmap_unit; /* quant. of scanline 8, 16, 32 */
	int bitmap_bit_order; /* LSBFirst, MSBFirst */
	int bitmap_pad; /* 8, 16, 32 either XY or ZPixmap */
	int depth; /* depth of image */
	int bytes_per_line; /* accelarator to next line */
	int bits_per_pixel; /* bits per pixel (ZPixmap) */
	c_ulong red_mask; /* bits in z arrangment */
	c_ulong green_mask;
	c_ulong blue_mask;
	XPointer obdata; /* hook for the object routines to hang on */

	private struct funcs
	{ /* image manipulation routines */
		XImage* function(Display*  /* display */ , Visual*  /* visual */ , uint /* depth */ ,
				int /* format */ , int /* offset */ , char*  /* data */ , uint /* width */ ,
				uint /* height */ , int /* bitmap_pad */ , int /* bytes_per_line */ ) create_image;

		int function(XImage*) destroy_image;
		c_ulong function(XImage*, int, int) get_pixel;
		int function(XImage*, int, int, c_ulong) put_pixel;
		XImage* function(XImage*, int, int, uint, uint) sub_image;
		int function(XImage*, c_long) add_pixel;
	}

	funcs f;
}

/*
 * Data structure for XReconfigureWindow
 */
struct XWindowChanges
{
	int x, y;
	int width, height;
	int border_width;
	Window sibling;
	int stack_mode;
}

/*
 * Data structure used by color operations
 */
struct XColor
{
	c_ulong pixel;
	ushort red, green, blue;
	char flags; /* do_red, do_green, do_blue */
	char pad;
}

/*
 * Data structures for graphics operations.  On most machines, these are
 * congruent with the wire protocol structures, so reformatting the data
 * can be avoided on these architectures.
 */
struct XSegment
{
	short x1, y1, x2, y2;
}

struct XPoint
{
	short x, y;
}

struct XRectangle
{
	short x, y;
	ushort width, height;
}

struct XArc
{
	short x, y;
	ushort width, height;
	short angle1, angle2;
}

/* Data structure for XChangeKeyboardControl */

struct XKeyboardControl
{
	int key_click_percent;
	int bell_percent;
	int bell_pitch;
	int bell_duration;
	int led;
	int led_mode;
	int key;
	int auto_repeat_mode; /* On, Off, Default */
}

/* Data structure for XGetKeyboardControl */

struct XKeyboardState
{
	int key_click_percent;
	int bell_percent;
	uint bell_pitch, bell_duration;
	c_ulong led_mask;
	int global_auto_repeat;
	char[32] auto_repeats;
}

/* Data structure for XGetMotionEvents.  */

struct XTimeCoord
{
	Time time;
	short x, y;
}

/* Data structure for X{Set,Get}ModifierMapping */

struct XModifierKeymap
{
	int max_keypermod; /* The server's max # of keys per modifier */
	KeyCode* modifiermap; /* An 8 by max_keypermod array of modifiers */
}

struct _XPrivate;
struct _XrmHashBucketRec;

/*
 * Definitions of specific events.
 */
struct XKeyEvent
{
	int type; /* of event */
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* "event" window it is reported relative to */
	Window root; /* root window that the event occurred on */
	Window subwindow; /* child window */
	Time time; /* milliseconds */
	int x, y; /* pointer x, y coordinates in event window */
	int x_root, y_root; /* coordinates relative to root */
	uint state; /* key or button mask */
	uint keycode; /* detail */
	Bool same_screen; /* same screen flag */
}

alias XKeyPressedEvent = XKeyEvent;
alias XKeyReleasedEvent = XKeyEvent;

struct XButtonEvent
{
	int type; /* of event */
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* "event" window it is reported relative to */
	Window root; /* root window that the event occurred on */
	Window subwindow; /* child window */
	Time time; /* milliseconds */
	int x, y; /* pointer x, y coordinates in event window */
	int x_root, y_root; /* coordinates relative to root */
	uint state; /* key or button mask */
	uint button; /* detail */
	Bool same_screen; /* same screen flag */
}

alias XButtonPressedEvent = XButtonEvent;
alias XButtonReleasedEvent = XButtonEvent;

struct XMotionEvent
{
	int type; /* of event */
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* "event" window reported relative to */
	Window root; /* root window that the event occurred on */
	Window subwindow; /* child window */
	Time time; /* milliseconds */
	int x, y; /* pointer x, y coordinates in event window */
	int x_root, y_root; /* coordinates relative to root */
	uint state; /* key or button mask */
	char is_hint; /* detail */
	Bool same_screen; /* same screen flag */
}

alias XPointerMovedEvent = XMotionEvent;

struct XCrossingEvent
{
	int type; /* of event */
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* "event" window reported relative to */
	Window root; /* root window that the event occurred on */
	Window subwindow; /* child window */
	Time time; /* milliseconds */
	int x, y; /* pointer x, y coordinates in event window */
	int x_root, y_root; /* coordinates relative to root */
	int mode; /* NotifyNormal, NotifyGrab, NotifyUngrab */
	int detail;
	/*
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual
	 */
	Bool same_screen; /* same screen flag */
	Bool focus; /* boolean focus */
	uint state; /* key or button mask */
}

alias XEnterWindowEvent = XCrossingEvent;
alias XLeaveWindowEvent = XCrossingEvent;

struct XFocusChangeEvent
{
	int type; /* FocusIn or FocusOut */
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* window of event */
	int mode; /* NotifyNormal, NotifyWhileGrabbed,
				   NotifyGrab, NotifyUngrab */
	int detail;
	/*
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
	 * NotifyPointerRoot, NotifyDetailNone
	 */
}

alias XFocusInEvent = XFocusChangeEvent;
alias XFocusOutEvent = XFocusChangeEvent;

/* generated on EnterWindow and FocusIn  when KeyMapState selected */
struct XKeymapEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	char[32] key_vector;
}

struct XExposeEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	int x, y;
	int width, height;
	int count; /* if non-zero, at least this many more */
}

struct XGraphicsExposeEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Drawable drawable;
	int x, y;
	int width, height;
	int count; /* if non-zero, at least this many more */
	int major_code; /* core is CopyArea or CopyPlane */
	int minor_code; /* not defined in the core */
}

struct XNoExposeEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Drawable drawable;
	int major_code; /* core is CopyArea or CopyPlane */
	int minor_code; /* not defined in the core */
}

struct XVisibilityEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	int state; /* Visibility state */
}

struct XCreateWindowEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window parent; /* parent of the window */
	Window window; /* window id of window created */
	int x, y; /* window location */
	int width, height; /* size of window */
	int border_width; /* border width */
	Bool override_redirect; /* creation should be overridden */
}

struct XDestroyWindowEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
}

struct XUnmapEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	Bool from_configure;
}

struct XMapEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	Bool override_redirect; /* boolean, is override set... */
}

struct XMapRequestEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window parent;
	Window window;
}

struct XReparentEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	Window parent;
	int x, y;
	Bool override_redirect;
}

struct XConfigureEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	int x, y;
	int width, height;
	int border_width;
	Window above;
	Bool override_redirect;
}

struct XGravityEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	int x, y;
}

struct XResizeRequestEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	int width, height;
}

struct XConfigureRequestEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window parent;
	Window window;
	int x, y;
	int width, height;
	int border_width;
	Window above;
	int detail; /* Above, Below, TopIf, BottomIf, Opposite */
	c_ulong value_mask;
}

struct XCirculateEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window event;
	Window window;
	int place; /* PlaceOnTop, PlaceOnBottom */
}

struct XCirculateRequestEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window parent;
	Window window;
	int place; /* PlaceOnTop, PlaceOnBottom */
}

struct XPropertyEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	Atom atom;
	Time time;
	int state; /* NewValue, Deleted */
}

struct XSelectionClearEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	Atom selection;
	Time time;
}

struct XSelectionRequestEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window owner;
	Window requestor;
	Atom selection;
	Atom target;
	Atom property;
	Time time;
}

struct XSelectionEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window requestor;
	Atom selection;
	Atom target;
	Atom property; /* ATOM or None */
	Time time;
}

struct XColormapEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	Colormap colormap; /* COLORMAP or None */
	Bool new_;
	int state; /* ColormapInstalled, ColormapUninstalled */
}

struct XClientMessageEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window;
	Atom message_type;
	int format;
	private union data_
	{
		char[20] b;
		short[10] s;
		c_long[5] l;
	}

	data_ data;
}

struct XMappingEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* unused */
	int request; /* one of MappingModifier, MappingKeyboard,
				   MappingPointer */
	int first_keycode; /* first keycode */
	int count; /* defines range of change w. first_keycode*/
}

struct XErrorEvent
{
	int type;
	Display* display; /* Display the event was read from */
	XID resourceid; /* resource id */
	c_ulong serial; /* serial number of failed request */
	ubyte error_code; /* error code of failed request */
	ubyte request_code; /* Major op-code of failed request */
	ubyte minor_code; /* Minor op-code of failed request */
}

struct XAnyEvent
{
	int type;
	c_ulong serial; /* # of last request processed by server */
	Bool send_event; /* true if this came from a SendEvent request */
	Display* display; /* Display the event was read from */
	Window window; /* window on which event was requested in event mask */
}

/***************************************************************
 *
 * GenericEvent.  This event is the standard event for all newer extensions.
 */

struct XGenericEvent
{
	int type; /* of event. Always GenericEvent */
	c_ulong serial; /* # of last request processed */
	Bool send_event; /* true if from SendEvent request */
	Display* display; /* Display the event was read from */
	int extension; /* major opcode of extension that caused the event */
	int evtype; /* actual event type. */
}

struct XGenericEventCookie
{
	int type; /* of event. Always GenericEvent */
	c_ulong serial; /* # of last request processed */
	Bool send_event; /* true if from SendEvent request */
	Display* display; /* Display the event was read from */
	int extension; /* major opcode of extension that caused the event */
	int evtype; /* actual event type. */
	uint cookie;
	void* data;
}

/*
 * this union is defined so Xlib can always use the same sized
 * event structure internally, to avoid memory fragmentation.
 */
union XEvent
{
	int type; /* must not be changed; first element */
	XAnyEvent xany;
	XKeyEvent xkey;
	XButtonEvent xbutton;
	XMotionEvent xmotion;
	XCrossingEvent xcrossing;
	XFocusChangeEvent xfocus;
	XExposeEvent xexpose;
	XGraphicsExposeEvent xgraphicsexpose;
	XNoExposeEvent xnoexpose;
	XVisibilityEvent xvisibility;
	XCreateWindowEvent xcreatewindow;
	XDestroyWindowEvent xdestroywindow;
	XUnmapEvent xunmap;
	XMapEvent xmap;
	XMapRequestEvent xmaprequest;
	XReparentEvent xreparent;
	XConfigureEvent xconfigure;
	XGravityEvent xgravity;
	XResizeRequestEvent xresizerequest;
	XConfigureRequestEvent xconfigurerequest;
	XCirculateEvent xcirculate;
	XCirculateRequestEvent xcirculaterequest;
	XPropertyEvent xproperty;
	XSelectionClearEvent xselectionclear;
	XSelectionRequestEvent xselectionrequest;
	XSelectionEvent xselection;
	XColormapEvent xcolormap;
	XClientMessageEvent xclient;
	XMappingEvent xmapping;
	XErrorEvent xerror;
	XKeymapEvent xkeymap;
	XGenericEvent xgeneric;
	XGenericEventCookie xcookie;
	c_long[24] pad;
}

//#define XAllocID(dpy) ((*((_XPrivDisplay)dpy)->resource_alloc)((dpy)))

/*
 * per character font metric information.
 */
struct XCharStruct
{
	short lbearing; /* origin to left edge of raster */
	short rbearing; /* origin to right edge of raster */
	short width; /* advance to next char's origin */
	short ascent; /* baseline to top edge of raster */
	short descent; /* baseline to bottom edge of raster */
	ushort attributes; /* per char flags (not predefined) */
}

/*
 * To allow arbitrary information with fonts, there are additional properties
 * returned.
 */
struct XFontProp
{
	Atom name;
	c_ulong card32;
}

struct XFontStruct
{
	XExtData* ext_data; /* hook for extension to hang data */
	Font fid; /* Font id for this font */
	uint direction; /* hint about direction the font is painted */
	uint min_char_or_byte2; /* first character */
	uint max_char_or_byte2; /* last character */
	uint min_byte1; /* first row that exists */
	uint max_byte1; /* last row that exists */
	Bool all_chars_exist; /* flag if all characters have non-zero size*/
	uint default_char; /* char to print for undefined character */
	int n_properties; /* how many properties there are */
	XFontProp* properties; /* pointer to array of additional properties*/
	XCharStruct min_bounds; /* minimum bounds over all existing char*/
	XCharStruct max_bounds; /* maximum bounds over all existing char*/
	XCharStruct* per_char; /* first_char to last_char information */
	int ascent; /* log. extent above baseline for spacing */
	int descent; /* log. descent below baseline for spacing */
}

/*
 * PolyText routines take these as arguments.
 */
struct XTextItem
{
	char* chars; /* pointer to string */
	int nchars; /* number of characters */
	int delta; /* delta between strings */
	Font font; /* font to print it in, None don't change */
}

struct XChar2b
{ /* normal 16 bit characters are two bytes */
	ubyte byte1;
	ubyte byte2;
}

struct XTextItem16
{
	XChar2b* chars; /* two byte characters */
	int nchars; /* number of characters */
	int delta; /* delta between strings */
	Font font; /* font to print it in, None don't change */
}

union XEDataObject
{
	Display* display;
	GC gc;
	Visual* visual;
	Screen* screen;
	ScreenFormat* pixmap_format;
	XFontStruct* font;
}

struct XFontSetExtents
{
	XRectangle max_ink_extent;
	XRectangle max_logical_extent;
}

/* unused:
typedef void (*XOMProc)();
 */

struct _XOM;
alias XOM = _XOM*;

struct _XOC;
alias XOC = _XOC*;
alias XFontSet = _XOC*;

struct XmbTextItem
{
	char* chars;
	int nchars;
	int delta;
	XFontSet font_set;
}

struct XwcTextItem
{
	wchar_t* chars;
	int nchars;
	int delta;
	XFontSet font_set;
}

enum XNRequiredCharSet = "requiredCharSet";
enum XNQueryOrientation = "queryOrientation";
enum XNBaseFontName = "baseFontName";
enum XNOMAutomatic = "omAutomatic";
enum XNMissingCharSet = "missingCharSet";
enum XNDefaultString = "defaultString";
enum XNOrientation = "orientation";
enum XNDirectionalDependentDrawing = "directionalDependentDrawing";
enum XNContextualDrawing = "contextualDrawing";
enum XNFontInfo = "fontInfo";

struct XOMCharSetList
{
	int charset_count;
	char** charset_list;
}

enum XOrientation
{
	XOMOrientation_LTR_TTB,
	XOMOrientation_RTL_TTB,
	XOMOrientation_TTB_LTR,
	XOMOrientation_TTB_RTL,
	XOMOrientation_Context
}

alias XOMOrientation_LTR_TTB = XOrientation.XOMOrientation_LTR_TTB;
alias XOMOrientation_RTL_TTB = XOrientation.XOMOrientation_RTL_TTB;
alias XOMOrientation_TTB_LTR = XOrientation.XOMOrientation_TTB_LTR;
alias XOMOrientation_TTB_RTL = XOrientation.XOMOrientation_TTB_RTL;
alias XOMOrientation_Context = XOrientation.XOMOrientation_Context;

struct XOMOrientation
{
	int num_orientation;
	XOrientation* orientation; /* Input Text description */
}

struct XOMFontInfo
{
	int num_font;
	XFontStruct** font_struct_list;
	char** font_name_list;
}

struct _XIM;
alias XIM = _XIM*;

struct _XIC;
alias XIC = _XIC*;

alias XIMProc = void function(XIM, XPointer, XPointer);

alias XICProc = Bool function(XIC, XPointer, XPointer);

alias XIDProc = void function(Display*, XPointer, XPointer);

alias XIMStyle = c_ulong;

struct XIMStyles
{
	ushort count_styles;
	XIMStyle* supported_styles;
}

enum XIMPreeditArea = 0x0001L;
enum XIMPreeditCallbacks = 0x0002L;
enum XIMPreeditPosition = 0x0004L;
enum XIMPreeditNothing = 0x0008L;
enum XIMPreeditNone = 0x0010L;
enum XIMStatusArea = 0x0100L;
enum XIMStatusCallbacks = 0x0200L;
enum XIMStatusNothing = 0x0400L;
enum XIMStatusNone = 0x0800L;

enum const(char)* XNVaNestedList = "XNVaNestedList";
enum const(char)* XNQueryInputStyle = "queryInputStyle";
enum const(char)* XNClientWindow = "clientWindow";
enum const(char)* XNInputStyle = "inputStyle";
enum const(char)* XNFocusWindow = "focusWindow";
enum const(char)* XNResourceName = "resourceName";
enum const(char)* XNResourceClass = "resourceClass";
enum const(char)* XNGeometryCallback = "geometryCallback";
enum const(char)* XNDestroyCallback = "destroyCallback";
enum const(char)* XNFilterEvents = "filterEvents";
enum const(char)* XNPreeditStartCallback = "preeditStartCallback";
enum const(char)* XNPreeditDoneCallback = "preeditDoneCallback";
enum const(char)* XNPreeditDrawCallback = "preeditDrawCallback";
enum const(char)* XNPreeditCaretCallback = "preeditCaretCallback";
enum const(char)* XNPreeditStateNotifyCallback = "preeditStateNotifyCallback";
enum const(char)* XNPreeditAttributes = "preeditAttributes";
enum const(char)* XNStatusStartCallback = "statusStartCallback";
enum const(char)* XNStatusDoneCallback = "statusDoneCallback";
enum const(char)* XNStatusDrawCallback = "statusDrawCallback";
enum const(char)* XNStatusAttributes = "statusAttributes";
enum const(char)* XNArea = "area";
enum const(char)* XNAreaNeeded = "areaNeeded";
enum const(char)* XNSpotLocation = "spotLocation";
enum const(char)* XNColormap = "colorMap";
enum const(char)* XNStdColormap = "stdColorMap";
enum const(char)* XNForeground = "foreground";
enum const(char)* XNBackground = "background";
enum const(char)* XNBackgroundPixmap = "backgroundPixmap";
enum const(char)* XNFontSet = "fontSet";
enum const(char)* XNLineSpace = "lineSpace";
enum const(char)* XNCursor = "cursor";

enum const(char)* XNQueryIMValuesList = "queryIMValuesList";
enum const(char)* XNQueryICValuesList = "queryICValuesList";
enum const(char)* XNVisiblePosition = "visiblePosition";
enum const(char)* XNR6PreeditCallback = "r6PreeditCallback";
enum const(char)* XNStringConversionCallback = "stringConversionCallback";
enum const(char)* XNStringConversion = "stringConversion";
enum const(char)* XNResetState = "resetState";
enum const(char)* XNHotKey = "hotKey";
enum const(char)* XNHotKeyState = "hotKeyState";
enum const(char)* XNPreeditState = "preeditState";
enum const(char)* XNSeparatorofNestedList = "separatorofNestedList";

enum XBufferOverflow = -1;
enum XLookupNone = 1;
enum XLookupChars = 2;
enum XLookupKeySym = 3;
enum XLookupBoth = 4;

alias XVaNestedList = void*;

struct XIMCallback
{
	XPointer client_data;
	XIMProc callback;
}

struct XICCallback
{
	XPointer client_data;
	XICProc callback;
}

alias XIMFeedback = c_ulong;

enum XIMReverse = 1L;
enum XIMUnderline = (1L << 1);
enum XIMHighlight = (1L << 2);
enum XIMPrimary = (1L << 5);
enum XIMSecondary = (1L << 6);
enum XIMTertiary = (1L << 7);
enum XIMVisibleToForward = (1L << 8);
enum XIMVisibleToBackword = (1L << 9);
enum XIMVisibleToCenter = (1L << 10);

struct XIMText
{
	ushort length;
	XIMFeedback* feedback;
	Bool encoding_is_wchar;

	private union string_union
	{
		char* multi_byte;
		wchar_t* wide_char;
	}

	string_union string_;
}

alias XIMPreeditState = c_ulong;

enum XIMPreeditUnKnown = 0L;
enum XIMPreeditEnable = 1L;
enum XIMPreeditDisable = (1L << 1);

struct XIMPreeditStateNotifyCallbackStruct
{
	XIMPreeditState state;
}

alias XIMResetState = c_ulong;

enum XIMInitialState = 1L;
enum XIMPreserveState = (1L << 1);

alias XIMStringConversionFeedback = c_ulong;

enum XIMStringConversionLeftEdge = (0x00000001);
enum XIMStringConversionRightEdge = (0x00000002);
enum XIMStringConversionTopEdge = (0x00000004);
enum XIMStringConversionBottomEdge = (0x00000008);
enum XIMStringConversionConcealed = (0x00000010);
enum XIMStringConversionWrapped = (0x00000020);

struct XIMStringConversionText
{
	ushort length;
	XIMStringConversionFeedback* feedback;
	Bool encoding_is_wchar;
	private union string_union
	{
		char* mbs;
		wchar_t* wcs;
	}

	string_union string_;
}

alias XIMStringConversionPosition = c_ulong;

alias XIMStringConversionType = c_ulong;

enum XIMStringConversionBuffer = (0x0001);
enum XIMStringConversionLine = (0x0002);
enum XIMStringConversionWord = (0x0003);
enum XIMStringConversionChar = (0x0004);

alias XIMStringConversionOperation = c_ulong;

enum XIMStringConversionSubstitution = (0x0001);
enum XIMStringConversionRetrieval = (0x0002);

enum XIMCaretDirection
{
	XIMForwardChar,
	XIMBackwardChar,
	XIMForwardWord,
	XIMBackwardWord,
	XIMCaretUp,
	XIMCaretDown,
	XIMNextLine,
	XIMPreviousLine,
	XIMLineStart,
	XIMLineEnd,
	XIMAbsolutePosition,
	XIMDontChange
}

struct XIMStringConversionCallbackStruct
{
	XIMStringConversionPosition position;
	XIMCaretDirection direction;
	XIMStringConversionOperation operation;
	ushort factor;
	XIMStringConversionText* text;
}

struct XIMPreeditDrawCallbackStruct
{
	int caret; /* Cursor offset within pre-edit string */
	int chg_first; /* Starting change position */
	int chg_length; /* Length of the change in character count */
	XIMText* text;
}

enum XIMCaretStyle
{
	XIMIsInvisible, /* Disable caret feedback */
	XIMIsPrimary, /* UI defined caret feedback */
	XIMIsSecondary /* UI defined caret feedback */
}

struct XIMPreeditCaretCallbackStruct
{
	int position; /* Caret offset within pre-edit string */
	XIMCaretDirection direction; /* Caret moves direction */
	XIMCaretStyle style; /* Feedback of the caret */
}

enum XIMStatusDataType
{
	XIMTextType,
	XIMBitmapType
}

struct XIMStatusDrawCallbackStruct
{
	XIMStatusDataType type;
	private union data_
	{
		XIMText* text;
		Pixmap bitmap;
	}

	data_ data;
}

struct XIMHotKeyTrigger
{
	KeySym keysym;
	int modifier;
	int modifier_mask;
}

struct XIMHotKeyTriggers
{
	int num_hot_key;
	XIMHotKeyTrigger* key;
}

alias XIMHotKeyState = c_ulong;

enum XIMHotKeyStateON = (0x0001L);
enum XIMHotKeyStateOFF = (0x0002L);

struct XIMValuesList
{
	ushort count_values;
	char** supported_values;
}

/* WARNING, this type not in Xlib spec */
alias XErrorHandler = int function(Display*  /* display */ , XErrorEvent*  /* error_event */
		);

/* WARNING, this type not in Xlib spec */
alias XIOErrorHandler = int function(Display*  /* display */
		);

alias XConnectionWatchProc = void function(Display*  /* dpy */ , XPointer /* client_data */ ,
		int /* fd */ , Bool /* opening */ , /* open or close flag */
		XPointer*  /* watch_data */  /* open sets, close uses */
		);

alias int XrmQuark;
alias int* XrmQuarkList;

alias XrmHashTable[] XrmSearchList;
alias XrmHashBucket* XrmHashTable;
alias _XrmHashBucketRec* XrmHashBucket;
alias _XrmHashBucketRec* XrmDatabase;

struct XrmValue
{
	uint size;
	XPointer addr;
}

alias XrmValue* XrmValuePtr;

alias XContext = int;

extern (C) @nogc nothrow
{
	alias da_XLoadQueryFont = XFontStruct* function(Display*  /* display */ , const(char)*  /* name */);
	alias da_XQueryFont = XFontStruct* function(Display*  /* display */ , XID /* font_ID */);
	alias da_XGetMotionEvents = XTimeCoord* function(Display*  /* display */ , Window /* w */ , Time /* start */ , Time /* stop */ , int*  /* nevents_return */);

	version (XlibWidePrototypes) alias da_XDeleteModifiermapEntry = XModifierKeymap* function(XModifierKeymap*  /* modmap */ , uint /* keycode_entry */ , int /* modifier */);
	else alias da_XDeleteModifiermapEntry = XModifierKeymap* function(XModifierKeymap*  /* modmap */ , KeyCode /* keycode_entry */ , int /* modifier */);

	alias da_XGetModifierMapping = XModifierKeymap* function(Display*  /* display */);

	version (XlibWidePrototypes) alias da_XInsertModifiermapEntry = XModifierKeymap* function(XModifierKeymap*  /* modmap */ , uint /* keycode_entry */ , int /* modifier */);
	else alias da_XInsertModifiermapEntry =XModifierKeymap* function(XModifierKeymap*  /* modmap */ , KeyCode /* keycode_entry */ , int /* modifier */);

	alias da_XNewModifiermap = XModifierKeymap* function(int /* max_keys_per_mod */);
	alias da_XCreateImage = XImage* function(Display*  /* display */ , Visual*  /* visual */ , uint /* depth */ ,int /* format */ , int /* offset */ , char*  /* data */ , uint /* width */ ,uint /* height */ , int /* bitmap_pad */ , int /* bytes_per_line */);
	alias da_XInitImage = Status function(XImage*  /* image */);
	alias da_XGetImage = XImage* function(Display*  /* display */ , Drawable /* d */ , int /* x */ ,int /* y */ , uint /* width */ , uint /* height */ , c_ulong /* plane_mask */ , int /* format */);
	alias da_XGetSubImage = XImage* function(Display*  /* display */ , Drawable /* d */ , int /* x */ , int /* y */ , uint /* width */ , uint /* height */ , c_ulong /* plane_mask */ , int /* format */ , XImage*  /* dest_image */ , int /* dest_x */ , int /* dest_y */);
	
	/*
	* X function declarations.
	*/
	alias da_XOpenDisplay = Display* function(const(char)*  /* display_name */);
	alias da_XrmInitialize = void function();
	alias da_XFetchBytes = char* function(Display*  /* display */ , int*  /* nbytes_return */);
	alias da_XFetchBuffer = char* function(Display*  /* display */ , int*  /* nbytes_return */ , int /* buffer */);
	alias da_XGetAtomName = char* function(Display*  /* display */ , Atom /* atom */);
	alias da_XGetAtomNames = Status function(Display*  /* dpy */ , Atom*  /* atoms */ , int /* count */ , char**  /* names_return */);
	alias da_XGetDefault = char* function(Display*  /* display */ , const(char)*  /* program */ , const(char)*  /* option */);
	alias da_XDisplayName = char* function(const(char)*  /* string */);
	alias da_XKeysymToString = char* function(KeySym /* keysym */);
	alias da_XSynchronize = int function(Display*) function(Display*  /* display */ , Bool /* onoff */);
	alias da_XSetAfterFunction = int function(Display*) function(Display*  /* display */ , int function(Display*) proc);
	alias da_XInternAtom = Atom function(Display*  /* display */ , const(char)*  /* atom_name */ , Bool /* only_if_exists */);
	alias da_XInternAtoms = Status function(Display*  /* dpy */ , char**  /* names */ , int /* count */ , Bool /* onlyIfExists */ , Atom*  /* atoms_return */);
	alias da_XCopyColormapAndFree = Colormap function(Display*  /* display */ , Colormap /* colormap */);
	alias da_XCreateColormap = Colormap function(Display*  /* display */ , Window /* w */ , Visual*  /* visual */ , int /* alloc */);
	alias da_XCreatePixmapCursor = Cursor function(Display*  /* display */ , Pixmap /* source */ , Pixmap /* mask */ , XColor*  /* foreground_color */ , XColor*  /* background_color */ , uint /* x */ , uint /* y */);
	alias da_XCreateGlyphCursor = Cursor function(Display*  /* display */ , Font /* source_font */ , Font /* mask_font */ , uint /* source_char */ , uint /* mask_char */ , const(XColor)*  /* foreground_color */ , const(XColor)*  /* background_color */);
	alias da_XCreateFontCursor = Cursor function(Display*  /* display */ , uint /* shape */);
	alias da_XLoadFont = Font function(Display*  /* display */ , const(char)*  /* name */);
	alias da_XCreateGC = GC function(Display*  /* display */ , Drawable /* d */ , c_ulong /* valuemask */ , XGCValues*  /* values */);
	alias da_XGContextFromGC = GContext function(GC /* gc */);
	alias da_XFlushGC = void function(Display*  /* display */ , GC /* gc */);
	alias da_XCreatePixmap = Pixmap function(Display*  /* display */ , Drawable /* d */ , uint /* width */ , uint /* height */ ,uint /* depth */);
	alias da_XCreateBitmapFromData = Pixmap function(Display*  /* display */ , Drawable /* d */ , const(char)*  /* data */ , uint /* width */ , uint /* height */);
	alias da_XCreatePixmapFromBitmapData = Pixmap function(Display*  /* display */ , Drawable /* d */ , char*  /* data */ , uint /* width */ , uint /* height */ , c_ulong /* fg */ , c_ulong /* bg */ , uint /* depth */);
	alias da_XCreateSimpleWindow = Window function(Display*  /* display */ , Window /* parent */ , int /* x */ , int /* y */ , uint /* width */ ,uint /* height */ , uint /* border_width */ , c_ulong /* border */ , c_ulong /* background */);
	alias da_XGetSelectionOwner = Window function(Display*  /* display */ , Atom /* selection */);
	alias da_XCreateWindow = Window function(Display*  /* display */ , Window /* parent */ , int /* x */ , int /* y */ , uint /* width */ , uint /* height */ ,uint /* border_width */ , int /* depth */ , uint /* class */ , Visual*  /* visual */ , c_ulong /* valuemask */ , XSetWindowAttributes*  /* attributes */ );
	alias da_XListInstalledColormaps = Colormap* function(Display*  /* display */ , Window /* w */ , int*  /* num_return */);
	char** XListFonts(Display*  /* display */ , const(char)*  /* pattern */ , int /* maxnames */ , int*  /* actual_count_return */ );
	char** XListFontsWithInfo(Display*  /* display */ , const(char)*  /* pattern */ , int /* maxnames */ , int*  /* count_return */ , XFontStruct**  /* info_return */);
	char** XGetFontPath(Display*  /* display */ , int*  /* npaths_return */);
	char** XListExtensions(Display*  /* display */ , int*  /* nextensions_return */);
	Atom* XListProperties(Display*  /* display */ , Window /* w */ , int*  /* num_prop_return */);
	XHostAddress* XListHosts(Display*  /* display */ , int*  /* nhosts_return */ , Bool*  /* state_return */);
	KeySym XLookupKeysym(XKeyEvent*  /* key_event */ , int /* index */);

	version (XlibWidePrototypes) KeySym* XGetKeyboardMapping(Display*  /* display */ , uint /* keycode_entry */ , int /* keycode_count */ , int*  /* keysyms_per_keycode_return */);
	else KeySym* XGetKeyboardMapping(Display*  /* display */ , KeyCode /* keycode_entry */ , int /* keycode_count */ , int*  /* keysyms_per_keycode_return */);
	
	KeySym XStringToKeysym(const(char)*  /* string */);
	c_long XMaxRequestSize(Display*  /* display */);
	c_long XExtendedMaxRequestSize(Display*  /* display */);
	char* XResourceManagerString(Display*  /* display */);
	char* XScreenResourceString(Screen*  /* screen */);
	c_ulong XDisplayMotionBufferSize(Display*  /* display */);
	VisualID XVisualIDFromVisual(Visual*  /* visual */);

	/* multithread routines */
	Status XInitThreads();
	void XLockDisplay(Display*  /* display */);
	void XUnlockDisplay(Display*  /* display */);

	/* routines for dealing with extensions */
	XExtCodes* XInitExtension(Display*  /* display */ , const(char)*  /* name */);
	XExtCodes* XAddExtension(Display*  /* display */);
	XExtData* XFindOnExtensionList(XExtData**  /* structure */ , int /* number */);
	XExtData** XEHeadOfExtensionList(XEDataObject /* object */);

	/* these are routines for which there are also macros */
	Window XRootWindow(Display*  /* display */ , int /* screen_number */);
	Window XDefaultRootWindow(Display*  /* display */);
	Window XRootWindowOfScreen(Screen*  /* screen */);
	Visual* XDefaultVisual(Display*  /* display */ , int /* screen_number */);
	Visual* XDefaultVisualOfScreen(Screen*  /* screen */);
	GC XDefaultGC(Display*  /* display */ , int /* screen_number */);
	GC XDefaultGCOfScreen(Screen*  /* screen */);
	c_ulong XBlackPixel(Display*  /* display */ , int /* screen_number */);
	c_ulong XWhitePixel(Display*  /* display */ , int /* screen_number */);
	c_ulong XAllPlanes();
	c_ulong XBlackPixelOfScreen(Screen*  /* screen */);
	c_ulong XWhitePixelOfScreen(Screen*  /* screen */);
	c_ulong XNextRequest(Display*  /* display */);
	c_ulong XLastKnownRequestProcessed(Display*  /* display */);
	char* XServerVendor(Display*  /* display */);
	char* XDisplayString(Display*  /* display */);
	Colormap XDefaultColormap(Display*  /* display */ , int /* screen_number */
			);
	Colormap XDefaultColormapOfScreen(Screen*  /* screen */
			);
	Display* XDisplayOfScreen(Screen*  /* screen */
			);
	Screen* XScreenOfDisplay(Display*  /* display */ , int /* screen_number */
			);
	Screen* XDefaultScreenOfDisplay(Display*  /* display */
			);
	c_long XEventMaskOfScreen(Screen*  /* screen */
			);

	int XScreenNumberOfScreen(Screen*  /* screen */
			);

	XErrorHandler XSetErrorHandler(XErrorHandler /* handler */
	);

	XIOErrorHandler XSetIOErrorHandler(XIOErrorHandler /* handler */
	);

	XPixmapFormatValues* XListPixmapFormats(Display*  /* display */ , int*  /* count_return */
			);
	int* XListDepths(Display*  /* display */ , int /* screen_number */ , int*  /* count_return */
			);

	/* ICCCM routines for things that don't require special include files; */
	/* other declarations are given in Xutil.h                             */
	Status XReconfigureWMWindow(Display*  /* display */ , Window /* w */ , int /* screen_number */ ,
			uint /* mask */ , XWindowChanges*  /* changes */
			);

	Status XGetWMProtocols(Display*  /* display */ , Window /* w */ , Atom**  /* protocols_return */ ,
			int*  /* count_return */
			);
	Status XSetWMProtocols(Display*  /* display */ , Window /* w */ , Atom*  /* protocols */ , int /* count */
			);
	Status XIconifyWindow(Display*  /* display */ , Window /* w */ , int /* screen_number */
			);
	Status XWithdrawWindow(Display*  /* display */ , Window /* w */ , int /* screen_number */
			);
	Status XGetCommand(Display*  /* display */ , Window /* w */ , char***  /* argv_return */ , int*  /* argc_return */
			);
	Status XGetWMColormapWindows(Display*  /* display */ , Window /* w */ , Window**  /* windows_return */ ,
			int*  /* count_return */
			);
	Status XSetWMColormapWindows(Display*  /* display */ , Window /* w */ , Window*  /* colormap_windows */ ,
			int /* count */
			);
	void XFreeStringList(char**  /* list */
			);
	int XSetTransientForHint(Display*  /* display */ , Window /* w */ , Window /* prop_window */
			);

	/* The following are given in alphabetical order */

	int XActivateScreenSaver(Display*  /* display */
			);

	int XAddHost(Display*  /* display */ , XHostAddress*  /* host */
			);

	int XAddHosts(Display*  /* display */ , XHostAddress*  /* hosts */ , int /* num_hosts */
			);

	int XAddToExtensionList(XExtData**  /* structure */ , XExtData*  /* ext_data */
			);

	int XAddToSaveSet(Display*  /* display */ , Window /* w */
			);

	Status XAllocColor(Display*  /* display */ , Colormap /* colormap */ , XColor*  /* screen_in_out */
			);

	Status XAllocColorCells(Display*  /* display */ , Colormap /* colormap */ ,
			Bool /* contig */ , c_ulong*  /* plane_masks_return */ , uint /* nplanes */ ,
			c_ulong*  /* pixels_return */ , uint /* npixels */
			);

	Status XAllocColorPlanes(Display*  /* display */ , Colormap /* colormap */ , Bool /* contig */ , c_ulong*  /* pixels_return */ ,
			int /* ncolors */ , int /* nreds */ , int /* ngreens */ , int /* nblues */ ,
			c_ulong*  /* rmask_return */ , c_ulong*  /* gmask_return */ , c_ulong*  /* bmask_return */
			);

	Status XAllocNamedColor(Display*  /* display */ , Colormap /* colormap */ ,
			const(char)*  /* color_name */ , XColor*  /* screen_def_return */ , XColor*  /* exact_def_return */
			);

	int XAllowEvents(Display*  /* display */ , int /* event_mode */ , Time /* time */
			);

	int XAutoRepeatOff(Display*  /* display */
			);

	int XAutoRepeatOn(Display*  /* display */
			);

	int XBell(Display*  /* display */ , int /* percent */
			);

	int XBitmapBitOrder(Display*  /* display */
			);

	int XBitmapPad(Display*  /* display */
			);

	int XBitmapUnit(Display*  /* display */
			);

	int XCellsOfScreen(Screen*  /* screen */
			);

	int XChangeActivePointerGrab(Display*  /* display */ , uint /* event_mask */ , Cursor /* cursor */ ,
			Time /* time */
			);

	int XChangeGC(Display*  /* display */ , GC /* gc */ , c_ulong /* valuemask */ , XGCValues*  /* values */
			);

	int XChangeKeyboardControl(Display*  /* display */ , c_ulong /* value_mask */ ,
			XKeyboardControl*  /* values */
			);

	int XChangeKeyboardMapping(Display*  /* display */ , int /* first_keycode */ , int /* keysyms_per_keycode */ ,
			KeySym*  /* keysyms */ , int /* num_codes */
			);

	int XChangePointerControl(Display*  /* display */ , Bool /* do_accel */ , Bool /* do_threshold */ ,
			int /* accel_numerator */ , int /* accel_denominator */ , int /* threshold */
			);

	int XChangeProperty(Display*  /* display */ , Window /* w */ , Atom /* property */ , Atom /* type */ ,
			int /* format */ , int /* mode */ , const(ubyte)*  /* data */ , int /* nelements */
			);

	int XChangeSaveSet(Display*  /* display */ , Window /* w */ , int /* change_mode */
			);

	int XChangeWindowAttributes(Display*  /* display */ , Window /* w */ ,
			c_ulong /* valuemask */ , XSetWindowAttributes*  /* attributes */
			);

	Bool XCheckIfEvent(Display*  /* display */ , XEvent*  /* event_return */ ,
			Bool function(Display*, XEvent*, XPointer) /* predicate */ , XPointer /* arg */
			);

	Bool XCheckMaskEvent(Display*  /* display */ , c_long /* event_mask */ , XEvent*  /* event_return */
			);

	Bool XCheckTypedEvent(Display*  /* display */ , int /* event_type */ , XEvent*  /* event_return */
			);

	Bool XCheckTypedWindowEvent(Display*  /* display */ , Window /* w */ , int /* event_type */ ,
			XEvent*  /* event_return */
			);

	Bool XCheckWindowEvent(Display*  /* display */ , Window /* w */ , c_long /* event_mask */ ,
			XEvent*  /* event_return */
			);

	int XCirculateSubwindows(Display*  /* display */ , Window /* w */ , int /* direction */
			);

	int XCirculateSubwindowsDown(Display*  /* display */ , Window /* w */
			);

	int XCirculateSubwindowsUp(Display*  /* display */ , Window /* w */
			);

	int XClearArea(Display*  /* display */ , Window /* w */ , int /* x */ , int /* y */ ,
			uint /* width */ , uint /* height */ , Bool /* exposures */
			);

	int XClearWindow(Display*  /* display */ , Window /* w */
			);

	int XCloseDisplay(Display*  /* display */
			);

	int XConfigureWindow(Display*  /* display */ , Window /* w */ , uint /* value_mask */ ,
			XWindowChanges*  /* values */
			);

	int XConnectionNumber(Display*  /* display */
			);

	int XConvertSelection(Display*  /* display */ , Atom /* selection */ , Atom /* target */ ,
			Atom /* property */ , Window /* requestor */ , Time /* time */
			);

	int XCopyArea(Display*  /* display */ , Drawable /* src */ , Drawable /* dest */ , GC /* gc */ ,
			int /* src_x */ , int /* src_y */ , uint /* width */ , uint /* height */ , int /* dest_x */ ,
			int /* dest_y */
			);

	int XCopyGC(Display*  /* display */ , GC /* src */ , c_ulong /* valuemask */ , GC /* dest */
			);

	int XCopyPlane(Display*  /* display */ , Drawable /* src */ , Drawable /* dest */ , GC /* gc */ , int /* src_x */ , int /* src_y */ ,
			uint /* width */ , uint /* height */ , int /* dest_x */ , int /* dest_y */ , c_ulong /* plane */
			);

	int XDefaultDepth(Display*  /* display */ , int /* screen_number */
			);

	int XDefaultDepthOfScreen(Screen*  /* screen */
			);

	int XDefaultScreen(Display*  /* display */
			);

	int XDefineCursor(Display*  /* display */ , Window /* w */ , Cursor /* cursor */
			);

	int XDeleteProperty(Display*  /* display */ , Window /* w */ , Atom /* property */
			);

	int XDestroyWindow(Display*  /* display */ , Window /* w */
			);

	int XDestroySubwindows(Display*  /* display */ , Window /* w */
			);

	int XDoesBackingStore(Screen*  /* screen */
			);

	Bool XDoesSaveUnders(Screen*  /* screen */
			);

	int XDisableAccessControl(Display*  /* display */
			);

	int XDisplayCells(Display*  /* display */ , int /* screen_number */
			);

	int XDisplayHeight(Display*  /* display */ , int /* screen_number */
			);

	int XDisplayHeightMM(Display*  /* display */ , int /* screen_number */
			);

	int XDisplayKeycodes(Display*  /* display */ , int*  /* min_keycodes_return */ , int*  /* max_keycodes_return */
			);

	int XDisplayPlanes(Display*  /* display */ , int /* screen_number */
			);

	int XDisplayWidth(Display*  /* display */ , int /* screen_number */
			);

	int XDisplayWidthMM(Display*  /* display */ , int /* screen_number */
			);

	int XDrawArc(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , uint /* width */ , uint /* height */ , int /* angle1 */ , int /* angle2 */
			);

	int XDrawArcs(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XArc*  /* arcs */ , int /* narcs */
			);

	int XDrawImageString(Display*  /* display */ , Drawable /* d */ , GC /* gc */ ,
			int /* x */ , int /* y */ , const(char)*  /* string */ , int /* length */
			);

	int XDrawImageString16(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , const XChar2b*  /* string */ , int /* length */
			);

	int XDrawLine(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x1 */ ,
			int /* y1 */ , int /* x2 */ , int /* y2 */
			);

	int XDrawLines(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XPoint*  /* points */ ,
			int /* npoints */ , int /* mode */
			);

	int XDrawPoint(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ , int /* y */
			);

	int XDrawPoints(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XPoint*  /* points */ ,
			int /* npoints */ , int /* mode */
			);

	int XDrawRectangle(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , uint /* width */ , uint /* height */
			);

	int XDrawRectangles(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XRectangle*  /* rectangles */ ,
			int /* nrectangles */
			);

	int XDrawSegments(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XSegment*  /* segments */ ,
			int /* nsegments */
			);

	int XDrawString(Display*  /* display */ , Drawable /* d */ , GC /* gc */ ,
			int /* x */ , int /* y */ , const(char)*  /* string */ , int /* length */
			);

	int XDrawString16(Display*  /* display */ , Drawable /* d */ , GC /* gc */ ,
			int /* x */ , int /* y */ , const XChar2b*  /* string */ , int /* length */
			);

	int XDrawText(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , XTextItem*  /* items */ , int /* nitems */
			);

	int XDrawText16(Display*  /* display */ , Drawable /* d */ , GC /* gc */ ,
			int /* x */ , int /* y */ , XTextItem16*  /* items */ , int /* nitems */
			);

	int XEnableAccessControl(Display*  /* display */
			);

	int XEventsQueued(Display*  /* display */ , int /* mode */
			);

	Status XFetchName(Display*  /* display */ , Window /* w */ , char**  /* window_name_return */
			);

	int XFillArc(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , uint /* width */ , uint /* height */ , int /* angle1 */ , int /* angle2 */
			);

	int XFillArcs(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XArc*  /* arcs */ , int /* narcs */
			);

	int XFillPolygon(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XPoint*  /* points */ ,
			int /* npoints */ , int /* shape */ , int /* mode */
			);

	int XFillRectangle(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ ,
			int /* y */ , uint /* width */ , uint /* height */
			);

	int XFillRectangles(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XRectangle*  /* rectangles */ ,
			int /* nrectangles */
			);

	int XFlush(Display*  /* display */
			);

	int XForceScreenSaver(Display*  /* display */ , int /* mode */
			);

	int XFree(void*  /* data */
			);

	int XFreeColormap(Display*  /* display */ , Colormap /* colormap */
			);

	int XFreeColors(Display*  /* display */ , Colormap /* colormap */ , c_ulong*  /* pixels */ ,
			int /* npixels */ , c_ulong /* planes */
			);

	int XFreeCursor(Display*  /* display */ , Cursor /* cursor */
			);

	int XFreeExtensionList(char**  /* list */
			);

	int XFreeFont(Display*  /* display */ , XFontStruct*  /* font_struct */
			);

	int XFreeFontInfo(char**  /* names */ , XFontStruct*  /* free_info */ , int /* actual_count */
			);

	int XFreeFontNames(char**  /* list */
			);

	int XFreeFontPath(char**  /* list */
			);

	int XFreeGC(Display*  /* display */ , GC /* gc */
			);

	int XFreeModifiermap(XModifierKeymap*  /* modmap */
			);

	int XFreePixmap(Display*  /* display */ , Pixmap /* pixmap */
			);

	int XGeometry(Display*  /* display */ , int /* screen */ , const(char)*  /* position */ ,
			const(char)*  /* default_position */ , uint /* bwidth */ , uint /* fwidth */ ,
			uint /* fheight */ , int /* xadder */ , int /* yadder */ , int*  /* x_return */ ,
			int*  /* y_return */ , int*  /* width_return */ , int*  /* height_return */
			);

	int XGetErrorDatabaseText(Display*  /* display */ , const(char)*  /* name */ ,
			const(char)*  /* message */ , const(char)*  /* default_string */ , char*  /* buffer_return */ ,
			int /* length */
			);

	int XGetErrorText(Display*  /* display */ , int /* code */ , char*  /* buffer_return */ , int /* length */
			);

	Bool XGetFontProperty(XFontStruct*  /* font_struct */ , Atom /* atom */ , c_ulong*  /* value_return */
			);

	Status XGetGCValues(Display*  /* display */ , GC /* gc */ , c_ulong /* valuemask */ ,
			XGCValues*  /* values_return */
			);

	Status XGetGeometry(Display*  /* display */ , Drawable /* d */ , Window*  /* root_return */ , int*  /* x_return */ , int*  /* y_return */ ,
			uint*  /* width_return */ , uint*  /* height_return */ , uint*  /* border_width_return */ ,
			uint*  /* depth_return */
			);

	Status XGetIconName(Display*  /* display */ , Window /* w */ , char**  /* icon_name_return */
			);

	int XGetInputFocus(Display*  /* display */ , Window*  /* focus_return */ , int*  /* revert_to_return */
			);

	int XGetKeyboardControl(Display*  /* display */ , XKeyboardState*  /* values_return */
			);

	int XGetPointerControl(Display*  /* display */ , int*  /* accel_numerator_return */ ,
			int*  /* accel_denominator_return */ , int*  /* threshold_return */
			);

	int XGetPointerMapping(Display*  /* display */ , ubyte*  /* map_return */ , int /* nmap */
			);

	int XGetScreenSaver(Display*  /* display */ , int*  /* timeout_return */ , int*  /* interval_return */ ,
			int*  /* prefer_blanking_return */ , int*  /* allow_exposures_return */
			);

	Status XGetTransientForHint(Display*  /* display */ , Window /* w */ , Window*  /* prop_window_return */
			);

	int XGetWindowProperty(Display*  /* display */ , Window /* w */ , Atom /* property */ , c_long /* c_long_offset */ , c_long /* c_long_length */ ,
			Bool /* delete */ , Atom /* req_type */ , Atom*  /* actual_type_return */ ,
			int*  /* actual_format_return */ , c_ulong*  /* nitems_return */ , c_ulong*  /* bytes_after_return */ ,
			ubyte**  /* prop_return */
			);

	Status XGetWindowAttributes(Display*  /* display */ , Window /* w */ , XWindowAttributes*  /* window_attributes_return */
			);

	int XGrabButton(Display*  /* display */ , uint /* button */ , uint /* modifiers */ , Window /* grab_window */ ,
			Bool /* owner_events */ , uint /* event_mask */ , int /* pointer_mode */ ,
			int /* keyboard_mode */ , Window /* confine_to */ , Cursor /* cursor */
			);

	int XGrabKey(Display*  /* display */ , int /* keycode */ , uint /* modifiers */ ,
			Window /* grab_window */ , Bool /* owner_events */ , int /* pointer_mode */ , int /* keyboard_mode */
			);

	int XGrabKeyboard(Display*  /* display */ , Window /* grab_window */ , Bool /* owner_events */ ,
			int /* pointer_mode */ , int /* keyboard_mode */ , Time /* time */
			);

	int XGrabPointer(Display*  /* display */ , Window /* grab_window */ , Bool /* owner_events */ ,
			uint /* event_mask */ , int /* pointer_mode */ , int /* keyboard_mode */ ,
			Window /* confine_to */ , Cursor /* cursor */ , Time /* time */
			);

	int XGrabServer(Display*  /* display */
			);

	int XHeightMMOfScreen(Screen*  /* screen */
			);

	int XHeightOfScreen(Screen*  /* screen */
			);

	int XIfEvent(Display*  /* display */ , XEvent*  /* event_return */ , Bool function(Display*  /* display */ ,
				XEvent*  /* event */ , XPointer /* arg */
				) /* predicate */ , XPointer /* arg */
			);

	int XImageByteOrder(Display*  /* display */
			);

	int XInstallColormap(Display*  /* display */ , Colormap /* colormap */
			);

	KeyCode XKeysymToKeycode(Display*  /* display */ , KeySym /* keysym */
			);

	int XKillClient(Display*  /* display */ , XID /* resource */
			);

	Status XLookupColor(Display*  /* display */ , Colormap /* colormap */ ,
			const(char)*  /* color_name */ , XColor*  /* exact_def_return */ , XColor*  /* screen_def_return */
			);

	int XLowerWindow(Display*  /* display */ , Window /* w */
			);

	int XMapRaised(Display*  /* display */ , Window /* w */
			);

	int XMapSubwindows(Display*  /* display */ , Window /* w */
			);

	int XMapWindow(Display*  /* display */ , Window /* w */
			);

	int XMaskEvent(Display*  /* display */ , c_long /* event_mask */ , XEvent*  /* event_return */
			);

	int XMaxCmapsOfScreen(Screen*  /* screen */
			);

	int XMinCmapsOfScreen(Screen*  /* screen */
			);

	int XMoveResizeWindow(Display*  /* display */ , Window /* w */ , int /* x */ , int /* y */ ,
			uint /* width */ , uint /* height */
			);

	int XMoveWindow(Display*  /* display */ , Window /* w */ , int /* x */ , int /* y */
			);

	int XNextEvent(Display*  /* display */ , XEvent*  /* event_return */
			);

	int XNoOp(Display*  /* display */
			);

	Status XParseColor(Display*  /* display */ , Colormap /* colormap */ , const(char)*  /* spec */ ,
			XColor*  /* exact_def_return */
			);

	int XParseGeometry(const(char)*  /* parsestring */ , int*  /* x_return */ , int*  /* y_return */ ,
			uint*  /* width_return */ , uint*  /* height_return */
			);

	int XPeekEvent(Display*  /* display */ , XEvent*  /* event_return */
			);

	int XPeekIfEvent(Display*  /* display */ , XEvent*  /* event_return */ , Bool function(Display*  /* display */ ,
				XEvent*  /* event */ , XPointer /* arg */
				) /* predicate */ , XPointer /* arg */
			);

	int XPending(Display*  /* display */
			);

	int XPlanesOfScreen(Screen*  /* screen */
			);

	int XProtocolRevision(Display*  /* display */
			);

	int XProtocolVersion(Display*  /* display */
			);

	int XPutBackEvent(Display*  /* display */ , XEvent*  /* event */
			);

	int XPutImage(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , XImage*  /* image */ ,
			int /* src_x */ , int /* src_y */ , int /* dest_x */ , int /* dest_y */ , uint /* width */ ,
			uint /* height */
			);

	int XQLength(Display*  /* display */
			);

	Status XQueryBestCursor(Display*  /* display */ , Drawable /* d */ , uint /* width */ ,
			uint /* height */ , uint*  /* width_return */ , uint*  /* height_return */
			);

	Status XQueryBestSize(Display*  /* display */ , int /* class */ , Drawable /* which_screen */ ,
			uint /* width */ , uint /* height */ , uint*  /* width_return */ , uint*  /* height_return */
			);

	Status XQueryBestStipple(Display*  /* display */ , Drawable /* which_screen */ ,
			uint /* width */ , uint /* height */ , uint*  /* width_return */ , uint*  /* height_return */
			);

	Status XQueryBestTile(Display*  /* display */ , Drawable /* which_screen */ ,
			uint /* width */ , uint /* height */ , uint*  /* width_return */ , uint*  /* height_return */
			);

	int XQueryColor(Display*  /* display */ , Colormap /* colormap */ , XColor*  /* def_in_out */
			);

	int XQueryColors(Display*  /* display */ , Colormap /* colormap */ , XColor*  /* defs_in_out */ ,
			int /* ncolors */
			);

	Bool XQueryExtension(Display*  /* display */ , const(char)*  /* name */ , int*  /* major_opcode_return */ ,
			int*  /* first_event_return */ , int*  /* first_error_return */
			);

	int XQueryKeymap(Display*  /* display */ , char[32] /* keys_return */
	);

	Bool XQueryPointer(Display*  /* display */ , Window /* w */ , Window*  /* root_return */ , Window*  /* child_return */ , int*  /* root_x_return */ ,
			int*  /* root_y_return */ , int*  /* win_x_return */ , int*  /* win_y_return */ , uint*  /* mask_return */
			);

	int XQueryTextExtents(Display*  /* display */ , XID /* font_ID */ , const(char)*  /* string */ , int /* nchars */ , int*  /* direction_return */ ,
			int*  /* font_ascent_return */ , int*  /* font_descent_return */ , XCharStruct*  /* overall_return */
			);

	int XQueryTextExtents16(Display*  /* display */ , XID /* font_ID */ , const XChar2b*  /* string */ , int /* nchars */ ,
			int*  /* direction_return */ , int*  /* font_ascent_return */ , int*  /* font_descent_return */ ,
			XCharStruct*  /* overall_return */
			);

	Status XQueryTree(Display*  /* display */ , Window /* w */ , Window*  /* root_return */ ,
			Window*  /* parent_return */ , Window**  /* children_return */ , uint*  /* nchildren_return */
			);

	int XRaiseWindow(Display*  /* display */ , Window /* w */
			);

	int XReadBitmapFile(Display*  /* display */ , Drawable /* d */ , const(char)*  /* filename */ , uint*  /* width_return */ ,
			uint*  /* height_return */ , Pixmap*  /* bitmap_return */ , int*  /* x_hot_return */ ,
			int*  /* y_hot_return */
			);

	int XReadBitmapFileData(const(char)*  /* filename */ , uint*  /* width_return */ ,
			uint*  /* height_return */ , ubyte**  /* data_return */ , int*  /* x_hot_return */ ,
			int*  /* y_hot_return */
			);

	int XRebindKeysym(Display*  /* display */ , KeySym /* keysym */ , KeySym*  /* list */ ,
			int /* mod_count */ , const(ubyte)*  /* string */ , int /* bytes_string */
			);

	int XRecolorCursor(Display*  /* display */ , Cursor /* cursor */ , XColor*  /* foreground_color */ ,
			XColor*  /* background_color */
			);

	int XRefreshKeyboardMapping(XMappingEvent*  /* event_map */
			);

	int XRemoveFromSaveSet(Display*  /* display */ , Window /* w */
			);

	int XRemoveHost(Display*  /* display */ , XHostAddress*  /* host */
			);

	int XRemoveHosts(Display*  /* display */ , XHostAddress*  /* hosts */ , int /* num_hosts */
			);

	int XReparentWindow(Display*  /* display */ , Window /* w */ , Window /* parent */ , int /* x */ ,
			int /* y */
			);

	int XResetScreenSaver(Display*  /* display */
			);

	int XResizeWindow(Display*  /* display */ , Window /* w */ , uint /* width */ , uint /* height */
			);

	int XRestackWindows(Display*  /* display */ , Window*  /* windows */ , int /* nwindows */
			);

	int XRotateBuffers(Display*  /* display */ , int /* rotate */
			);

	int XRotateWindowProperties(Display*  /* display */ , Window /* w */ , Atom*  /* properties */ ,
			int /* num_prop */ , int /* npositions */
			);

	int XScreenCount(Display*  /* display */
			);

	int XSelectInput(Display*  /* display */ , Window /* w */ , c_long /* event_mask */
			);

	Status XSendEvent(Display*  /* display */ , Window /* w */ , Bool /* propagate */ ,
			c_long /* event_mask */ , XEvent*  /* event_send */
			);

	int XSetAccessControl(Display*  /* display */ , int /* mode */
			);

	int XSetArcMode(Display*  /* display */ , GC /* gc */ , int /* arc_mode */
			);

	int XSetBackground(Display*  /* display */ , GC /* gc */ , c_ulong /* background */
			);

	int XSetClipMask(Display*  /* display */ , GC /* gc */ , Pixmap /* pixmap */
			);

	int XSetClipOrigin(Display*  /* display */ , GC /* gc */ , int /* clip_x_origin */ , int /* clip_y_origin */
			);

	int XSetClipRectangles(Display*  /* display */ , GC /* gc */ , int /* clip_x_origin */ ,
			int /* clip_y_origin */ , XRectangle*  /* rectangles */ , int /* n */ , int /* ordering */
			);

	int XSetCloseDownMode(Display*  /* display */ , int /* close_mode */
			);

	int XSetCommand(Display*  /* display */ , Window /* w */ , char**  /* argv */ , int /* argc */
			);

	int XSetDashes(Display*  /* display */ , GC /* gc */ , int /* dash_offset */ , const(char)*  /* dash_list */ ,
			int /* n */
			);

	int XSetFillRule(Display*  /* display */ , GC /* gc */ , int /* fill_rule */
			);

	int XSetFillStyle(Display*  /* display */ , GC /* gc */ , int /* fill_style */
			);

	int XSetFont(Display*  /* display */ , GC /* gc */ , Font /* font */
			);

	int XSetFontPath(Display*  /* display */ , char**  /* directories */ , int /* ndirs */
			);

	int XSetForeground(Display*  /* display */ , GC /* gc */ , c_ulong /* foreground */
			);

	int XSetFunction(Display*  /* display */ , GC /* gc */ , int /* function */
			);

	int XSetGraphicsExposures(Display*  /* display */ , GC /* gc */ , Bool /* graphics_exposures */
			);

	int XSetIconName(Display*  /* display */ , Window /* w */ , const(char)*  /* icon_name */
			);

	int XSetInputFocus(Display*  /* display */ , Window /* focus */ , int /* revert_to */ , Time /* time */
			);

	int XSetLineAttributes(Display*  /* display */ , GC /* gc */ , uint /* line_width */ ,
			int /* line_style */ , int /* cap_style */ , int /* join_style */
			);

	int XSetModifierMapping(Display*  /* display */ , XModifierKeymap*  /* modmap */
			);

	int XSetPlaneMask(Display*  /* display */ , GC /* gc */ , c_ulong /* plane_mask */
			);

	int XSetPointerMapping(Display*  /* display */ , const(ubyte)*  /* map */ , int /* nmap */
			);

	int XSetScreenSaver(Display*  /* display */ , int /* timeout */ , int /* interval */ , int /* prefer_blanking */ ,
			int /* allow_exposures */
			);

	int XSetSelectionOwner(Display*  /* display */ , Atom /* selection */ , Window /* owner */ ,
			Time /* time */
			);

	int XSetState(Display*  /* display */ , GC /* gc */ , c_ulong /* foreground */ ,
			c_ulong /* background */ , int /* function */ , c_ulong /* plane_mask */
			);

	int XSetStipple(Display*  /* display */ , GC /* gc */ , Pixmap /* stipple */
			);

	int XSetSubwindowMode(Display*  /* display */ , GC /* gc */ , int /* subwindow_mode */
			);

	int XSetTSOrigin(Display*  /* display */ , GC /* gc */ , int /* ts_x_origin */ , int /* ts_y_origin */
			);

	int XSetTile(Display*  /* display */ , GC /* gc */ , Pixmap /* tile */
			);

	int XSetWindowBackground(Display*  /* display */ , Window /* w */ , c_ulong /* background_pixel */
			);

	int XSetWindowBackgroundPixmap(Display*  /* display */ , Window /* w */ , Pixmap /* background_pixmap */);
	int XSetWindowBorder(Display*  /* display */ , Window /* w */ , c_ulong /* border_pixel */);
	int XSetWindowBorderPixmap(Display*  /* display */ , Window /* w */ , Pixmap /* border_pixmap */);
	int XSetWindowBorderWidth(Display*  /* display */ , Window /* w */ , uint /* width */);
	int XSetWindowColormap(Display*  /* display */ , Window /* w */ , Colormap /* colormap */);
	int XStoreBuffer(Display*  /* display */ , const(char)*  /* bytes */ , int /* nbytes */ , int /* buffer */);
	int XStoreBytes(Display*  /* display */ , const(char)*  /* bytes */ , int /* nbytes */);
	int XStoreColor(Display*  /* display */ , Colormap /* colormap */ , XColor*  /* color */);
	int XStoreColors(Display*  /* display */ , Colormap /* colormap */ , XColor*  /* color */ , int /* ncolors */);
	int XStoreName(Display*  /* display */ , Window /* w */ , const(char)*  /* window_name */);
	int XStoreNamedColor(Display*  /* display */ , Colormap /* colormap */ , const(char)*  /* color */ , c_ulong /* pixel */ , int /* flags */);
	int XSync(Display*  /* display */ , Bool /* discard */);
	alias da_XTextExtents = int function(XFontStruct*  /* font_struct */ , const(char)*  /* string */ , int /* nchars */ , int*  /* direction_return */ , int*  /* font_ascent_return */ , int*  /* font_descent_return */ , XCharStruct*  /* overall_return */);
	alias da_XTextExtents16 = int function(XFontStruct*  /* font_struct */ , const XChar2b*  /* string */ , int /* nchars */ , int*  /* direction_return */ , int*  /* font_ascent_return */ , int*  /* font_descent_return */ , XCharStruct*  /* overall_return */);
	alias da_XTextWidth = int function(XFontStruct*  /* font_struct */ , const(char)*  /* string */ , int /* count */);
	alias da_XTextWidth16 = int function(XFontStruct*  /* font_struct */ , const XChar2b*  /* string */ , int /* count */);
	alias da_XTranslateCoordinates = Bool function(Display*  /* display */ , Window /* src_w */ , Window /* dest_w */ , int /* src_x */ , int /* src_y */ , int*  /* dest_x_return */ , int*  /* dest_y_return */ , Window*  /* child_return */);
	alias da_XUndefineCursor = int function(Display*  /* display */ , Window /* w */);
	alias da_XUngrabButton = int function(Display*  /* display */ , uint /* button */ , uint /* modifiers */ , Window /* grab_window */);
	alias da_XUngrabKey = int function(Display*  /* display */ , int /* keycode */ , uint /* modifiers */ , Window /* grab_window */);
	alias da_XUngrabKeyboard = int function(Display*  /* display */ , Time /* time */);
	alias da_XUngrabPointer = int function(Display*  /* display */ , Time /* time */);
	alias da_XUngrabServer = int function(Display*  /* display */);
	alias da_XUninstallColormap = int function(Display*  /* display */ , Colormap /* colormap */);
	alias da_XUnloadFont = int function(Display*  /* display */ , Font /* font */);
	alias da_XUnmapSubwindows = int function(Display*  /* display */ , Window /* w */);
	alias da_XUnmapWindow = int function(Display*  /* display */ , Window /* w */);
	alias da_XVendorRelease = int function(Display*  /* display */);
	alias da_XWarpPointer = int function(Display*  /* display */ , Window /* src_w */ , Window /* dest_w */ , int /* src_x */ , int /* src_y */ , uint /* src_width */ , uint /* src_height */ , int /* dest_x */ , int /* dest_y */);
	alias da_XWidthMMOfScreen = int function(Screen*  /* screen */);
	alias da_XWidthOfScreen = int function(Screen*  /* screen */);
	alias da_XWindowEvent = int function(Display*  /* display */ , Window /* w */ , c_long /* event_mask */ , XEvent*  /* event_return */);
	alias da_XWriteBitmapFile = int function(Display*  /* display */ , const(char)*  /* filename */ , Pixmap /* bitmap */ , uint /* width */ , uint /* height */ , int /* x_hot */ , int /* y_hot */);
	alias da_XSupportsLocale = Bool function();
	alias da_XSetLocaleModifiers = char* function(const(char)*  /* modifier_list */);
	alias da_XOpenOM = XOM function(Display*  /* display */ , XrmHashBucketRec*  /* rdb */ , const(char)*  /* res_name */ , const(char)*  /* res_class */);
	alias da_XCloseOM = Status function(XOM /* om */);
	alias da_XSetOMValues = char* function(XOM /* om */ , ...);
	alias da_XGetOMValues = char* function(XOM /* om */ , ...);
	alias da_XDisplayOfOM = Display* function(XOM /* om */);
	alias da_XLocaleOfOM = char* function(XOM /* om */);
	alias da_XCreateOC = XOC function(XOM /* om */ , ...);
	alias da_XDestroyOC = void function(XOC /* oc */);
	alias da_XOMOfOC = XOM function(XOC /* oc */);
	alias da_XSetOCValues = char* function(XOC /* oc */ , ...);
	alias da_XGetOCValues = char* function(XOC /* oc */ , ...);
	alias da_XCreateFontSet = XFontSet function(Display*  /* display */ , const(char)*  /* base_font_name_list */ , char***  /* missing_charset_list */ , int*  /* missing_charset_count */ , char**  /* def_string */);
	alias da_XFreeFontSet = void function(Display*  /* display */ , XFontSet /* font_set */);
	alias da_XFontsOfFontSet = int function(XFontSet /* font_set */ , XFontStruct***  /* font_struct_list */ , char***  /* font_name_list */);
	alias da_XBaseFontNameListOfFontSet = char* function(XFontSet /* font_set */);
	alias da_XLocaleOfFontSet = char* function(XFontSet /* font_set */);
	alias da_XContextDependentDrawing = Bool function(XFontSet /* font_set */);
	alias da_XDirectionalDependentDrawing = Bool function(XFontSet /* font_set */);
	alias da_XContextualDrawing = Bool function(XFontSet /* font_set */);
	alias da_XExtentsOfFontSet = XFontSetExtents* function(XFontSet /* font_set */);
	alias da_XmbTextEscapement = int function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XwcTextEscapement = int function(XFontSet /* font_set */ , const wchar_t*  /* text */ , int /* num_wchars */);
	alias da_Xutf8TextEscapement = int function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XmbTextExtents = int function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_XwcTextExtents = int function(XFontSet /* font_set */ , const wchar_t*  /* text */ , int /* num_wchars */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_Xutf8TextExtents = int function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_XmbTextPerCharExtents = Status function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */ , XRectangle*  /* ink_extents_buffer */ , XRectangle*  /* logical_extents_buffer */ , int /* buffer_size */ , int*  /* num_chars */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_XwcTextPerCharExtents = Status function(XFontSet /* font_set */ , const wchar_t*  /* text */ , int /* num_wchars */ , XRectangle*  /* ink_extents_buffer */ , XRectangle*  /* logical_extents_buffer */ , int /* buffer_size */ , int*  /* num_chars */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_Xutf8TextPerCharExtents = Status function(XFontSet /* font_set */ , const(char)*  /* text */ , int /* bytes_text */ , XRectangle*  /* ink_extents_buffer */ , XRectangle*  /* logical_extents_buffer */ , int /* buffer_size */ , int*  /* num_chars */ , XRectangle*  /* overall_ink_return */ , XRectangle*  /* overall_logical_return */);
	alias da_XmbDrawText = void function(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ , int /* y */ , XmbTextItem*  /* text_items */ , int /* nitems */);
	alias da_XwcDrawText = void function(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ , int /* y */ , XwcTextItem*  /* text_items */ , int /* nitems */);
	alias da_Xutf8DrawText = void function(Display*  /* display */ , Drawable /* d */ , GC /* gc */ , int /* x */ , int /* y */ , XmbTextItem*  /* text_items */ , int /* nitems */);
	alias da_XmbDrawString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ ,int /* x */ , int /* y */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XwcDrawString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ , int /* x */ , int /* y */ , const wchar_t*  /* text */ , int /* num_wchars */);
	alias da_Xutf8DrawString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ , int /* x */ , int /* y */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XmbDrawImageString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ , int /* x */ , int /* y */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XwcDrawImageString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ , int /* x */ , int /* y */ , const wchar_t*  /* text */ , int /* num_wchars */);
	alias da_Xutf8DrawImageString = void function(Display*  /* display */ , Drawable /* d */ , XFontSet /* font_set */ , GC /* gc */ , int /* x */ , int /* y */ , const(char)*  /* text */ , int /* bytes_text */);
	alias da_XOpenIM = XIM function(Display*  /* dpy */ , XrmHashBucketRec*  /* rdb */ , char*  /* res_name */ , char*  /* res_class */);
	alias da_XCloseIM = Status function(XIM /* im */);
	alias da_XGetIMValues = char* function(XIM /* im */ , ...);
	alias da_XSetIMValues = char* function(XIM /* im */ , ...);
	alias da_XDisplayOfIM = Display* function(XIM /* im */);
	alias da_XLocaleOfIM = char* function(XIM /* im*/);
	alias da_XCreateIC = XIC function(XIM /* im */ , ...);
	alias da_XDestroyIC = void function(XIC /* ic */);
	alias da_XSetICFocus = void function(XIC /* ic */);
	alias da_XUnsetICFocus = void function(XIC /* ic */);
	alias da_XwcResetIC = wchar_t* function(XIC /* ic */);
	alias da_XmbResetIC = char* function(XIC /* ic */);
	alias da_Xutf8ResetIC = char* function(XIC /* ic */);
	alias da_XSetICValues = char* function(XIC /* ic */ , ...);
	alias da_XGetICValues = char* function(XIC /* ic */ , ...);
	alias da_XIMOfIC = XIM function(XIC);
	alias da_XFilterEvent = Bool function(XEvent*, Window);
	alias da_XmbLookupString = int function(XIC, XKeyPressedEvent*, char*, int, KeySym*, Status*);
	alias da_XwcLookupString = int function(XIC, XKeyPressedEvent*, wchar_t*, int, KeySym*, Status*);
	alias da_Xutf8LookupString = int function(XIC, XKeyPressedEvent*, char*, int, KeySym*, Status*);
	alias da_XVaCreateNestedList = XVaNestedList function(int, ...);
	alias da_XRegisterIMInstantiateCallback = Bool function(Display*, XrmHashBucketRec*, char*, char*, XIDProc, XPointer);
	alias da_XUnregisterIMInstantiateCallback = Bool function(Display*, XrmHashBucketRec*, char*, char*, XIDProc, XPointer);
	alias da_XInternalConnectionNumbers = Status function(Display*, int**, int*);
	alias da_XProcessInternalConnection = void function(Display*, int);
	alias da_XAddConnectionWatch = Status function(Display*, XConnectionWatchProc, XPointer);
	alias da_XRemoveConnectionWatch = void function(Display*, XConnectionWatchProc, XPointer);
	alias da_XSetAuthorization = void function(char*, int, char*, int);
	alias da_XGetEventData = Bool function(Display*, XGenericEventCookie*);
	alias da_XFreeEventData = void function(Display*, XGenericEventCookie*);
	alias da_XrmGetStringDatabase = XrmDatabase function(const(char)*);
	alias da_XrmGetResource = Bool function(XrmDatabase, const(char)*, const(char)*, char**, XrmValue*);
	alias da_XrmDestroyDatabase = void function(XrmDatabase);
}
