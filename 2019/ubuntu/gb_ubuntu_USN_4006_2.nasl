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
  script_oid("1.3.6.1.4.1.25623.1.0.844034");
  script_version("2019-06-06T13:02:35+0000");
  script_cve_id("CVE-2019-11191");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-06-06 13:02:35 +0000 (Thu, 06 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-06-05 02:00:31 +0000 (Wed, 05 Jun 2019)");
  script_name("Ubuntu Update for linux-hwe USN-4006-2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.04 LTS");

  script_xref(name:"USN", value:"4006-2");
  script_xref(name:"URL", value:"https://lists.ubuntu.com/archives/ubuntu-security-announce/2019-June/004941.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-hwe'
  package(s) announced via the USN-4006-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-4006-1 fixed a vulnerability in the Linux kernel for Ubuntu 18.10.
This update provides the corresponding updates for the Linux Hardware
Enablement (HWE) kernel from Ubuntu 18.10 for Ubuntu 18.04 LTS.

Federico Manuel Bento discovered that the Linux kernel did not properly
apply Address Space Layout Randomization (ASLR) in some situations for
setuid a.out binaries. A local attacker could use this to improve the
chances of exploiting an existing vulnerability in a setuid a.out binary.

As a hardening measure, this update disables a.out support.");

  script_tag(name:"affected", value:"'linux-hwe' package(s) on Ubuntu 18.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "UBUNTU18.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-21-generic", ver:"4.18.0-21.22~18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-21-generic-lpae", ver:"4.18.0-21.22~18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-21-lowlatency", ver:"4.18.0-21.22~18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-21-snapdragon", ver:"4.18.0-21.22~18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-generic-hwe-18.04", ver:"4.18.0.21.71", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-generic-lpae-hwe-18.04", ver:"4.18.0.21.71", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-lowlatency-hwe-18.04", ver:"4.18.0.21.71", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-snapdragon-hwe-18.04", ver:"4.18.0.21.71", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
