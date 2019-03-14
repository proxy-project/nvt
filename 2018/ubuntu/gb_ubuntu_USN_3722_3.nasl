###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3722_3.nasl 14140 2019-03-13 12:26:09Z cfischer $
#
# Ubuntu Update for clamav USN-3722-3
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.843601");
  script_version("$Revision: 14140 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-13 13:26:09 +0100 (Wed, 13 Mar 2019) $");
  script_tag(name:"creation_date", value:"2018-07-27 06:00:32 +0200 (Fri, 27 Jul 2018)");
  script_cve_id("CVE-2018-0360", "CVE-2018-0361");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for clamav USN-3722-3");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'clamav'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"USN-3722-1 fixed vulnerabilities in ClamAV.
The updated ClamAV version removed some configuration options which caused the
daemon to fail to start in environments where the ClamAV configuration file was
manually edited. This update fixes the problem.

We apologize for the inconvenience.

Original advisory details:

It was discovered that ClamAV incorrectly handled parsing certain HWP
files. A remote attacker could use this issue to cause ClamAV to hang,
resulting in a denial of service. (CVE-2018-0360)
It was discovered that ClamAV incorrectly handled parsing certain PDF
files. A remote attacker could use this issue to cause ClamAV to hang,
resulting in a denial of service. (CVE-2018-0361)");
  script_tag(name:"affected", value:"clamav on Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3722-3");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3722-3/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|18\.04 LTS|16\.04 LTS)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.100.1+dfsg-1ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.100.1+dfsg-1ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.100.1+dfsg-1ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
