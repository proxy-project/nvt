###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3874_1.nasl 13595 2019-02-12 08:06:21Z mmartin $
#
# Ubuntu Update for firefox USN-3874-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.843887");
  script_version("$Revision: 13595 $");
  script_cve_id("CVE-2018-18500", "CVE-2018-18501", "CVE-2018-18502", "CVE-2018-18503",
                "CVE-2018-18504", "CVE-2018-18505", "CVE-2018-18506");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-02-12 09:06:21 +0100 (Tue, 12 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-01-31 04:02:48 +0100 (Thu, 31 Jan 2019)");
  script_name("Ubuntu Update for firefox USN-3874-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|18\.04 LTS|18\.10|16\.04 LTS)");

  script_xref(name:"USN", value:"3874-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3874-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for
  the 'firefox' package(s) announced via the USN-3874-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version
is present on the target host.");

  script_tag(name:"insight", value:"Multiple security issues were discovered
in Firefox. If a user were tricked in to opening a specially crafted website,
an attacker could potentially exploit these to cause a denial of service, gain
additional privileges by escaping the sandbox, or execute arbitrary code.
(CVE-2018-18500, CVE-2018-18501, CVE-2018-18502, CVE-2018-18503,
CVE-2018-18504, CVE-2018-18505)

It was discovered that Firefox allowed PAC files to specify that requests
to localhost are sent through the proxy to another server. If proxy
auto-detection is enabled, an attacker could potentially exploit this to
conduct attacks on local services and tools. (CVE-2018-18506)");

  script_tag(name:"affected", value:"firefox on Ubuntu 18.10,
  Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"65.0+build2-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"65.0+build2-0ubuntu0.18.04.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.10")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"65.0+build2-0ubuntu0.18.10.1", rls:"UBUNTU18.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"65.0+build2-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
