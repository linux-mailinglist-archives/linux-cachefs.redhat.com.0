Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D4476E0F
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 10:48:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-LqFZJMnqMxK2aFKXHQieSg-1; Thu, 16 Dec 2021 04:48:07 -0500
X-MC-Unique: LqFZJMnqMxK2aFKXHQieSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06CF28015CD;
	Thu, 16 Dec 2021 09:48:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBE3710A48A7;
	Thu, 16 Dec 2021 09:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8AD81809CB8;
	Thu, 16 Dec 2021 09:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BG9m2nq004072 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 04:48:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 84766140240A; Thu, 16 Dec 2021 09:48:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8231402409
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:48:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 603A41C8C291
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:48:02 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
	(smtp-relay-internal-0.canonical.com [185.125.188.122]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-631-sLfVH8_0OQChRvWhB8aOog-1; Thu, 16 Dec 2021 04:48:00 -0500
X-MC-Unique: sLfVH8_0OQChRvWhB8aOog-1
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id
	61DC53FFD8
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:47:59 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id
	t30-20020adfa2de000000b001a24004e1fbso483590wra.10
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 01:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UA5EztZHI/uiiMUXLzWoUuv2dZPMgtdfvbN4/RIGhNw=;
	b=NoEvtAq1nBUzD2DaHHB1OIR3jXyPMfB5b0eFEenTxUw9PM6AjRhLjmCgMte/X2TDpx
	jFEms3l1koj3knIzTaIyrQhqQ6xeIdQxREk7efVc1ikrcJCmVPnR3ibbRexgtTX27hO4
	x0XzwBhqFJ5ItvZlsQvj8l6cdDol/2yg6flpiM6aFCJBpdzQDaVgTxt2XIIjSp5k+XNE
	/tHdDJmQxPLIwFIquN5tsWASTjzx9nsU3OdUYh4dvBJHpSQLsCKEQ/4aXTO+2RvZzIuw
	SqCQDo2kHPC1lhLgEQEECmiP1MuHW8JGd/dH2L0EDNuVnoIqruSDIz67WkA69ZTdS212
	BG4w==
X-Gm-Message-State: AOAM530Sc+o23fW356F8Zj5nGtO0dnN8bLVa50/ON7dXwZ4D5JVH4xgR
	ZzemdCO1eqJEQ6juxTy7zTDaNCmH1+9hnLnXm5re1+6hTUMVg0mzEhF0if/T1Ri4Sy1kZtNn+5z
	fNHP2mU/NEfnm/S467MDqyjydfi4TKhoebOZ3
X-Received: by 2002:a1c:740c:: with SMTP id p12mr316011wmc.140.1639648078003; 
	Thu, 16 Dec 2021 01:47:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyePI8Du4Q8VFJBsAu6osq6C3A++AYoB7smlNaZZ2VPRzrhLbuU04wBMA93ArT9KvS81ExrOQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr315973wmc.140.1639648077773; 
	Thu, 16 Dec 2021 01:47:57 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
	[90.112.158.1]) by smtp.gmail.com with ESMTPSA id
	g124sm7250562wme.28.2021.12.16.01.47.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Dec 2021 01:47:57 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
	David Howells <dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee.jones@linaro.org>, Jeff Layton <jlayton@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-power@fi.rohmeurope.com
Date: Thu, 16 Dec 2021 10:44:23 +0100
Message-Id: <20211216094426.2083802-4-alexandre.ghiti@canonical.com>
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BG9m2nq004072
X-loop: linux-cachefs@redhat.com
Cc: Steve French <smfrench@gmail.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [Linux-cachefs] [PATCH v2 3/6] Documentation,
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

This config was removed so remove all references to it.

Fixes: 76a3c92ec9e0 ("cifs: remove support for NTLM and weaker authentication algorithms")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Steve French <smfrench@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de> [arch/arm/configs]
---
 Documentation/admin-guide/cifs/usage.rst    | 7 +++----
 arch/arm/configs/cm_x300_defconfig          | 1 -
 arch/arm/configs/ezx_defconfig              | 1 -
 arch/arm/configs/imote2_defconfig           | 1 -
 arch/arm/configs/nhk8815_defconfig          | 1 -
 arch/arm/configs/pxa_defconfig              | 1 -
 arch/mips/configs/fuloong2e_defconfig       | 1 -
 arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
 arch/mips/configs/maltaaprp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
 arch/mips/configs/maltaup_defconfig         | 1 -
 arch/powerpc/configs/ppc6xx_defconfig       | 1 -
 arch/sh/configs/titan_defconfig             | 1 -
 14 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/cifs/usage.rst b/Documentation/admin-guide/cifs/usage.rst
index f170d8820258..3766bf8a1c20 100644
--- a/Documentation/admin-guide/cifs/usage.rst
+++ b/Documentation/admin-guide/cifs/usage.rst
@@ -734,10 +734,9 @@ SecurityFlags		Flags which control security negotiation and
 			using weaker password hashes is 0x37037 (lanman,
 			plaintext, ntlm, ntlmv2, signing allowed).  Some
 			SecurityFlags require the corresponding menuconfig
-			options to be enabled (lanman and plaintext require
-			CONFIG_CIFS_WEAK_PW_HASH for example).  Enabling
-			plaintext authentication currently requires also
-			enabling lanman authentication in the security flags
+			options to be enabled.  Enabling plaintext
+			authentication currently requires also enabling
+			lanman authentication in the security flags
 			because the cifs module only supports sending
 			laintext passwords using the older lanman dialect
 			form of the session setup SMB.  (e.g. for authentication
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 502a9d870ca4..45769d0ddd4e 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -146,7 +146,6 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index a49e699e52de..ec84d80096b1 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -314,7 +314,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index 118c4c927f26..6db871d4e077 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -288,7 +288,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 23595fc5a29a..907d6512821a 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -127,7 +127,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 58f4834289e6..dedaaae3d0d8 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -699,7 +699,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_DEFAULT="utf8"
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 5c24ac7fdf56..ba47c5e929b7 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -206,7 +206,6 @@ CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
 CONFIG_CIFS_STATS2=y
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_CIFS_DEBUG2=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index 614af02d83e6..6fb9bc29f4a0 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -165,7 +165,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 9c051f8fd330..eb72df528243 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -166,7 +166,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 2e90d97551d6..1fb40d310f49 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -167,7 +167,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index d1f7fdb27284..75cb778c6149 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -169,7 +169,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index 48e5bd492452..7b4f247dc60c 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -165,7 +165,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 6697c5e6682f..bb549cb1c3e3 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -1022,7 +1022,6 @@ CONFIG_NFSD=m
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_CIFS_UPCALL=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
index ba887f1351be..cd5c58916c65 100644
--- a/arch/sh/configs/titan_defconfig
+++ b/arch/sh/configs/titan_defconfig
@@ -242,7 +242,6 @@ CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
 CONFIG_SMB_FS=m
 CONFIG_CIFS=m
-CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ASCII=m
-- 
2.32.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

