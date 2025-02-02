###############################################################################
# OpenVAS Vulnerability Test
#
# Jenkins < 2.107 and < 2.89.4 LTS Multiple Vulnerabilities (Linux)
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:jenkins:jenkins";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112227");
  script_version("2019-07-30T03:00:13+0000");

  script_cve_id("CVE-2018-6356", "CVE-2018-1000067", "CVE-2018-1000068");

  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-07-30 03:00:13 +0000 (Tue, 30 Jul 2019)");
  script_tag(name:"creation_date", value:"2018-02-19 11:00:00 +0100 (Mon, 19 Feb 2018)");

  script_name("Jenkins < 2.107 and < 2.89.4 LTS Multiple Vulnerabilities (Linux)");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_jenkins_consolidation.nasl", "os_detection.nasl");
  script_mandatory_keys("jenkins/detected", "Host/runs_unixoide");

  script_xref(name:"URL", value:"https://jenkins.io/security/advisory/2018-02-14/");

  script_tag(name:"summary", value:"This host is installed with Jenkins and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Jenkins is prone to the following vulnerabilities:

  - Path traversal vulnerability which allows access to files outside plugin resources. (CVE-2018-6356)

  - Improperly secured form validation for proxy configuration, allowing Server-Side Request Forgery. (CVE-2018-1000067)

  - Improper input validation, allowing unintended access to plugin resource files on case-insensitive file systems. (CVE-2018-1000068)");

  script_tag(name:"affected", value:"Jenkins LTS up to and including 2.89.3, Jenkins weekly up to and including 2.106.");

  script_tag(name:"solution", value:"Upgrade to Jenkins weekly to 2.107 or later / Jenkins LTS to 2.89.4 or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( !port = get_app_port( cpe:CPE ) )
  exit(0);
if(!infos = get_app_full(cpe:CPE, port:port))
  exit(0);

if (!version = infos["version"])
  exit(0);

location = infos["location"];
proto = infos["proto"];

if( get_kb_item( "jenkins/" + port + "/is_lts" ) ) {
  if ( version_is_less( version:version, test_version:"2.89.4" ) ) {
    vuln = TRUE;
    fix = "2.89.4";
  }
} else {
  if( version_is_less( version:version, test_version:"2.107" ) ) {
    vuln = TRUE;
    fix = "2.107";
  }
}

if( vuln ) {
  report = report_fixed_ver( installed_version:version, fixed_version:fix, install_path:location );
  security_message( port:port, data:report, proto:proto );
  exit( 0 );
}

exit( 99 );
