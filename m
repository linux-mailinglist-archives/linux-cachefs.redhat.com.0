Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2044670E
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Nov 2021 17:32:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-DJfpsVUyONCGUHZGoMuYrg-1; Fri, 05 Nov 2021 12:32:23 -0400
X-MC-Unique: DJfpsVUyONCGUHZGoMuYrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 817D4102CB77;
	Fri,  5 Nov 2021 16:32:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 501C9108CC;
	Fri,  5 Nov 2021 16:32:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F12BD4EA29;
	Fri,  5 Nov 2021 16:32:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5GWGPQ001910 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 12:32:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55EEE2026D6A; Fri,  5 Nov 2021 16:32:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F352026D67
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 16:32:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD8B61078465
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 16:32:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-311-d450uFCEPdqCwWqiwP8ZBw-1;
	Fri, 05 Nov 2021 12:32:10 -0400
X-MC-Unique: d450uFCEPdqCwWqiwP8ZBw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AD3960ED7;
	Fri,  5 Nov 2021 16:32:06 +0000 (UTC)
Message-ID: <7921f7c5e6e72f1eb4fa39d6a7c4d5d42380d000.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Steve French
	<sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>, David Howells
	<dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Yoshinori Sato
	<ysato@users.osdn.me>, Rich Felker <dalias@libc.org>, Matti
	Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones
	<lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Luis
	Chamberlain <mcgrof@kernel.org>,
	Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-power@fi.rohmeurope.com
Date: Fri, 05 Nov 2021 12:32:05 -0400
In-Reply-To: <20211105154334.1841927-5-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<20211105154334.1841927-5-alexandre.ghiti@canonical.com>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
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
Subject: Re: [Linux-cachefs] [PATCH 4/7] arch: Remove leftovers from
	mandatory file locking
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-11-05 at 16:43 +0100, Alexandre Ghiti wrote:
> This config was removed so remove all references to it.
> 
> Fixes: f7e33bdbd6d1 ("fs: remove mandatory file locking support")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/mips/configs/decstation_64_defconfig  | 1 -
>  arch/mips/configs/decstation_defconfig     | 1 -
>  arch/mips/configs/decstation_r4k_defconfig | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
> index 85f1955b4b00..e2ed105f8c97 100644
> --- a/arch/mips/configs/decstation_64_defconfig
> +++ b/arch/mips/configs/decstation_64_defconfig
> @@ -144,7 +144,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y
> diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
> index 30a6eafdb1d0..7e987d6f5e34 100644
> --- a/arch/mips/configs/decstation_defconfig
> +++ b/arch/mips/configs/decstation_defconfig
> @@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y
> diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
> index e2b58dbf4aa9..6df5f6f2ac8e 100644
> --- a/arch/mips/configs/decstation_r4k_defconfig
> +++ b/arch/mips/configs/decstation_r4k_defconfig
> @@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

