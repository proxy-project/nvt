###############################################################################
# OpenVAS Vulnerability Test
#
# PostgreSQL Denial of Service Vulnerability - Apr13 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803473");
  script_version("2019-05-20T11:12:48+0000");
  script_cve_id("CVE-2013-1899");
  script_bugtraq_id(58876);
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-05-20 11:12:48 +0000 (Mon, 20 May 2019)");
  script_tag(name:"creation_date", value:"2013-04-09 16:49:46 +0530 (Tue, 09 Apr 2013)");
  script_name("PostgreSQL Denial of Service Vulnerability - Apr13 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/52837");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1028387");
  script_xref(name:"URL", value:"http://www.postgresql.org/about/news/1456");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("postgresql_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed", "Host/runs_windows");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary
  SQL query, gain access or manipulate arbitrary files, and cause denial of service.");

  script_tag(name:"affected", value:"PostgreSQL version 9.2.x before 9.2.4, 9.1.x before 9.1.9, and
  9.0.x before 9.0.13");

  script_tag(name:"insight", value:"Improper validation of connection request that contains database name
  begins with the '-' symbol");

  script_tag(name:"solution", value:"Upgrade to PostgreSQL 9.0.13, 9.1.9, 9.2.4 or later.");

  script_tag(name:"summary", value:"This host is installed with PostgreSQL and is prone to denial
  of service vulnerability.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

if(!pgsqlPort = get_app_port(cpe:CPE)) exit(0);
pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort);

if(!pgsqlVer || pgsqlVer !~ "^9\.[0-2]\."){
  exit(0);
}

if(version_in_range(version:pgsqlVer, test_version:"9.0", test_version2:"9.0.12") ||
   version_in_range(version:pgsqlVer, test_version:"9.1", test_version2:"9.1.8") ||
   version_in_range(version:pgsqlVer, test_version:"9.2", test_version2:"9.2.3"))
{
  security_message(port:pgsqlPort);
  exit(0);
}
