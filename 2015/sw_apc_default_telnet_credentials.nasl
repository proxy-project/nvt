###############################################################################
# OpenVAS Vulnerability Test
#
# APC Network Management Card Telnet Default Credentials
#
# Authors:
# Christian Fischer
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.111051");
  script_version("2019-09-06T14:17:49+0000");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("APC Network Management Card Telnet Default Credentials");
  script_tag(name:"last_modification", value:"2019-09-06 14:17:49 +0000 (Fri, 06 Sep 2019)");
  script_tag(name:"creation_date", value:"2015-11-12 15:00:00 +0100 (Thu, 12 Nov 2015)");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_dependencies("telnetserver_detect_type_nd_version.nasl", "gb_default_credentials_options.nasl");
  script_require_ports("Services/telnet", 23);
  script_exclude_keys("default_credentials/disable_default_account_checks");

  script_tag(name:"summary", value:"The remote APC Network Management Card has default credentials set.");

  script_tag(name:"impact", value:"This issue may be exploited by a remote attacker to gain
  access to sensitive information or modify system configuration.");

  script_tag(name:"vuldetect", value:"Connect to the telnet service and try to login with default credentials.");

  script_tag(name:"insight", value:"It was possible to login with default credentials of apc:apc or device:apc");

  script_tag(name:"solution", value:"Change/Set the password.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

if(get_kb_item("default_credentials/disable_default_account_checks"))
  exit(0);

include("telnet_func.inc");

vuln = 0;
report = 'It was possible to login using the following credentials:';

port = telnet_get_port( default:23 );

# Only the two most common passwords as the device is locking out
# an IP after three wrong logins. The readonly:apc user is also
# not allowed to login via telnet.
creds = make_array( "apc", "apc",
                    "device", "apc" );

foreach cred ( keys( creds ) ) {

  soc = open_sock_tcp( port );
  if( ! soc ) exit( 0 );

  recv = recv( socket:soc, length:2048 );

  if ( "User Name :" >< recv ) {

    send( socket:soc, data: cred + '\r\n' );
    recv = recv( socket:soc, length:128 );

    if( "Password  :" >< recv ) {
      send( socket:soc, data: creds[cred] + '\r\n' );
      recv = recv( socket:soc, length:1024 );

      if( "American Power Conversion" >< recv || "Network Management Card" >< recv) {
        report += "\n\n" + cred + ":" + creds[cred] + "\n";
        vuln = 1;
      }
    }
  }
  close( soc );
}

if( vuln ) {

  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
