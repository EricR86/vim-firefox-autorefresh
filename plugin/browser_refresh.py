# Assumes Firefox and Remote Control plugin installed (with defaults)
import telnetlib
telnetlib.Telnet('localhost', 32000).write("reload\n")
