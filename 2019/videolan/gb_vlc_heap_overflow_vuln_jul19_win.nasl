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
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

CPE = "cpe:/a:videolan:vlc_media_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.815255");
  script_version("2019-07-30T06:52:05+0000");
  script_cve_id("CVE-2019-13615");
  script_bugtraq_id(109304);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-07-30 06:52:05 +0000 (Tue, 30 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-19 09:09:10 +0530 (Fri, 19 Jul 2019)");
  script_name("VLC Media Player 'libebml' Library Heap Overflow Vulnerability July19 (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");

  script_xref(name:"URL", value:"https://trac.videolan.org/vlc/ticket/22474");
  script_xref(name:"URL", value:"https://github.com/Matroska-Org/libebml/commit/05beb69ba60acce09f73ed491bb76f332849c3a0");
  script_xref(name:"URL", value:"https://github.com/Matroska-Org/libebml/commit/b66ca475be967547af9a3784e720fbbacd381be6");
  script_xref(name:"URL", value:"https://github.com/Matroska-Org/libebml/compare/release-1.3.5...release-1.3.6");

  script_tag(name:"summary", value:"The host is installed with VLC Media Player
  and is prone to a heap-based buffer over-read vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to a heap-based buffer
  over-read error in EbmlElement::FindNextElement of the 'libebml' library as
  used by VLC Media Player.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to
  cause denial of service condition and launch further attacks using specially
  crafted files.");

  script_tag(name:"affected", value:"libebml before 1.3.6, as used in the MKV module
  in VLC Media Player binaries before 3.0.3 on Windows.");

  script_tag(name:"solution", value:"Update VLC Media Player to version 3.0.3 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE))
  exit(0);

vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"3.0.3")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"3.0.3", install_path:path);
  security_message(data:report);
  exit(0);
}

exit(99);
