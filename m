Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD22471CD7
	for <lists+linux-cachefs@lfdr.de>; Sun, 12 Dec 2021 21:15:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402--iOLm7XcOUCfgDOJV-ZXvA-1; Sun, 12 Dec 2021 15:15:00 -0500
X-MC-Unique: -iOLm7XcOUCfgDOJV-ZXvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36C71853022;
	Sun, 12 Dec 2021 20:14:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71693100164A;
	Sun, 12 Dec 2021 20:14:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 872BC1809CB8;
	Sun, 12 Dec 2021 20:14:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BCKEddm021560 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 12 Dec 2021 15:14:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1483B1121315; Sun, 12 Dec 2021 20:14:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106351121314
	for <linux-cachefs@redhat.com>; Sun, 12 Dec 2021 20:14:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67163800B28
	for <linux-cachefs@redhat.com>; Sun, 12 Dec 2021 20:14:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-19-PE0F5b-lNkSvJS6btZ9JNw-1; Sun, 12 Dec 2021 15:14:31 -0500
X-MC-Unique: PE0F5b-lNkSvJS6btZ9JNw-1
Received: by mail-lf1-f46.google.com with SMTP id k37so27414942lfv.3;
	Sun, 12 Dec 2021 12:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P9iBGIirnE079mDC33m+ZeyiHq9a58D+yeiB4U9Jaqo=;
	b=nZSo6n5nsmWKuY1F1kLhUcPMgakh0JDIgZw6bNwiXvghStmRKTvoLg1Xp4kdBbvt2f
	38v6aO+ioecXe7hEHmAPonGP0HmBDzDsbhH1FiIuu4MWkR4+vsNixmGax7Mkan9CfoLC
	pXtB6aZjs+9mmg2J7FOW9jvm0VlCiVx8M1yNZ2eGrtWDFg9UaR4HnpKt3SIPWDC5UMr8
	zEjPpVjTLGGvF9FDm1K6yuU9I1NR6scqz/DpRk7y+BJgd3Qe5ykbxS8krV/5rnKWqD6E
	xH+Xy7tEPMyZZ9vydiAexXzgLkO8nlSUsFgx1DCjvz6oi6PAGmdHtZHVPYs7L6zClLt5
	nnMQ==
X-Gm-Message-State: AOAM533a1G2olXRil+VXpvZgpA8K2nTz8oF2aCMoeIoY8ocNoYZ0/8gj
	3XOvga8CiJDSnza440SAsfGglcfmUDSK7ZcoSMOP6Qb5
X-Google-Smtp-Source: ABdhPJztDTs592zdaCAV22rEoc3dFDuVKaf9eiwmQtAt59lSuvVTsiLV8ugzBjsdTaZqTsX/Gu3b3Fqp6l4+BQ7aRtM=
X-Received: by 2002:a19:770a:: with SMTP id s10mr26522774lfc.234.1639340069605;
	Sun, 12 Dec 2021 12:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<20211105154334.1841927-4-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-4-alexandre.ghiti@canonical.com>
From: Steve French <smfrench@gmail.com>
Date: Sun, 12 Dec 2021 14:14:18 -0600
Message-ID: <CAH2r5muPS_PSFpdy1xw2mUNcOJ-CRY5EWU1Zwo9DK+UX6VcDvw@mail.gmail.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Rich Felker <dalias@libc.org>, linux-doc@vger.kernel.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	samba-technical <samba-technical@lists.samba.org>,
	Lee Jones <lee.jones@linaro.org>, CIFS <linux-cifs@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Yoshinori Sato <ysato@users.osdn.me>,
	Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
	LAK <linux-arm-kernel@lists.infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Kalle Valo <kvalo@codeaurora.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	LKML <linux-kernel@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
	Steve French <sfrench@samba.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-power@fi.rohmeurope.com
Subject: Re: [Linux-cachefs] [PATCH 3/7] Documentation,
	arch: Remove leftovers from CIFS_WEAK_PW_HASH
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

