###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3749_1.nasl 12767 2018-12-12 08:39:09Z asteins $
#
# Ubuntu Update for mozjs52 USN-3749-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843709");
  script_version("$Revision: 12767 $");
  script_cve_id("CVE-2018-5188");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 09:39:09 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:09:12 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for mozjs52 USN-3749-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.04 LTS");

  script_xref(name:"USN", value:"3749-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3749-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'mozjs52'
  package(s) announced via the USN-3749-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Multiple memory safety issues were fixed in Spidermonkey. An attacker
could potentially exploit these to cause a denial of service, or execute
arbitrary code.");

  script_tag(name:"affected", value:"mozjs52 on Ubuntu 18.04 LTS.");

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

if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libmozjs-52-0", ver:"52.9.1-0ubuntu0.18.04.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
