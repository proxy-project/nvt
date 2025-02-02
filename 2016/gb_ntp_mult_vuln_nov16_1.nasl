##############################################################################
# OpenVAS Vulnerability Test
#
# NTP.org 'ntp' Multiple Vulnerabilities (Nov-2016)
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:ntp:ntp";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106405");
  script_version("2019-09-24T10:41:39+0000");
  script_cve_id("CVE-2016-7428", "CVE-2016-7427");
  script_tag(name:"last_modification", value:"2019-09-24 10:41:39 +0000 (Tue, 24 Sep 2019)");
  script_tag(name:"creation_date", value:"2016-06-03 11:18:33 +0700 (Fri, 03 Jun 2016)");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:P");
  script_name("NTP.org 'ntpd' Multiple Vulnerabilities - Nov16 - 1");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ntp_detect_lin.nasl");
  script_mandatory_keys("ntpd/version/detected");

  script_xref(name:"URL", value:"https://www.kb.cert.org/vuls/id/633847");

  script_tag(name:"summary", value:"NTP.org's reference implementation of NTP server, ntpd, is prone to
  multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"NTP.org's ntpd is prone to multiple vulnerabilities:

  - The broadcast mode of NTP is expected to only be used in a trusted network. If the broadcast network is
  accessible to an attacker, a potentially exploitable denial of service vulnerability in ntpd's broadcast mode
  replay prevention functionality can be abused. An attacker with access to the NTP broadcast domain can
  periodically inject specially crafted broadcast mode NTP packets into the broadcast domain which, while being
  logged by ntpd, can cause ntpd to reject broadcast mode packets from legitimate NTP broadcast servers.
  (CVE-2016-7427)

  - The broadcast mode of NTP is expected to only be used in a trusted network. If the broadcast network is
  accessible to an attacker, a potentially exploitable denial of service vulnerability in ntpd's broadcast mode
  poll interval enforcement functionality can be abused. To limit abuse, ntpd restricts the rate at which each
  broadcast association will process incoming packets. ntpd will reject broadcast mode packets that arrive before
  the poll interval specified in the preceding broadcast packet expires. An attacker with access to the NTP
  broadcast domain can send specially crafted broadcast mode NTP packets to the broadcast domain which, while
  being logged by ntpd, will cause ntpd to reject broadcast mode packets from legitimate NTP broadcast servers.
  (CVE-2016-7428)");

  script_tag(name:"impact", value:"A remote unauthenticated attacker may be able to perform a denial of
  service on ntpd.");

  script_tag(name:"affected", value:"Version 4.2.8p6 up to 4.2.8p8, 4.3.90 up to 4.3.93.");

  script_tag(name:"solution", value:"Upgrade to NTP.org's ntpd version 4.2.8p9, 4.3.94 or later.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("revisions-lib.inc");
include("host_details.inc");

if(isnull(port = get_app_port(cpe:CPE)))
  exit(0);

if(!infos = get_app_full(cpe:CPE, port:port))
  exit(0);

if(!version = infos["version"])
  exit(0);

location = infos["location"];
proto = infos["proto"];

if((revcomp(a:version, b:"4.2.8p6") >= 0) && (revcomp(a:version, b:"4.2.8p9") < 0)) {
  report = report_fixed_ver(installed_version:version, fixed_version:"4.2.8p9", install_path:location);
  security_message(port:port, data:report, proto:proto);
  exit(0);
}

if((revcomp(a:version, b:"4.3.90") >= 0) && (revcomp(a:version, b:"4.3.94") < 0)) {
  report = report_fixed_ver(installed_version:version, fixed_version:"4.3.94", install_path:location);
  security_message(port:port, data:report, proto:proto);
  exit(0);
}

exit(99);
