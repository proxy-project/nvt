###############################################################################
# OpenVAS Vulnerability Test
#
# ISC BIND Denial of Service Vulnerability - 04 - Jan16
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:isc:bind";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806998");
  script_version("2019-07-05T09:54:18+0000");
  script_cve_id("CVE-2015-8461");
  script_bugtraq_id(79347);
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"2019-07-05 09:54:18 +0000 (Fri, 05 Jul 2019)");
  script_tag(name:"creation_date", value:"2016-01-27 15:07:28 +0530 (Wed, 27 Jan 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("ISC BIND Denial of Service Vulnerability - 04 - Jan16");

  script_tag(name:"summary", value:"The host is installed with ISC BIND and is
  prone to remote denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to a race condition
  in 'resolver.c' script when handling socket errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause denial of service.");

  script_tag(name:"affected", value:"ISC BIND versions 9.9.8 through 9.9.8-P1,
  9.9.8-S1 through 9.9.8-S2, 9.10.3 through 9.10.3-P1.");

  script_tag(name:"solution", value:"Upgrade to ISC BIND version 9.9.8-P2 or
  9.9.8-S3 or 9.10.3-P2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://kb.isc.org/article/AA-01319");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("bind_version.nasl");
  script_mandatory_keys("ISC BIND/installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! bindPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_proto( cpe:CPE, port:bindPort ) ) exit( 0 );

bindVer = infos["version"];
proto = infos["proto"];

if(version_in_range(version:bindVer, test_version:"9.9.8", test_version2:"9.9.8.P1"))
{
  fix = "9.9.8-P2";
  VULN = TRUE;
}

else if(version_in_range(version:bindVer, test_version:"9.9.8.S1", test_version2:"9.9.8.S2"))
{
  fix = "9.9.8-S3";
  VULN = TRUE;
}

else if(version_in_range(version:bindVer, test_version:"9.10.3", test_version2:"9.10.3.P1"))
{
  fix = "9.10.3-P2";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:bindVer, fixed_version:fix);
  security_message( data:report, port:bindPort, proto:proto );
  exit( 0 );
}

exit( 99 );