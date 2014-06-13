require 'rbconfig'
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

unless is_windows
	puts "This script is designed to run only under Windows."
	exit
end

require 'win32/registry'

def get_colour_scheme
	{
		"Colour0" => "131,148,150",
		"Colour1" => "147,161,161",
		"Colour2" => "0,43,54",
		"Colour3" => "7,54,66",
		"Colour4" => "0,43,54",
		"Colour5" => "238,232,213",
		"Colour6" => "7,54,66",
		"Colour7" => "0,43,56",
		"Colour8" => "220,50,47",
		"Colour9" => "203,75,22",
		"Colour10" => "133,153,0",
		"Colour11" => "88,110,117",
		"Colour12" => "181,137,0",
		"Colour13" => "101,123,131",
		"Colour14" => "38,139,210",
		"Colour15" => "131,148,150",
		"Colour16" => "211,54,130",
		"Colour17" => "108,113,196",
		"Colour18" => "42,161,152",
		"Colour19" => "147,161,161",
		"Colour20" => "238,232,213",
		"Colour21" => "253,246,227"
	}
end

def get_font_settings
	{
		"Font" => "Fira OT Mono",
		"FontHeight" => 14
	}
end

def get_putty_sessions
	sessions = []
	keyname = "Software\\SimonTatham\\PuTTY\\Sessions"
	access = Win32::Registry::KEY_ALL_ACCESS
	Win32::Registry::HKEY_CURRENT_USER.open(keyname, access) do |reg|
		reg.open("").each_key do |regkey|
			sessions << regkey
		end
	end
	sessions
end

def add_colours_to_sessions(sessions, colours, font_settings)
	base_keyname = "Software\\SimonTatham\\PuTTY\\Sessions"
	access = Win32::Registry::KEY_ALL_ACCESS
	sessions.each do |s|
		keyname = base_keyname + "\\" + s
		Win32::Registry::HKEY_CURRENT_USER.open(keyname, access) do |k,v|
			colours.each do |ck,cv|
				k[ck] = cv
			end
			font_settings.each do |fk,fv|
				k[fk] = fv
			end
		end
	end
end

add_colours_to_sessions(get_putty_sessions, get_colour_scheme, get_font_settings)
