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
  script_oid("1.3.6.1.4.1.25623.1.0.852513");
  script_version("2019-05-28T09:21:36+0000");
  script_cve_id("CVE-2019-11068");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-05-28 09:21:36 +0000 (Tue, 28 May 2019)");
  script_tag(name:"creation_date", value:"2019-05-22 02:01:26 +0000 (Wed, 22 May 2019)");
  script_name("openSUSE Update for libxslt openSUSE-SU-2019:1428-1 (libxslt)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:1428_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00052.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libxslt'
  package(s) announced via the openSUSE-SU-2019:1428_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for libxslt fixes the following issues:

  Security issue fixed:

  - CVE-2019-11068: Fixed a protection mechanism bypass where callers of
  xsltCheckRead() and xsltCheckWrite() would permit access upon receiving
  an error (bsc#1132160).

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-1428=1");

  script_tag(name:"affected", value:"'libxslt' package(s) on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "openSUSELeap15.0") {

  if(!isnull(res = isrpmvuln(pkg:"libxslt-debugsource", rpm:"libxslt-debugsource~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-devel", rpm:"libxslt-devel~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-tools", rpm:"libxslt-tools~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-tools-debuginfo", rpm:"libxslt-tools-debuginfo~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt1", rpm:"libxslt1~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt1-debuginfo", rpm:"libxslt1-debuginfo~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-devel-32bit", rpm:"libxslt-devel-32bit~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-python", rpm:"libxslt-python~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-python-debuginfo", rpm:"libxslt-python-debuginfo~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt-python-debugsource", rpm:"libxslt-python-debugsource~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt1-32bit", rpm:"libxslt1-32bit~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libxslt1-32bit-debuginfo", rpm:"libxslt1-32bit-debuginfo~1.1.32~lp150.2.3.1", rls:"openSUSELeap15.0"))) {
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