You can add my RB is you would like to this.

Also note an additional typo in the existing config description
"laintext" instead of "plaintext"

On Fri, Nov 5, 2021 at 11:11 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> This config was removed so remove all references to it.
>
> Fixes: 76a3c92ec9e0 ("cifs: remove support for NTLM and weaker authentication algorithms")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  Documentation/admin-guide/cifs/usage.rst    | 7 +++----
>  arch/arm/configs/cm_x300_defconfig          | 1 -
>  arch/arm/configs/ezx_defconfig              | 1 -
>  arch/arm/configs/imote2_defconfig           | 1 -
>  arch/arm/configs/nhk8815_defconfig          | 1 -
>  arch/arm/configs/pxa_defconfig              | 1 -
>  arch/mips/configs/fuloong2e_defconfig       | 1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
>  arch/mips/configs/maltaaprp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
>  arch/mips/configs/maltaup_defconfig         | 1 -
>  arch/mips/configs/nlm_xlp_defconfig         | 1 -
>  arch/mips/configs/nlm_xlr_defconfig         | 1 -
>  arch/powerpc/configs/ppc6xx_defconfig       | 1 -
>  arch/sh/configs/titan_defconfig             | 1 -
>  16 files changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/admin-guide/cifs/usage.rst b/Documentation/admin-guide/cifs/usage.rst
> index f170d8820258..3766bf8a1c20 100644
> --- a/Documentation/admin-guide/cifs/usage.rst
> +++ b/Documentation/admin-guide/cifs/usage.rst
> @@ -734,10 +734,9 @@ SecurityFlags              Flags which control security negotiation and
>                         using weaker password hashes is 0x37037 (lanman,
>                         plaintext, ntlm, ntlmv2, signing allowed).  Some
>                         SecurityFlags require the corresponding menuconfig
> -                       options to be enabled (lanman and plaintext require
> -                       CONFIG_CIFS_WEAK_PW_HASH for example).  Enabling
> -                       plaintext authentication currently requires also
> -                       enabling lanman authentication in the security flags
> +                       options to be enabled.  Enabling plaintext
> +                       authentication currently requires also enabling
> +                       lanman authentication in the security flags
>                         because the cifs module only supports sending
>                         laintext passwords using the older lanman dialect
>                         form of the session setup SMB.  (e.g. for authentication
> diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
> index 502a9d870ca4..45769d0ddd4e 100644
> --- a/arch/arm/configs/cm_x300_defconfig
> +++ b/arch/arm/configs/cm_x300_defconfig
> @@ -146,7 +146,6 @@ CONFIG_NFS_V3_ACL=y
>  CONFIG_NFS_V4=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_NLS_CODEPAGE_437=m
>  CONFIG_NLS_ISO8859_1=m
> diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
> index a49e699e52de..ec84d80096b1 100644
> --- a/arch/arm/configs/ezx_defconfig
> +++ b/arch/arm/configs/ezx_defconfig
> @@ -314,7 +314,6 @@ CONFIG_NFSD_V3_ACL=y
>  CONFIG_SMB_FS=m
>  CONFIG_CIFS=m
>  CONFIG_CIFS_STATS=y
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
> index 118c4c927f26..6db871d4e077 100644
> --- a/arch/arm/configs/imote2_defconfig
> +++ b/arch/arm/configs/imote2_defconfig
> @@ -288,7 +288,6 @@ CONFIG_NFSD_V3_ACL=y
>  CONFIG_SMB_FS=m
>  CONFIG_CIFS=m
>  CONFIG_CIFS_STATS=y
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
> index 23595fc5a29a..907d6512821a 100644
> --- a/arch/arm/configs/nhk8815_defconfig
> +++ b/arch/arm/configs/nhk8815_defconfig
> @@ -127,7 +127,6 @@ CONFIG_NFS_FS=y
>  CONFIG_NFS_V3_ACL=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 58f4834289e6..dedaaae3d0d8 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -699,7 +699,6 @@ CONFIG_NFSD_V3_ACL=y
>  CONFIG_NFSD_V4=y
>  CONFIG_CIFS=m
>  CONFIG_CIFS_STATS=y
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_DEFAULT="utf8"
> diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
> index 5c24ac7fdf56..ba47c5e929b7 100644
> --- a/arch/mips/configs/fuloong2e_defconfig
> +++ b/arch/mips/configs/fuloong2e_defconfig
> @@ -206,7 +206,6 @@ CONFIG_NFSD_V3_ACL=y
>  CONFIG_NFSD_V4=y
>  CONFIG_CIFS=m
>  CONFIG_CIFS_STATS2=y
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_CIFS_DEBUG2=y
> diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
> index 614af02d83e6..6fb9bc29f4a0 100644
> --- a/arch/mips/configs/malta_qemu_32r6_defconfig
> +++ b/arch/mips/configs/malta_qemu_32r6_defconfig
> @@ -165,7 +165,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
> index 9c051f8fd330..eb72df528243 100644
> --- a/arch/mips/configs/maltaaprp_defconfig
> +++ b/arch/mips/configs/maltaaprp_defconfig
> @@ -166,7 +166,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
> index 2e90d97551d6..1fb40d310f49 100644
> --- a/arch/mips/configs/maltasmvp_defconfig
> +++ b/arch/mips/configs/maltasmvp_defconfig
> @@ -167,7 +167,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
> index d1f7fdb27284..75cb778c6149 100644
> --- a/arch/mips/configs/maltasmvp_eva_defconfig
> +++ b/arch/mips/configs/maltasmvp_eva_defconfig
> @@ -169,7 +169,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
> index 48e5bd492452..7b4f247dc60c 100644
> --- a/arch/mips/configs/maltaup_defconfig
> +++ b/arch/mips/configs/maltaup_defconfig
> @@ -165,7 +165,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
>  CONFIG_NLS_CODEPAGE_437=m
> diff --git a/arch/mips/configs/nlm_xlp_defconfig b/arch/mips/configs/nlm_xlp_defconfig
> index c97f00ece828..1c8b73d03263 100644
> --- a/arch/mips/configs/nlm_xlp_defconfig
> +++ b/arch/mips/configs/nlm_xlp_defconfig
> @@ -459,7 +459,6 @@ CONFIG_NFSD=m
>  CONFIG_NFSD_V3_ACL=y
>  CONFIG_NFSD_V4=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_UPCALL=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
> diff --git a/arch/mips/configs/nlm_xlr_defconfig b/arch/mips/configs/nlm_xlr_defconfig
> index 60ea102783d9..11acfc173058 100644
> --- a/arch/mips/configs/nlm_xlr_defconfig
> +++ b/arch/mips/configs/nlm_xlr_defconfig
> @@ -411,7 +411,6 @@ CONFIG_NFSD=m
>  CONFIG_NFSD_V3_ACL=y
>  CONFIG_NFSD_V4=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_UPCALL=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index 6697c5e6682f..bb549cb1c3e3 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -1022,7 +1022,6 @@ CONFIG_NFSD=m
>  CONFIG_NFSD_V3_ACL=y
>  CONFIG_NFSD_V4=y
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_CIFS_UPCALL=y
>  CONFIG_CIFS_XATTR=y
>  CONFIG_CIFS_POSIX=y
> diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
> index ba887f1351be..cd5c58916c65 100644
> --- a/arch/sh/configs/titan_defconfig
> +++ b/arch/sh/configs/titan_defconfig
> @@ -242,7 +242,6 @@ CONFIG_NFSD=y
>  CONFIG_NFSD_V3=y
>  CONFIG_SMB_FS=m
>  CONFIG_CIFS=m
> -CONFIG_CIFS_WEAK_PW_HASH=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_NLS_CODEPAGE_437=m
>  CONFIG_NLS_ASCII=m
> --
> 2.32.0
>


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

