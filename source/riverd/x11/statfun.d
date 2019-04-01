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

module riverd.x11.statfun;

import riverd.x11.types;
import core.stdc.config;
import core.stdc.stddef;

extern(C) @nogc nothrow {
	XFontStruct *XLoadQueryFont(
		Display*		/* display */,
		const(char)*	/* name */
	);

	XFontStruct *XQueryFont(
		Display*		/* display */,
		XID			/* font_ID */
	);

	XTimeCoord *XGetMotionEvents(
		Display*		/* display */,
		Window		/* w */,
		Time		/* start */,
		Time		/* stop */,
		int*		/* nevents_return */
	);

	version(XlibWidePrototypes) {
		XModifierKeymap *XDeleteModifiermapEntry(
			XModifierKeymap*	/* modmap */,
			uint	/* keycode_entry */,
			int			/* modifier */
		);
	}
	else {
		XModifierKeymap *XDeleteModifiermapEntry(
			XModifierKeymap*	/* modmap */,
			KeyCode		/* keycode_entry */,
			int			/* modifier */
		);
	}

	XModifierKeymap	*XGetModifierMapping(
		Display*		/* display */
	);

	version(XlibWidePrototypes) {
		XModifierKeymap *XInsertModifiermapEntry(
			XModifierKeymap*	/* modmap */,
			uint	/* keycode_entry */,
			int			/* modifier */
		);
	}
	else {
		XModifierKeymap *XInsertModifiermapEntry(
			XModifierKeymap*	/* modmap */,
			KeyCode		/* keycode_entry */,
			int			/* modifier */
		);
	}

	XModifierKeymap *XNewModifiermap(
		int			/* max_keys_per_mod */
	);

	XImage *XCreateImage(
		Display*		/* display */,
		Visual*		/* visual */,
		uint	/* depth */,
		int			/* format */,
		int			/* offset */,
		char*		/* data */,
		uint	/* width */,
		uint	/* height */,
		int			/* bitmap_pad */,
		int			/* bytes_per_line */
	);
	Status XInitImage(
		XImage*		/* image */
	);
	XImage *XGetImage(
		Display*		/* display */,
		Drawable		/* d */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		c_ulong	/* plane_mask */,
		int			/* format */
	);
	XImage *XGetSubImage(
		Display*		/* display */,
		Drawable		/* d */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		c_ulong	/* plane_mask */,
		int			/* format */,
		XImage*		/* dest_image */,
		int			/* dest_x */,
		int			/* dest_y */
	);

	/*
	* X function declarations.
	*/
	Display *XOpenDisplay(
		const(char)*	/* display_name */
	);

	void XrmInitialize();

	char *XFetchBytes(
		Display*		/* display */,
		int*		/* nbytes_return */
	);
	char *XFetchBuffer(
		Display*		/* display */,
		int*		/* nbytes_return */,
		int			/* buffer */
	);
	char *XGetAtomName(
		Display*		/* display */,
		Atom		/* atom */
	);
	Status XGetAtomNames(
		Display*		/* dpy */,
		Atom*		/* atoms */,
		int			/* count */,
		char**		/* names_return */
	);
	char *XGetDefault(
		Display*		/* display */,
		const(char)*	/* program */,
		const(char)*	/* option */
	);
	char *XDisplayName(
		const(char)*	/* string */
	);
	char *XKeysymToString(
		KeySym		/* keysym */
	);

	int function (Display*) XSynchronize (
		Display*		/* display */,
		Bool		/* onoff */
	);
	int function (Display*) XSetAfterFunction(
		Display*		/* display */,
		int function(Display*) proc
	);
	Atom XInternAtom(
		Display*		/* display */,
		const(char)*	/* atom_name */,
		Bool		/* only_if_exists */
	);
	Status XInternAtoms(
		Display*		/* dpy */,
		char**		/* names */,
		int			/* count */,
		Bool		/* onlyIfExists */,
		Atom*		/* atoms_return */
	);
	Colormap XCopyColormapAndFree(
		Display*		/* display */,
		Colormap		/* colormap */
	);
	Colormap XCreateColormap(
		Display*		/* display */,
		Window		/* w */,
		Visual*		/* visual */,
		int			/* alloc */
	);
	Cursor XCreatePixmapCursor(
		Display*		/* display */,
		Pixmap		/* source */,
		Pixmap		/* mask */,
		XColor*		/* foreground_color */,
		XColor*		/* background_color */,
		uint	/* x */,
		uint	/* y */
	);
	Cursor XCreateGlyphCursor(
		Display*		/* display */,
		Font		/* source_font */,
		Font		/* mask_font */,
		uint	/* source_char */,
		uint	/* mask_char */,
		const(XColor)*	/* foreground_color */,
		const(XColor)*	/* background_color */
	);
	Cursor XCreateFontCursor(
		Display*		/* display */,
		uint	/* shape */
	);
	Font XLoadFont(
		Display*		/* display */,
		const(char)*	/* name */
	);
	GC XCreateGC(
		Display*		/* display */,
		Drawable		/* d */,
		c_ulong	/* valuemask */,
		XGCValues*		/* values */
	);
	GContext XGContextFromGC(
		GC			/* gc */
	);
	void XFlushGC(
		Display*		/* display */,
		GC			/* gc */
	);
	Pixmap XCreatePixmap(
		Display*		/* display */,
		Drawable		/* d */,
		uint	/* width */,
		uint	/* height */,
		uint	/* depth */
	);
	Pixmap XCreateBitmapFromData(
		Display*		/* display */,
		Drawable		/* d */,
		const(char)*	/* data */,
		uint	/* width */,
		uint	/* height */
	);
	Pixmap XCreatePixmapFromBitmapData(
		Display*		/* display */,
		Drawable		/* d */,
		char*		/* data */,
		uint	/* width */,
		uint	/* height */,
		c_ulong	/* fg */,
		c_ulong	/* bg */,
		uint	/* depth */
	);
	Window XCreateSimpleWindow(
		Display*		/* display */,
		Window		/* parent */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		uint	/* border_width */,
		c_ulong	/* border */,
		c_ulong	/* background */
	);
	Window XGetSelectionOwner(
		Display*		/* display */,
		Atom		/* selection */
	);
	Window XCreateWindow(
		Display*		/* display */,
		Window		/* parent */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		uint	/* border_width */,
		int			/* depth */,
		uint	/* class */,
		Visual*		/* visual */,
		c_ulong	/* valuemask */,
		XSetWindowAttributes*	/* attributes */
	);
	Colormap *XListInstalledColormaps(
		Display*		/* display */,
		Window		/* w */,
		int*		/* num_return */
	);
	char **XListFonts(
		Display*		/* display */,
		const(char)*	/* pattern */,
		int			/* maxnames */,
		int*		/* actual_count_return */
	);
	char **XListFontsWithInfo(
		Display*		/* display */,
		const(char)*	/* pattern */,
		int			/* maxnames */,
		int*		/* count_return */,
		XFontStruct**	/* info_return */
	);
	char **XGetFontPath(
		Display*		/* display */,
		int*		/* npaths_return */
	);
	char **XListExtensions(
		Display*		/* display */,
		int*		/* nextensions_return */
	);
	Atom *XListProperties(
		Display*		/* display */,
		Window		/* w */,
		int*		/* num_prop_return */
	);
	XHostAddress *XListHosts(
		Display*		/* display */,
		int*		/* nhosts_return */,
		Bool*		/* state_return */
	);
	KeySym XLookupKeysym(
		XKeyEvent*		/* key_event */,
		int			/* index */
	);
	version(XlibWidePrototypes) {
		KeySym *XGetKeyboardMapping(
			Display*		/* display */,
			uint	/* keycode_entry */,
			int			/* keycode_count */,
			int*		/* keysyms_per_keycode_return */
		);
	}
	else {
		KeySym *XGetKeyboardMapping(
			Display*		/* display */,
			KeyCode		/* keycode_entry */,
			int			/* keycode_count */,
			int*		/* keysyms_per_keycode_return */
		);
	}
	KeySym XStringToKeysym(
		const(char)*	/* string */
	);
	c_long XMaxRequestSize(
		Display*		/* display */
	);
	c_long XExtendedMaxRequestSize(
		Display*		/* display */
	);
	char *XResourceManagerString(
		Display*		/* display */
	);
	char *XScreenResourceString(
		Screen*		/* screen */
	);
	c_ulong XDisplayMotionBufferSize(
		Display*		/* display */
	);
	VisualID XVisualIDFromVisual(
		Visual*		/* visual */
	);

	/* multithread routines */

	Status XInitThreads();

	void XLockDisplay(
		Display*		/* display */
	);

	void XUnlockDisplay(
		Display*		/* display */
	);

	/* routines for dealing with extensions */

	XExtCodes *XInitExtension(
		Display*		/* display */,
		const(char)*	/* name */
	);

	XExtCodes *XAddExtension(
		Display*		/* display */
	);
	XExtData *XFindOnExtensionList(
		XExtData**		/* structure */,
		int			/* number */
	);
	XExtData **XEHeadOfExtensionList(
		XEDataObject	/* object */
	);

	/* these are routines for which there are also macros */
	Window XRootWindow(
		Display*		/* display */,
		int			/* screen_number */
	);
	Window XDefaultRootWindow(
		Display*		/* display */
	);
	Window XRootWindowOfScreen(
		Screen*		/* screen */
	);
	Visual *XDefaultVisual(
		Display*		/* display */,
		int			/* screen_number */
	);
	Visual *XDefaultVisualOfScreen(
		Screen*		/* screen */
	);
	GC XDefaultGC(
		Display*		/* display */,
		int			/* screen_number */
	);
	GC XDefaultGCOfScreen(
		Screen*		/* screen */
	);
	c_ulong XBlackPixel(
		Display*		/* display */,
		int			/* screen_number */
	);
	c_ulong XWhitePixel(
		Display*		/* display */,
		int			/* screen_number */
	);
	c_ulong XAllPlanes();
	c_ulong XBlackPixelOfScreen(
		Screen*		/* screen */
	);
	c_ulong XWhitePixelOfScreen(
		Screen*		/* screen */
	);
	c_ulong XNextRequest(
		Display*		/* display */
	);
	c_ulong XLastKnownRequestProcessed(
		Display*		/* display */
	);
	char *XServerVendor(
		Display*		/* display */
	);
	char *XDisplayString(
		Display*		/* display */
	);
	Colormap XDefaultColormap(
		Display*		/* display */,
		int			/* screen_number */
	);
	Colormap XDefaultColormapOfScreen(
		Screen*		/* screen */
	);
	Display *XDisplayOfScreen(
		Screen*		/* screen */
	);
	Screen *XScreenOfDisplay(
		Display*		/* display */,
		int			/* screen_number */
	);
	Screen *XDefaultScreenOfDisplay(
		Display*		/* display */
	);
	c_long XEventMaskOfScreen(
		Screen*		/* screen */
	);

	int XScreenNumberOfScreen(
		Screen*		/* screen */
	);

	XErrorHandler XSetErrorHandler (
		XErrorHandler	/* handler */
	);

	XIOErrorHandler XSetIOErrorHandler (
		XIOErrorHandler	/* handler */
	);


	XPixmapFormatValues *XListPixmapFormats(
		Display*		/* display */,
		int*		/* count_return */
	);
	int *XListDepths(
		Display*		/* display */,
		int			/* screen_number */,
		int*		/* count_return */
	);

	/* ICCCM routines for things that don't require special include files; */
	/* other declarations are given in Xutil.h                             */
	Status XReconfigureWMWindow(
		Display*		/* display */,
		Window		/* w */,
		int			/* screen_number */,
		uint	/* mask */,
		XWindowChanges*	/* changes */
	);

	Status XGetWMProtocols(
		Display*		/* display */,
		Window		/* w */,
		Atom**		/* protocols_return */,
		int*		/* count_return */
	);
	Status XSetWMProtocols(
		Display*		/* display */,
		Window		/* w */,
		Atom*		/* protocols */,
		int			/* count */
	);
	Status XIconifyWindow(
		Display*		/* display */,
		Window		/* w */,
		int			/* screen_number */
	);
	Status XWithdrawWindow(
		Display*		/* display */,
		Window		/* w */,
		int			/* screen_number */
	);
	Status XGetCommand(
		Display*		/* display */,
		Window		/* w */,
		char***		/* argv_return */,
		int*		/* argc_return */
	);
	Status XGetWMColormapWindows(
		Display*		/* display */,
		Window		/* w */,
		Window**		/* windows_return */,
		int*		/* count_return */
	);
	Status XSetWMColormapWindows(
		Display*		/* display */,
		Window		/* w */,
		Window*		/* colormap_windows */,
		int			/* count */
	);
	void XFreeStringList(
		char**		/* list */
	);
	int XSetTransientForHint(
		Display*		/* display */,
		Window		/* w */,
		Window		/* prop_window */
	);

	/* The following are given in alphabetical order */

	int XActivateScreenSaver(
		Display*		/* display */
	);

	int XAddHost(
		Display*		/* display */,
		XHostAddress*	/* host */
	);

	int XAddHosts(
		Display*		/* display */,
		XHostAddress*	/* hosts */,
		int			/* num_hosts */
	);

	int XAddToExtensionList(
		XExtData**	/* structure */,
		XExtData*		/* ext_data */
	);

	int XAddToSaveSet(
		Display*		/* display */,
		Window		/* w */
	);

	Status XAllocColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		XColor*		/* screen_in_out */
	);

	Status XAllocColorCells(
		Display*		/* display */,
		Colormap		/* colormap */,
		Bool	        /* contig */,
		c_ulong*	/* plane_masks_return */,
		uint	/* nplanes */,
		c_ulong*	/* pixels_return */,
		uint 	/* npixels */
	);

	Status XAllocColorPlanes(
		Display*		/* display */,
		Colormap		/* colormap */,
		Bool		/* contig */,
		c_ulong*	/* pixels_return */,
		int			/* ncolors */,
		int			/* nreds */,
		int			/* ngreens */,
		int			/* nblues */,
		c_ulong*	/* rmask_return */,
		c_ulong*	/* gmask_return */,
		c_ulong*	/* bmask_return */
	);

	Status XAllocNamedColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		const(char)*	/* color_name */,
		XColor*		/* screen_def_return */,
		XColor*		/* exact_def_return */
	);

	int XAllowEvents(
		Display*		/* display */,
		int			/* event_mode */,
		Time		/* time */
	);

	int XAutoRepeatOff(
		Display*		/* display */
	);

	int XAutoRepeatOn(
		Display*		/* display */
	);

	int XBell(
		Display*		/* display */,
		int			/* percent */
	);

	int XBitmapBitOrder(
		Display*		/* display */
	);

	int XBitmapPad(
		Display*		/* display */
	);

	int XBitmapUnit(
		Display*		/* display */
	);

	int XCellsOfScreen(
		Screen*		/* screen */
	);

	int XChangeActivePointerGrab(
		Display*		/* display */,
		uint	/* event_mask */,
		Cursor		/* cursor */,
		Time		/* time */
	);

	int XChangeGC(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong	/* valuemask */,
		XGCValues*		/* values */
	);

	int XChangeKeyboardControl(
		Display*		/* display */,
		c_ulong	/* value_mask */,
		XKeyboardControl*	/* values */
	);

	int XChangeKeyboardMapping(
		Display*		/* display */,
		int			/* first_keycode */,
		int			/* keysyms_per_keycode */,
		KeySym*		/* keysyms */,
		int			/* num_codes */
	);

	int XChangePointerControl(
		Display*		/* display */,
		Bool		/* do_accel */,
		Bool		/* do_threshold */,
		int			/* accel_numerator */,
		int			/* accel_denominator */,
		int			/* threshold */
	);

	int XChangeProperty(
		Display*		/* display */,
		Window		/* w */,
		Atom		/* property */,
		Atom		/* type */,
		int			/* format */,
		int			/* mode */,
		const(ubyte)*	/* data */,
		int			/* nelements */
	);

	int XChangeSaveSet(
		Display*		/* display */,
		Window		/* w */,
		int			/* change_mode */
	);

	int XChangeWindowAttributes(
		Display*		/* display */,
		Window		/* w */,
		c_ulong	/* valuemask */,
		XSetWindowAttributes* /* attributes */
	);

	Bool XCheckIfEvent(
		Display*		/* display */,
		XEvent*		/* event_return */,
		Bool function (Display*, XEvent*, XPointer) /* predicate */,
		XPointer		/* arg */
	);

	Bool XCheckMaskEvent(
		Display*		/* display */,
		c_long		/* event_mask */,
		XEvent*		/* event_return */
	);

	Bool XCheckTypedEvent(
		Display*		/* display */,
		int			/* event_type */,
		XEvent*		/* event_return */
	);

	Bool XCheckTypedWindowEvent(
		Display*		/* display */,
		Window		/* w */,
		int			/* event_type */,
		XEvent*		/* event_return */
	);

	Bool XCheckWindowEvent(
		Display*		/* display */,
		Window		/* w */,
		c_long		/* event_mask */,
		XEvent*		/* event_return */
	);

	int XCirculateSubwindows(
		Display*		/* display */,
		Window		/* w */,
		int			/* direction */
	);

	int XCirculateSubwindowsDown(
		Display*		/* display */,
		Window		/* w */
	);

	int XCirculateSubwindowsUp(
		Display*		/* display */,
		Window		/* w */
	);

	int XClearArea(
		Display*		/* display */,
		Window		/* w */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		Bool		/* exposures */
	);

	int XClearWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XCloseDisplay(
		Display*		/* display */
	);

	int XConfigureWindow(
		Display*		/* display */,
		Window		/* w */,
		uint	/* value_mask */,
		XWindowChanges*	/* values */
	);

	int XConnectionNumber(
		Display*		/* display */
	);

	int XConvertSelection(
		Display*		/* display */,
		Atom		/* selection */,
		Atom 		/* target */,
		Atom		/* property */,
		Window		/* requestor */,
		Time		/* time */
	);

	int XCopyArea(
		Display*		/* display */,
		Drawable		/* src */,
		Drawable		/* dest */,
		GC			/* gc */,
		int			/* src_x */,
		int			/* src_y */,
		uint	/* width */,
		uint	/* height */,
		int			/* dest_x */,
		int			/* dest_y */
	);

	int XCopyGC(
		Display*		/* display */,
		GC			/* src */,
		c_ulong	/* valuemask */,
		GC			/* dest */
	);

	int XCopyPlane(
		Display*		/* display */,
		Drawable		/* src */,
		Drawable		/* dest */,
		GC			/* gc */,
		int			/* src_x */,
		int			/* src_y */,
		uint	/* width */,
		uint	/* height */,
		int			/* dest_x */,
		int			/* dest_y */,
		c_ulong	/* plane */
	);

	int XDefaultDepth(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDefaultDepthOfScreen(
		Screen*		/* screen */
	);

	int XDefaultScreen(
		Display*		/* display */
	);

	int XDefineCursor(
		Display*		/* display */,
		Window		/* w */,
		Cursor		/* cursor */
	);

	int XDeleteProperty(
		Display*		/* display */,
		Window		/* w */,
		Atom		/* property */
	);

	int XDestroyWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XDestroySubwindows(
		Display*		/* display */,
		Window		/* w */
	);

	int XDoesBackingStore(
		Screen*		/* screen */
	);

	Bool XDoesSaveUnders(
		Screen*		/* screen */
	);

	int XDisableAccessControl(
		Display*		/* display */
	);


	int XDisplayCells(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDisplayHeight(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDisplayHeightMM(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDisplayKeycodes(
		Display*		/* display */,
		int*		/* min_keycodes_return */,
		int*		/* max_keycodes_return */
	);

	int XDisplayPlanes(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDisplayWidth(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDisplayWidthMM(
		Display*		/* display */,
		int			/* screen_number */
	);

	int XDrawArc(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		int			/* angle1 */,
		int			/* angle2 */
	);

	int XDrawArcs(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XArc*		/* arcs */,
		int			/* narcs */
	);

	int XDrawImageString(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* string */,
		int			/* length */
	);

	int XDrawImageString16(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const XChar2b*	/* string */,
		int			/* length */
	);

	int XDrawLine(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x1 */,
		int			/* y1 */,
		int			/* x2 */,
		int			/* y2 */
	);

	int XDrawLines(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XPoint*		/* points */,
		int			/* npoints */,
		int			/* mode */
	);

	int XDrawPoint(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */
	);

	int XDrawPoints(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XPoint*		/* points */,
		int			/* npoints */,
		int			/* mode */
	);

	int XDrawRectangle(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */
	);

	int XDrawRectangles(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XRectangle*		/* rectangles */,
		int			/* nrectangles */
	);

	int XDrawSegments(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XSegment*		/* segments */,
		int			/* nsegments */
	);

	int XDrawString(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* string */,
		int			/* length */
	);

	int XDrawString16(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const XChar2b*	/* string */,
		int			/* length */
	);

	int XDrawText(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		XTextItem*		/* items */,
		int			/* nitems */
	);

	int XDrawText16(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		XTextItem16*	/* items */,
		int			/* nitems */
	);

	int XEnableAccessControl(
		Display*		/* display */
	);

	int XEventsQueued(
		Display*		/* display */,
		int			/* mode */
	);

	Status XFetchName(
		Display*		/* display */,
		Window		/* w */,
		char**		/* window_name_return */
	);

	int XFillArc(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */,
		int			/* angle1 */,
		int			/* angle2 */
	);

	int XFillArcs(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XArc*		/* arcs */,
		int			/* narcs */
	);

	int XFillPolygon(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XPoint*		/* points */,
		int			/* npoints */,
		int			/* shape */,
		int			/* mode */
	);

	int XFillRectangle(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */
	);

	int XFillRectangles(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XRectangle*		/* rectangles */,
		int			/* nrectangles */
	);

	int XFlush(
		Display*		/* display */
	);

	int XForceScreenSaver(
		Display*		/* display */,
		int			/* mode */
	);

	int XFree(
		void*		/* data */
	);

	int XFreeColormap(
		Display*		/* display */,
		Colormap		/* colormap */
	);

	int XFreeColors(
		Display*		/* display */,
		Colormap		/* colormap */,
		c_ulong*	/* pixels */,
		int			/* npixels */,
		c_ulong	/* planes */
	);

	int XFreeCursor(
		Display*		/* display */,
		Cursor		/* cursor */
	);

	int XFreeExtensionList(
		char**		/* list */
	);

	int XFreeFont(
		Display*		/* display */,
		XFontStruct*	/* font_struct */
	);

	int XFreeFontInfo(
		char**		/* names */,
		XFontStruct*	/* free_info */,
		int			/* actual_count */
	);

	int XFreeFontNames(
		char**		/* list */
	);

	int XFreeFontPath(
		char**		/* list */
	);

	int XFreeGC(
		Display*		/* display */,
		GC			/* gc */
	);

	int XFreeModifiermap(
		XModifierKeymap*	/* modmap */
	);

	int XFreePixmap(
		Display*		/* display */,
		Pixmap		/* pixmap */
	);

	int XGeometry(
		Display*		/* display */,
		int			/* screen */,
		const(char)*	/* position */,
		const(char)*	/* default_position */,
		uint	/* bwidth */,
		uint	/* fwidth */,
		uint	/* fheight */,
		int			/* xadder */,
		int			/* yadder */,
		int*		/* x_return */,
		int*		/* y_return */,
		int*		/* width_return */,
		int*		/* height_return */
	);

	int XGetErrorDatabaseText(
		Display*		/* display */,
		const(char)*	/* name */,
		const(char)*	/* message */,
		const(char)*	/* default_string */,
		char*		/* buffer_return */,
		int			/* length */
	);

	int XGetErrorText(
		Display*		/* display */,
		int			/* code */,
		char*		/* buffer_return */,
		int			/* length */
	);

	Bool XGetFontProperty(
		XFontStruct*	/* font_struct */,
		Atom		/* atom */,
		c_ulong*	/* value_return */
	);

	Status XGetGCValues(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong	/* valuemask */,
		XGCValues*		/* values_return */
	);

	Status XGetGeometry(
		Display*		/* display */,
		Drawable		/* d */,
		Window*		/* root_return */,
		int*		/* x_return */,
		int*		/* y_return */,
		uint*	/* width_return */,
		uint*	/* height_return */,
		uint*	/* border_width_return */,
		uint*	/* depth_return */
	);

	Status XGetIconName(
		Display*		/* display */,
		Window		/* w */,
		char**		/* icon_name_return */
	);

	int XGetInputFocus(
		Display*		/* display */,
		Window*		/* focus_return */,
		int*		/* revert_to_return */
	);

	int XGetKeyboardControl(
		Display*		/* display */,
		XKeyboardState*	/* values_return */
	);

	int XGetPointerControl(
		Display*		/* display */,
		int*		/* accel_numerator_return */,
		int*		/* accel_denominator_return */,
		int*		/* threshold_return */
	);

	int XGetPointerMapping(
		Display*		/* display */,
		ubyte*	/* map_return */,
		int			/* nmap */
	);

	int XGetScreenSaver(
		Display*		/* display */,
		int*		/* timeout_return */,
		int*		/* interval_return */,
		int*		/* prefer_blanking_return */,
		int*		/* allow_exposures_return */
	);

	Status XGetTransientForHint(
		Display*		/* display */,
		Window		/* w */,
		Window*		/* prop_window_return */
	);

	int XGetWindowProperty(
		Display*		/* display */,
		Window		/* w */,
		Atom		/* property */,
		c_long		/* c_long_offset */,
		c_long		/* c_long_length */,
		Bool		/* delete */,
		Atom		/* req_type */,
		Atom*		/* actual_type_return */,
		int*		/* actual_format_return */,
		c_ulong*	/* nitems_return */,
		c_ulong*	/* bytes_after_return */,
		ubyte**	/* prop_return */
	);

	Status XGetWindowAttributes(
		Display*		/* display */,
		Window		/* w */,
		XWindowAttributes*	/* window_attributes_return */
	);

	int XGrabButton(
		Display*		/* display */,
		uint	/* button */,
		uint	/* modifiers */,
		Window		/* grab_window */,
		Bool		/* owner_events */,
		uint	/* event_mask */,
		int			/* pointer_mode */,
		int			/* keyboard_mode */,
		Window		/* confine_to */,
		Cursor		/* cursor */
	);

	int XGrabKey(
		Display*		/* display */,
		int			/* keycode */,
		uint	/* modifiers */,
		Window		/* grab_window */,
		Bool		/* owner_events */,
		int			/* pointer_mode */,
		int			/* keyboard_mode */
	);

	int XGrabKeyboard(
		Display*		/* display */,
		Window		/* grab_window */,
		Bool		/* owner_events */,
		int			/* pointer_mode */,
		int			/* keyboard_mode */,
		Time		/* time */
	);

	int XGrabPointer(
		Display*		/* display */,
		Window		/* grab_window */,
		Bool		/* owner_events */,
		uint	/* event_mask */,
		int			/* pointer_mode */,
		int			/* keyboard_mode */,
		Window		/* confine_to */,
		Cursor		/* cursor */,
		Time		/* time */
	);

	int XGrabServer(
		Display*		/* display */
	);

	int XHeightMMOfScreen(
		Screen*		/* screen */
	);

	int XHeightOfScreen(
		Screen*		/* screen */
	);

	int XIfEvent(
		Display*		/* display */,
		XEvent*		/* event_return */,
		Bool function (
			Display*			/* display */,
				XEvent*			/* event */,
				XPointer			/* arg */
				)		/* predicate */,
		XPointer		/* arg */
	);

	int XImageByteOrder(
		Display*		/* display */
	);

	int XInstallColormap(
		Display*		/* display */,
		Colormap		/* colormap */
	);

	KeyCode XKeysymToKeycode(
		Display*		/* display */,
		KeySym		/* keysym */
	);

	int XKillClient(
		Display*		/* display */,
		XID			/* resource */
	);

	Status XLookupColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		const(char)*	/* color_name */,
		XColor*		/* exact_def_return */,
		XColor*		/* screen_def_return */
	);

	int XLowerWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XMapRaised(
		Display*		/* display */,
		Window		/* w */
	);

	int XMapSubwindows(
		Display*		/* display */,
		Window		/* w */
	);

	int XMapWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XMaskEvent(
		Display*		/* display */,
		c_long		/* event_mask */,
		XEvent*		/* event_return */
	);

	int XMaxCmapsOfScreen(
		Screen*		/* screen */
	);

	int XMinCmapsOfScreen(
		Screen*		/* screen */
	);

	int XMoveResizeWindow(
		Display*		/* display */,
		Window		/* w */,
		int			/* x */,
		int			/* y */,
		uint	/* width */,
		uint	/* height */
	);

	int XMoveWindow(
		Display*		/* display */,
		Window		/* w */,
		int			/* x */,
		int			/* y */
	);

	int XNextEvent(
		Display*		/* display */,
		XEvent*		/* event_return */
	);

	int XNoOp(
		Display*		/* display */
	);

	Status XParseColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		const(char)*	/* spec */,
		XColor*		/* exact_def_return */
	);

	int XParseGeometry(
		const(char)*	/* parsestring */,
		int*		/* x_return */,
		int*		/* y_return */,
		uint*	/* width_return */,
		uint*	/* height_return */
	);

	int XPeekEvent(
		Display*		/* display */,
		XEvent*		/* event_return */
	);

	int XPeekIfEvent(
		Display*		/* display */,
		XEvent*		/* event_return */,
		Bool function (
			Display*		/* display */,
				XEvent*		/* event */,
				XPointer		/* arg */
				)		/* predicate */,
		XPointer		/* arg */
	);

	int XPending(
		Display*		/* display */
	);

	int XPlanesOfScreen(
		Screen*		/* screen */
	);

	int XProtocolRevision(
		Display*		/* display */
	);

	int XProtocolVersion(
		Display*		/* display */
	);


	int XPutBackEvent(
		Display*		/* display */,
		XEvent*		/* event */
	);

	int XPutImage(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		XImage*		/* image */,
		int			/* src_x */,
		int			/* src_y */,
		int			/* dest_x */,
		int			/* dest_y */,
		uint	/* width */,
		uint	/* height */
	);

	int XQLength(
		Display*		/* display */
	);

	Status XQueryBestCursor(
		Display*		/* display */,
		Drawable		/* d */,
		uint        /* width */,
		uint	/* height */,
		uint*	/* width_return */,
		uint*	/* height_return */
	);

	Status XQueryBestSize(
		Display*		/* display */,
		int			/* class */,
		Drawable		/* which_screen */,
		uint	/* width */,
		uint	/* height */,
		uint*	/* width_return */,
		uint*	/* height_return */
	);

	Status XQueryBestStipple(
		Display*		/* display */,
		Drawable		/* which_screen */,
		uint	/* width */,
		uint	/* height */,
		uint*	/* width_return */,
		uint*	/* height_return */
	);

	Status XQueryBestTile(
		Display*		/* display */,
		Drawable		/* which_screen */,
		uint	/* width */,
		uint	/* height */,
		uint*	/* width_return */,
		uint*	/* height_return */
	);

	int XQueryColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		XColor*		/* def_in_out */
	);

	int XQueryColors(
		Display*		/* display */,
		Colormap		/* colormap */,
		XColor*		/* defs_in_out */,
		int			/* ncolors */
	);

	Bool XQueryExtension(
		Display*		/* display */,
		const(char)*	/* name */,
		int*		/* major_opcode_return */,
		int*		/* first_event_return */,
		int*		/* first_error_return */
	);

	int XQueryKeymap(
		Display*		/* display */,
		char [32]		/* keys_return */
	);

	Bool XQueryPointer(
		Display*		/* display */,
		Window		/* w */,
		Window*		/* root_return */,
		Window*		/* child_return */,
		int*		/* root_x_return */,
		int*		/* root_y_return */,
		int*		/* win_x_return */,
		int*		/* win_y_return */,
		uint*       /* mask_return */
	);

	int XQueryTextExtents(
		Display*		/* display */,
		XID			/* font_ID */,
		const(char)*	/* string */,
		int			/* nchars */,
		int*		/* direction_return */,
		int*		/* font_ascent_return */,
		int*		/* font_descent_return */,
		XCharStruct*	/* overall_return */
	);

	int XQueryTextExtents16(
		Display*		/* display */,
		XID			/* font_ID */,
		const XChar2b*	/* string */,
		int			/* nchars */,
		int*		/* direction_return */,
		int*		/* font_ascent_return */,
		int*		/* font_descent_return */,
		XCharStruct*	/* overall_return */
	);

	Status XQueryTree(
		Display*		/* display */,
		Window		/* w */,
		Window*		/* root_return */,
		Window*		/* parent_return */,
		Window**		/* children_return */,
		uint*	/* nchildren_return */
	);

	int XRaiseWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XReadBitmapFile(
		Display*		/* display */,
		Drawable 		/* d */,
		const(char)*	/* filename */,
		uint*	/* width_return */,
		uint*	/* height_return */,
		Pixmap*		/* bitmap_return */,
		int*		/* x_hot_return */,
		int*		/* y_hot_return */
	);

	int XReadBitmapFileData(
		const(char)*	/* filename */,
		uint*	/* width_return */,
		uint*	/* height_return */,
		ubyte**	/* data_return */,
		int*		/* x_hot_return */,
		int*		/* y_hot_return */
	);

	int XRebindKeysym(
		Display*		/* display */,
		KeySym		/* keysym */,
		KeySym*		/* list */,
		int			/* mod_count */,
		const(ubyte)*	/* string */,
		int			/* bytes_string */
	);

	int XRecolorCursor(
		Display*		/* display */,
		Cursor		/* cursor */,
		XColor*		/* foreground_color */,
		XColor*		/* background_color */
	);

	int XRefreshKeyboardMapping(
		XMappingEvent*	/* event_map */
	);

	int XRemoveFromSaveSet(
		Display*		/* display */,
		Window		/* w */
	);

	int XRemoveHost(
		Display*		/* display */,
		XHostAddress*	/* host */
	);

	int XRemoveHosts(
		Display*		/* display */,
		XHostAddress*	/* hosts */,
		int			/* num_hosts */
	);

	int XReparentWindow(
		Display*		/* display */,
		Window		/* w */,
		Window		/* parent */,
		int			/* x */,
		int			/* y */
	);

	int XResetScreenSaver(
		Display*		/* display */
	);

	int XResizeWindow(
		Display*		/* display */,
		Window		/* w */,
		uint	/* width */,
		uint	/* height */
	);

	int XRestackWindows(
		Display*		/* display */,
		Window*		/* windows */,
		int			/* nwindows */
	);

	int XRotateBuffers(
		Display*		/* display */,
		int			/* rotate */
	);

	int XRotateWindowProperties(
		Display*		/* display */,
		Window		/* w */,
		Atom*		/* properties */,
		int			/* num_prop */,
		int			/* npositions */
	);

	int XScreenCount(
		Display*		/* display */
	);

	int XSelectInput(
		Display*		/* display */,
		Window		/* w */,
		c_long		/* event_mask */
	);

	Status XSendEvent(
		Display*		/* display */,
		Window		/* w */,
		Bool		/* propagate */,
		c_long		/* event_mask */,
		XEvent*		/* event_send */
	);

	int XSetAccessControl(
		Display*		/* display */,
		int			/* mode */
	);

	int XSetArcMode(
		Display*		/* display */,
		GC			/* gc */,
		int			/* arc_mode */
	);

	int XSetBackground(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong	/* background */
	);

	int XSetClipMask(
		Display*		/* display */,
		GC			/* gc */,
		Pixmap		/* pixmap */
	);

	int XSetClipOrigin(
		Display*		/* display */,
		GC			/* gc */,
		int			/* clip_x_origin */,
		int			/* clip_y_origin */
	);

	int XSetClipRectangles(
		Display*		/* display */,
		GC			/* gc */,
		int			/* clip_x_origin */,
		int			/* clip_y_origin */,
		XRectangle*		/* rectangles */,
		int			/* n */,
		int			/* ordering */
	);

	int XSetCloseDownMode(
		Display*		/* display */,
		int			/* close_mode */
	);

	int XSetCommand(
		Display*		/* display */,
		Window		/* w */,
		char**		/* argv */,
		int			/* argc */
	);

	int XSetDashes(
		Display*		/* display */,
		GC			/* gc */,
		int			/* dash_offset */,
		const(char)*	/* dash_list */,
		int			/* n */
	);

	int XSetFillRule(
		Display*		/* display */,
		GC			/* gc */,
		int			/* fill_rule */
	);

	int XSetFillStyle(
		Display*		/* display */,
		GC			/* gc */,
		int			/* fill_style */
	);

	int XSetFont(
		Display*		/* display */,
		GC			/* gc */,
		Font		/* font */
	);

	int XSetFontPath(
		Display*		/* display */,
		char**		/* directories */,
		int			/* ndirs */
	);

	int XSetForeground(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong	/* foreground */
	);

	int XSetFunction(
		Display*		/* display */,
		GC			/* gc */,
		int			/* function */
	);

	int XSetGraphicsExposures(
		Display*		/* display */,
		GC			/* gc */,
		Bool		/* graphics_exposures */
	);

	int XSetIconName(
		Display*		/* display */,
		Window		/* w */,
		const(char)*	/* icon_name */
	);

	int XSetInputFocus(
		Display*		/* display */,
		Window		/* focus */,
		int			/* revert_to */,
		Time		/* time */
	);

	int XSetLineAttributes(
		Display*		/* display */,
		GC			/* gc */,
		uint	/* line_width */,
		int			/* line_style */,
		int			/* cap_style */,
		int			/* join_style */
	);

	int XSetModifierMapping(
		Display*		/* display */,
		XModifierKeymap*	/* modmap */
	);

	int XSetPlaneMask(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong	/* plane_mask */
	);

	int XSetPointerMapping(
		Display*		/* display */,
		const(ubyte)*	/* map */,
		int			/* nmap */
	);

	int XSetScreenSaver(
		Display*		/* display */,
		int			/* timeout */,
		int			/* interval */,
		int			/* prefer_blanking */,
		int			/* allow_exposures */
	);

	int XSetSelectionOwner(
		Display*		/* display */,
		Atom	        /* selection */,
		Window		/* owner */,
		Time		/* time */
	);

	int XSetState(
		Display*		/* display */,
		GC			/* gc */,
		c_ulong 	/* foreground */,
		c_ulong	/* background */,
		int			/* function */,
		c_ulong	/* plane_mask */
	);

	int XSetStipple(
		Display*		/* display */,
		GC			/* gc */,
		Pixmap		/* stipple */
	);

	int XSetSubwindowMode(
		Display*		/* display */,
		GC			/* gc */,
		int			/* subwindow_mode */
	);

	int XSetTSOrigin(
		Display*		/* display */,
		GC			/* gc */,
		int			/* ts_x_origin */,
		int			/* ts_y_origin */
	);

	int XSetTile(
		Display*		/* display */,
		GC			/* gc */,
		Pixmap		/* tile */
	);

	int XSetWindowBackground(
		Display*		/* display */,
		Window		/* w */,
		c_ulong	/* background_pixel */
	);

	int XSetWindowBackgroundPixmap(
		Display*		/* display */,
		Window		/* w */,
		Pixmap		/* background_pixmap */
	);

	int XSetWindowBorder(
		Display*		/* display */,
		Window		/* w */,
		c_ulong	/* border_pixel */
	);

	int XSetWindowBorderPixmap(
		Display*		/* display */,
		Window		/* w */,
		Pixmap		/* border_pixmap */
	);

	int XSetWindowBorderWidth(
		Display*		/* display */,
		Window		/* w */,
		uint	/* width */
	);

	int XSetWindowColormap(
		Display*		/* display */,
		Window		/* w */,
		Colormap		/* colormap */
	);

	int XStoreBuffer(
		Display*		/* display */,
		const(char)*	/* bytes */,
		int			/* nbytes */,
		int			/* buffer */
	);

	int XStoreBytes(
		Display*		/* display */,
		const(char)*	/* bytes */,
		int			/* nbytes */
	);

	int XStoreColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		XColor*		/* color */
	);

	int XStoreColors(
		Display*		/* display */,
		Colormap		/* colormap */,
		XColor*		/* color */,
		int			/* ncolors */
	);

	int XStoreName(
		Display*		/* display */,
		Window		/* w */,
		const(char)*	/* window_name */
	);

	int XStoreNamedColor(
		Display*		/* display */,
		Colormap		/* colormap */,
		const(char)*	/* color */,
		c_ulong	/* pixel */,
		int			/* flags */
	);

	int XSync(
		Display*		/* display */,
		Bool		/* discard */
	);

	int XTextExtents(
		XFontStruct*	/* font_struct */,
		const(char)*	/* string */,
		int			/* nchars */,
		int*		/* direction_return */,
		int*		/* font_ascent_return */,
		int*		/* font_descent_return */,
		XCharStruct*	/* overall_return */
	);

	int XTextExtents16(
		XFontStruct*	/* font_struct */,
		const XChar2b*	/* string */,
		int			/* nchars */,
		int*		/* direction_return */,
		int*		/* font_ascent_return */,
		int*		/* font_descent_return */,
		XCharStruct*	/* overall_return */
	);

	int XTextWidth(
		XFontStruct*	/* font_struct */,
		const(char)*	/* string */,
		int			/* count */
	);

	int XTextWidth16(
		XFontStruct*	/* font_struct */,
		const XChar2b*	/* string */,
		int			/* count */
	);

	Bool XTranslateCoordinates(
		Display*		/* display */,
		Window		/* src_w */,
		Window		/* dest_w */,
		int			/* src_x */,
		int			/* src_y */,
		int*		/* dest_x_return */,
		int*		/* dest_y_return */,
		Window*		/* child_return */
	);

	int XUndefineCursor(
		Display*		/* display */,
		Window		/* w */
	);

	int XUngrabButton(
		Display*		/* display */,
		uint	/* button */,
		uint	/* modifiers */,
		Window		/* grab_window */
	);

	int XUngrabKey(
		Display*		/* display */,
		int			/* keycode */,
		uint	/* modifiers */,
		Window		/* grab_window */
	);

	int XUngrabKeyboard(
		Display*		/* display */,
		Time		/* time */
	);

	int XUngrabPointer(
		Display*		/* display */,
		Time		/* time */
	);

	int XUngrabServer(
		Display*		/* display */
	);

	int XUninstallColormap(
		Display*		/* display */,
		Colormap		/* colormap */
	);

	int XUnloadFont(
		Display*		/* display */,
		Font		/* font */
	);

	int XUnmapSubwindows(
		Display*		/* display */,
		Window		/* w */
	);

	int XUnmapWindow(
		Display*		/* display */,
		Window		/* w */
	);

	int XVendorRelease(
		Display*		/* display */
	);

	int XWarpPointer(
		Display*		/* display */,
		Window		/* src_w */,
		Window		/* dest_w */,
		int			/* src_x */,
		int			/* src_y */,
		uint	/* src_width */,
		uint	/* src_height */,
		int			/* dest_x */,
		int			/* dest_y */
	);

	int XWidthMMOfScreen(
		Screen*		/* screen */
	);

	int XWidthOfScreen(
		Screen*		/* screen */
	);

	int XWindowEvent(
		Display*		/* display */,
		Window		/* w */,
		c_long		/* event_mask */,
		XEvent*		/* event_return */
	);

	int XWriteBitmapFile(
		Display*		/* display */,
		const(char)*	/* filename */,
		Pixmap		/* bitmap */,
		uint	/* width */,
		uint	/* height */,
		int			/* x_hot */,
		int			/* y_hot */
	);

	Bool XSupportsLocale ();

	char *XSetLocaleModifiers(
		const(char)*		/* modifier_list */
	);

	XOM XOpenOM(
		Display*			/* display */,
		XrmHashBucketRec*	/* rdb */,
		const(char)*		/* res_name */,
		const(char)*		/* res_class */
	);

	Status XCloseOM(
		XOM			/* om */
	);

	char *XSetOMValues(
		XOM			/* om */,
		...
	);

	char *XGetOMValues(
		XOM			/* om */,
		...
	);

	Display *XDisplayOfOM(
		XOM			/* om */
	);

	char *XLocaleOfOM(
		XOM			/* om */
	);

	XOC XCreateOC(
		XOM			/* om */,
		...
	);

	void XDestroyOC(
		XOC			/* oc */
	);

	XOM XOMOfOC(
		XOC			/* oc */
	);

	char *XSetOCValues(
		XOC			/* oc */,
		...
	);

	char *XGetOCValues(
		XOC			/* oc */,
		...
	);

	XFontSet XCreateFontSet(
		Display*		/* display */,
		const(char)*	/* base_font_name_list */,
		char***		/* missing_charset_list */,
		int*		/* missing_charset_count */,
		char**		/* def_string */
	);

	void XFreeFontSet(
		Display*		/* display */,
		XFontSet		/* font_set */
	);

	int XFontsOfFontSet(
		XFontSet		/* font_set */,
		XFontStruct***	/* font_struct_list */,
		char***		/* font_name_list */
	);

	char *XBaseFontNameListOfFontSet(
		XFontSet		/* font_set */
	);

	char *XLocaleOfFontSet(
		XFontSet		/* font_set */
	);

	Bool XContextDependentDrawing(
		XFontSet		/* font_set */
	);

	Bool XDirectionalDependentDrawing(
		XFontSet		/* font_set */
	);

	Bool XContextualDrawing(
		XFontSet		/* font_set */
	);

	XFontSetExtents *XExtentsOfFontSet(
		XFontSet		/* font_set */
	);

	int XmbTextEscapement(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	int XwcTextEscapement(
		XFontSet		/* font_set */,
		const wchar_t*	/* text */,
		int			/* num_wchars */
	);

	int Xutf8TextEscapement(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	int XmbTextExtents(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	int XwcTextExtents(
		XFontSet		/* font_set */,
		const wchar_t*	/* text */,
		int			/* num_wchars */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	int Xutf8TextExtents(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	Status XmbTextPerCharExtents(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */,
		XRectangle*		/* ink_extents_buffer */,
		XRectangle*		/* logical_extents_buffer */,
		int			/* buffer_size */,
		int*		/* num_chars */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	Status XwcTextPerCharExtents(
		XFontSet		/* font_set */,
		const wchar_t*	/* text */,
		int			/* num_wchars */,
		XRectangle*		/* ink_extents_buffer */,
		XRectangle*		/* logical_extents_buffer */,
		int			/* buffer_size */,
		int*		/* num_chars */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	Status Xutf8TextPerCharExtents(
		XFontSet		/* font_set */,
		const(char)*	/* text */,
		int			/* bytes_text */,
		XRectangle*		/* ink_extents_buffer */,
		XRectangle*		/* logical_extents_buffer */,
		int			/* buffer_size */,
		int*		/* num_chars */,
		XRectangle*		/* overall_ink_return */,
		XRectangle*		/* overall_logical_return */
	);

	void XmbDrawText(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		XmbTextItem*	/* text_items */,
		int			/* nitems */
	);

	void XwcDrawText(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		XwcTextItem*	/* text_items */,
		int			/* nitems */
	);

	void Xutf8DrawText(
		Display*		/* display */,
		Drawable		/* d */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		XmbTextItem*	/* text_items */,
		int			/* nitems */
	);

	void XmbDrawString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	void XwcDrawString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const wchar_t*	/* text */,
		int			/* num_wchars */
	);

	void Xutf8DrawString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	void XmbDrawImageString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	void XwcDrawImageString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const wchar_t*	/* text */,
		int			/* num_wchars */
	);

	void Xutf8DrawImageString(
		Display*		/* display */,
		Drawable		/* d */,
		XFontSet		/* font_set */,
		GC			/* gc */,
		int			/* x */,
		int			/* y */,
		const(char)*	/* text */,
		int			/* bytes_text */
	);

	XIM XOpenIM(
		Display*			/* dpy */,
		XrmHashBucketRec*	/* rdb */,
		char*			/* res_name */,
		char*			/* res_class */
	);

	Status XCloseIM(
		XIM /* im */
	);

	char *XGetIMValues(
		XIM /* im */, ...
	);

	char *XSetIMValues(
		XIM /* im */, ...
	);

	Display *XDisplayOfIM(
		XIM /* im */
	);

	char *XLocaleOfIM(
		XIM /* im*/
	);

	XIC XCreateIC(
		XIM /* im */, ...
	);

	void XDestroyIC(
		XIC /* ic */
	);

	void XSetICFocus(
		XIC /* ic */
	);

	void XUnsetICFocus(
		XIC /* ic */
	);

	wchar_t *XwcResetIC(
		XIC /* ic */
	);

	char *XmbResetIC(
		XIC /* ic */
	);

	char *Xutf8ResetIC(
		XIC /* ic */
	);

	char *XSetICValues(
		XIC /* ic */, ...
	);

	char *XGetICValues(
		XIC /* ic */, ...
	);

	XIM XIMOfIC(
		XIC /* ic */
	);

	Bool XFilterEvent(
		XEvent*	/* event */,
		Window	/* window */
	);

	int XmbLookupString(
		XIC			/* ic */,
		XKeyPressedEvent*	/* event */,
		char*		/* buffer_return */,
		int			/* bytes_buffer */,
		KeySym*		/* keysym_return */,
		Status*		/* status_return */
	);

	int XwcLookupString(
		XIC			/* ic */,
		XKeyPressedEvent*	/* event */,
		wchar_t*		/* buffer_return */,
		int			/* wchars_buffer */,
		KeySym*		/* keysym_return */,
		Status*		/* status_return */
	);

	int Xutf8LookupString(
		XIC			/* ic */,
		XKeyPressedEvent*	/* event */,
		char*		/* buffer_return */,
		int			/* bytes_buffer */,
		KeySym*		/* keysym_return */,
		Status*		/* status_return */
	);

	XVaNestedList XVaCreateNestedList(
		int /*unused*/, ...
	);

	/* internal connections for IMs */

	Bool XRegisterIMInstantiateCallback(
		Display*			/* dpy */,
		XrmHashBucketRec*	/* rdb */,
		char*			/* res_name */,
		char*			/* res_class */,
		XIDProc			/* callback */,
		XPointer			/* client_data */
	);

	Bool XUnregisterIMInstantiateCallback(
		Display*			/* dpy */,
		XrmHashBucketRec*	/* rdb */,
		char*			/* res_name */,
		char*			/* res_class */,
		XIDProc			/* callback */,
		XPointer			/* client_data */
	);

	Status XInternalConnectionNumbers(
		Display*			/* dpy */,
		int**			/* fd_return */,
		int*			/* count_return */
	);

	void XProcessInternalConnection(
		Display*			/* dpy */,
		int				/* fd */
	);

	Status XAddConnectionWatch(
		Display*			/* dpy */,
		XConnectionWatchProc	/* callback */,
		XPointer			/* client_data */
	);

	void XRemoveConnectionWatch(
		Display*			/* dpy */,
		XConnectionWatchProc	/* callback */,
		XPointer			/* client_data */
	);

	void XSetAuthorization(
		char *			/* name */,
		int				/* namelen */,
		char *			/* data */,
		int				/* datalen */
	);

	// int _Xmbtowc(
	//     wchar_t *			/* wstr */,
	// #ifdef ISC
	//     char const *		/* str */,
	//     size_t			/* len */
	// #else
	//     char *			/* str */,
	//     int				/* len */
	// #endif
	// );
	//
	// int _Xwctomb(
	//     char *			/* str */,
	//     wchar_t			/* wc */
	// );

	Bool XGetEventData(
		Display*			/* dpy */,
		XGenericEventCookie*	/* cookie*/
	);

	void XFreeEventData(
		Display*			/* dpy */,
		XGenericEventCookie*	/* cookie*/
	);

	XrmDatabase XrmGetStringDatabase(
		const(char)*	/* data */  /*  null terminated string */
		);

	Bool XrmGetResource(
		XrmDatabase		/* database */,
		const(char)*	/* str_name */,
		const(char)*	/* str_class */,
		char**		/* str_type_return */,
		XrmValue*		/* value_return */
	);

	void XrmDestroyDatabase(
		XrmDatabase		/* database */
	);

	XrmQuark XrmUniqueQuark();

	pragma(inline, true) XContext XUniqueContext() { return cast(XContext)XrmUniqueQuark(); }
}
