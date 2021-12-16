Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE1477947
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:35:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-5NVkUL8XOni8qRSFB97g2A-1; Thu, 16 Dec 2021 11:35:51 -0500
X-MC-Unique: 5NVkUL8XOni8qRSFB97g2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9020E760D5;
	Thu, 16 Dec 2021 16:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 822BD78DB0;
	Thu, 16 Dec 2021 16:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2A571806D1D;
	Thu, 16 Dec 2021 16:35:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGB3k6m011111 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 06:03:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 018B52024CB8; Thu, 16 Dec 2021 11:03:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7C42028CE7
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 11:03:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0025E39D30A4
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 11:03:43 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41]) by
	relay.mimecast.com with ESMTP id us-mta-83-ECP4gtN_NGKtzEnoWspE0g-1;
	Thu, 16 Dec 2021 06:03:39 -0500
X-MC-Unique: ECP4gtN_NGKtzEnoWspE0g-1
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1mxoC2-00089d-00; Thu, 16 Dec 2021 11:40:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5AA86C075D; Thu, 16 Dec 2021 11:40:49 +0100 (CET)
Date: Thu, 16 Dec 2021 11:40:49 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Message-ID: <20211216104049.GA10578@alpha.franken.de>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 16 Dec 2021 11:35:45 -0500
Cc: Rich Felker <dalias@libc.org>, linux-doc@vger.kernel.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	samba-technical@lists.samba.org,
	Lee Jones <lee.jones@linaro.org>, linux-cifs@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Yoshinori Sato <ysato@users.osdn.me>,
	Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Kalle Valo <kvalo@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
	Steve French <sfrench@samba.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-power@fi.rohmeurope.com
Subject: Re: [Linux-cachefs] [PATCH v2 0/6] Cleanup after removal of configs
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 16, 2021 at 10:44:20AM +0100, Alexandre Ghiti wrote:
> While bumping from 5.13 to 5.15, I found that a few deleted configs had
> left some pieces here and there: this patchset cleans that.
> 
> Changes in v2:
> - Rebase on top of v5.16-rc1
> - Removed patch 6 since Matti said he would take care of that
> - Added AB, RB
> 
> Alexandre Ghiti (6):
>   Documentation, arch: Remove leftovers from fscache/cachefiles
>     histograms
>   Documentation, arch: Remove leftovers from raw device
>   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
>   arch: Remove leftovers from mandatory file locking
>   Documentation, arch, fs: Remove leftovers from fscache object list
>   arch: Remove leftovers from prism54 wireless driver
> 
>  Documentation/admin-guide/cifs/usage.rst      |   7 +-
>  Documentation/admin-guide/devices.txt         |   8 +-
>  .../filesystems/caching/cachefiles.rst        |  34 -----
>  Documentation/filesystems/caching/fscache.rst | 123 +-----------------
>  arch/arm/configs/axm55xx_defconfig            |   3 -
>  arch/arm/configs/cm_x300_defconfig            |   1 -
>  arch/arm/configs/ezx_defconfig                |   1 -
>  arch/arm/configs/imote2_defconfig             |   1 -
>  arch/arm/configs/nhk8815_defconfig            |   1 -
>  arch/arm/configs/pxa_defconfig                |   1 -
>  arch/arm/configs/spear13xx_defconfig          |   1 -
>  arch/arm/configs/spear3xx_defconfig           |   1 -
>  arch/arm/configs/spear6xx_defconfig           |   1 -
>  arch/mips/configs/decstation_64_defconfig     |   1 -
>  arch/mips/configs/decstation_defconfig        |   1 -
>  arch/mips/configs/decstation_r4k_defconfig    |   1 -
>  arch/mips/configs/fuloong2e_defconfig         |   1 -
>  arch/mips/configs/ip27_defconfig              |   1 -
>  arch/mips/configs/malta_defconfig             |   1 -
>  arch/mips/configs/malta_kvm_defconfig         |   1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig   |   1 -
>  arch/mips/configs/maltaaprp_defconfig         |   1 -
>  arch/mips/configs/maltasmvp_defconfig         |   1 -
>  arch/mips/configs/maltasmvp_eva_defconfig     |   1 -
>  arch/mips/configs/maltaup_defconfig           |   1 -
>  arch/mips/configs/maltaup_xpa_defconfig       |   1 -
>  arch/powerpc/configs/pmac32_defconfig         |   1 -
>  arch/powerpc/configs/ppc6xx_defconfig         |   1 -
>  arch/powerpc/configs/pseries_defconfig        |   1 -
>  arch/sh/configs/titan_defconfig               |   1 -
>  fs/fscache/object.c                           |   3 -
>  fs/fscache/proc.c                             |  12 --
>  32 files changed, 6 insertions(+), 209 deletions(-)

for the MIPS parts:

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

