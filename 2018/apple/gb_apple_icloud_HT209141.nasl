###############################################################################
# OpenVAS Vulnerability Test
#
# Apple iCloud Security Updates(HT209141)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apple:icloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814073");
  script_version("2019-07-05T08:56:43+0000");
  script_cve_id("CVE-2018-4191", "CVE-2018-4311", "CVE-2018-4316", "CVE-2018-4299",
                "CVE-2018-4323", "CVE-2018-4328", "CVE-2018-4358", "CVE-2018-4359",
                "CVE-2018-4319", "CVE-2018-4309", "CVE-2018-4197", "CVE-2018-4306",
                "CVE-2018-4312", "CVE-2018-4314", "CVE-2018-4315", "CVE-2018-4317",
                "CVE-2018-4318", "CVE-2018-4345", "CVE-2018-4361");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-07-05 08:56:43 +0000 (Fri, 05 Jul 2019)");
  script_tag(name:"creation_date", value:"2018-10-09 10:19:54 +0530 (Tue, 09 Oct 2018)");
  script_name("Apple iCloud Security Updates(HT209141)-Windows");

  script_tag(name:"summary", value:"This host is installed with Apple iCloud
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple memory corruption issues.

  - Multiple cross-origin issues.

  - A use after free issue.

  - Multiple cross-site scripting issues related to poor URL validation.");

  script_tag(name:"impact", value:"Successful exploitation allow remote
  attackers to execute arbitrary code, bypass security restrictions and conduct
  cross-site scripting and causes an ASSERT failure.");

  script_tag(name:"affected", value:"Apple iCloud versions before 7.7 on Windows");

  script_tag(name:"solution", value:"Upgrade to Apple iCloud 7.7 or later. Please see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT209141");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_apple_icloud_detect_win.nasl");
  script_mandatory_keys("apple/icloud/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
icVer = infos['version'];
icPath = infos['location'];

if(version_is_less(version:icVer, test_version:"7.7"))
{
  report = report_fixed_ver(installed_version:icVer, fixed_version:"7.7", install_path:icPath);
  security_message(data:report);
  exit(0);
}
exit(0);
