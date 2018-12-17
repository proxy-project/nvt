###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_4ce40afcb6_rubygem-loofah_fc27.nasl 12806 2018-12-17 06:39:00Z ckuersteiner $
#
# Fedora Update for rubygem-loofah FEDORA-2018-4ce40afcb6
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
  script_oid("1.3.6.1.4.1.25623.1.0.875321");
  script_version("$Revision: 12806 $");
  script_cve_id("CVE-2018-16468");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-17 07:39:00 +0100 (Mon, 17 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-04 08:32:01 +0100 (Tue, 04 Dec 2018)");
  script_name("Fedora Update for rubygem-loofah FEDORA-2018-4ce40afcb6");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-4ce40afcb6");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4OHKDFRMDTZVASE5GSZHUPSTOYHNYUCV");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'rubygem-loofah'
  package(s) announced via the FEDORA-2018-4ce40afcb6 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Loofah is a general library for manipulating and transforming HTML/XML
documents and fragments. It&#39 s built on top of Nokogiri and libxml2, so
it&#39 s fast and has a nice API.
Loofah excels at HTML sanitization (XSS prevention). It includes some
nice HTML sanitizers, which are based on HTML5lib&#39 s whitelist, so it
most likely won&#39 t make your codes less secure.
");

  script_tag(name:"affected", value:"rubygem-loofah on Fedora 27.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"rubygem-loofah", rpm:"rubygem-loofah~2.0.3~6.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
