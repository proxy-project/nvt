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
  script_oid("1.3.6.1.4.1.25623.1.0.852650");
  script_version("2019-08-20T10:47:01+0000");
  script_cve_id("CVE-2019-10160", "CVE-2019-9636");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-08-20 10:47:01 +0000 (Tue, 20 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-16 02:00:56 +0000 (Fri, 16 Aug 2019)");
  script_name("openSUSE Update for python openSUSE-SU-2019:1906-1 (python)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:1906_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00042.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python'
  package(s) announced via the openSUSE-SU-2019:1906_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for python fixes the following issues:

  Security issue fixed:

  - CVE-2019-10160: Fixed a regression in urlparse() and urlsplit()
  introduced by the fix for CVE-2019-9636 (bsc#1138459).

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.1:

  zypper in -t patch openSUSE-2019-1906=1

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-1906=1");

  script_tag(name:"affected", value:"'python' package(s) on openSUSE Leap 15.0.");

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

  if(!isnull(res = isrpmvuln(pkg:"python", rpm:"python~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-curses", rpm:"python-curses~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-curses-debuginfo", rpm:"python-curses-debuginfo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-debuginfo", rpm:"python-debuginfo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-debugsource", rpm:"python-debugsource~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-demo", rpm:"python-demo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-gdbm", rpm:"python-gdbm~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-gdbm-debuginfo", rpm:"python-gdbm-debuginfo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-idle", rpm:"python-idle~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-tk", rpm:"python-tk~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-tk-debuginfo", rpm:"python-tk-debuginfo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-32bit", rpm:"python-32bit~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-32bit-debuginfo", rpm:"python-32bit-debuginfo~2.7.14~lp150.6.13.1", rls:"openSUSELeap15.0"))) {
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
