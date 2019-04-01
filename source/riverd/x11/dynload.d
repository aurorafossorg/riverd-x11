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

module riverd.x11.dynload;

public import riverd.loader;

public import riverd.x11.dynfun;

version(D_BetterC)
{
	void* dylib_load_x11() {
		version(Posix) void* handle = dylib_load("libX11.so");
		else version(OSX) void* handle = dylib_load("libX11.dylib");

		if(handle is null) return null;

		return handle;
	}
}
else
{
	version(Posix) private enum string[] _x11_libs = ["libX11.so"];
	else version(OSX) private enum string[] _x11_libs = ["libX11.dylib"];

	mixin(DylibLoaderBuilder!("X11", _x11_libs, riverd.x11.dynfun));
}

unittest {
	void* x11_handle = dylib_load_x11();
	assert(dylib_is_loaded(x11_handle));

	dylib_unload(x11_handle);
}
