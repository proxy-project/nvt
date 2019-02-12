###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4356.nasl 13595 2019-02-12 08:06:21Z mmartin $
#
# Auto-generated from advisory DSA 4356-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.704356");
  script_version("$Revision: 13595 $");
  script_cve_id("CVE-2018-1160");
  script_name("Debian Security Advisory DSA 4356-1 (netatalk - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-02-12 09:06:21 +0100 (Tue, 12 Feb 2019) $");
  script_tag(name:"creation_date", value:"2018-12-20 00:00:00 +0100 (Thu, 20 Dec 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4356.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"netatalk on Debian Linux");
  script_tag(name:"insight", value:"Netatalk is an implementation of the AppleTalk Protocol Suite for
BSD-derived systems. The current release contains support for
EtherTalk Phase I and II, DDP, RTMP, NBP, ZIP, AEP, ATP, PAP, ASP, and
AFP.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 2.2.5-2+deb9u1.

We recommend that you upgrade your netatalk packages.

For the detailed security status of netatalk please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/netatalk");
  script_tag(name:"summary",  value:"Jacob Baines discovered a flaw in the handling of the DSI Opensession
command in Netatalk, an implementation of the AppleTalk Protocol Suite,
allowing an unauthenticated user to execute arbitrary code with root
privileges.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"netatalk", ver:"2.2.5-2+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"netatalk-dbg", ver:"2.2.5-2+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
