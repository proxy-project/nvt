# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.891702");
  script_version("$Revision: 13971 $");
  script_cve_id("CVE-2018-1056", "CVE-2019-9210");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1702-1] advancecomp security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-04 07:29:46 +0100 (Mon, 04 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-03-04 00:00:00 +0100 (Mon, 04 Mar 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/03/msg00004.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"advancecomp on Debian Linux");
  script_tag(name:"insight", value:"AdvanceCOMP contains recompression utilities for your .zip archives, .png
images, .mng video clips and .gz files.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
1.19-1+deb8u1.

We recommend that you upgrade your advancecomp packages.");
  script_tag(name:"summary", value:"Several vulnerabilities were discovered in advancecomp, a collection
of recompression utilities.

CVE-2018-1056

Joonun Jang discovered that the advzip tool was prone to a
heap-based buffer overflow. This might allow an attacker to cause a
denial-of-service (application crash) or other unspecified impact
via a crafted file.

CVE-2019-9210

The png_compress function in pngex.cc in advpng has an integer
overflow upon encountering an invalid PNG size, which results in
another heap based buffer overflow.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"advancecomp", ver:"1.19-1+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
