Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A0446729
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Nov 2021 17:40:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-wJzvbkqwNhC7gBO-91lvxQ-1; Fri, 05 Nov 2021 12:40:16 -0400
X-MC-Unique: wJzvbkqwNhC7gBO-91lvxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D945362FD;
	Fri,  5 Nov 2021 16:40:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CFDC60BF1;
	Fri,  5 Nov 2021 16:40:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B2F44EA2A;
	Fri,  5 Nov 2021 16:40:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5FrBFk031365 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 11:53:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 840162166B44; Fri,  5 Nov 2021 15:53:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C93B2166B25
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 15:53:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 790EB108C0C1
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 15:53:08 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
	(smtp-relay-internal-0.canonical.com [185.125.188.122]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-221-ub1aTkAhMDCCqxcR4A1ZIA-1;
	Fri, 05 Nov 2021 11:53:06 -0400
X-MC-Unique: ub1aTkAhMDCCqxcR4A1ZIA-1
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id
	7697840020
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 15:43:39 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id
	g11-20020a1c200b000000b003320d092d08so3415192wmg.9
	for <linux-cachefs@redhat.com>; Fri, 05 Nov 2021 08:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kma2r6Cjt1RWiEDiySihOnGrp1HFvlTplV2HdiifHKA=;
	b=SGjUZldX0o6dr6xt66eMk28tAkrt2cd79tU9tpE5pFnG9RTNf+JmZdCeL7Zdp1Qk0I
	QiDDga9DXf6Ah2YXfchMQG+g3i4lKfeQpMunsQvPDx0coMwtcfTW1hpdL/ChY4nAlNya
	bz3vxtZ6SJfA0kRKLvZnMDBLbIJak74YZuVrjnP6ZQc6wztMfgPPkriI4MS1CeOt9c8m
	qJHs0RBG0REzZekiUWdn3ujgcMbEokTMHRjQBt8nK4HZqUgiE3IQ9dbAxGJE18+if/2g
	JTlMT69gfkSdK3MBtC6KcwDi7KL/UtpHmANyuTyhuw5O0QgXTRXKuFmN4X+zIXWXMaAX
	S4XQ==
X-Gm-Message-State: AOAM5301bMQoBo2rlbWorEY4lz3NCmO9ZKcJ9oAgl9HxBuJFq852CI7m
	V3Duq84Wx06EA3lmxFBymsgmk2I6kBrOq/yd0JdeWBCbBYz4pExaiUM72nouUP8j2JsPPBfmAzp
	PlkXLFLp1sc9J1P84yfgVKSIEFYguDo2O3Qz1
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738288wmc.112.1636127019052; 
	Fri, 05 Nov 2021 08:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoyh8Lr4yX65exQreiyo/watjC1Mfw4IA67+fs0m2xRDqQJ5/nM+wMDOQKHo1Bn9rMO/Br/w==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738272wmc.112.1636127018901; 
	Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
	[2.7.60.249]) by smtp.gmail.com with ESMTPSA id
	m2sm11245691wml.15.2021.11.05.08.43.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
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
Date: Fri,  5 Nov 2021 16:43:27 +0100
Message-Id: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A5FrBFk031365
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 05 Nov 2021 12:40:09 -0400
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [Linux-cachefs] [PATCH 0/7] Cleanup after removal of configs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While bumping from 5.13 to 5.15, I found that a few deleted configs had
left some pieces here and there: this patchset cleans that.

Alexandre Ghiti (7):
  Documentation, arch: Remove leftovers from fscache/cachefiles
    histograms
  Documentation, arch: Remove leftovers from raw device
  Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
  arch: Remove leftovers from mandatory file locking
  Documentation, arch, fs: Remove leftovers from fscache object list
  include: mfd: Remove leftovers from bd70528 watchdog
  arch: Remove leftovers from prism54 wireless driver

 Documentation/admin-guide/cifs/usage.rst      |   7 +-
 Documentation/admin-guide/devices.txt         |   8 +-
 .../filesystems/caching/cachefiles.rst        |  34 -----
 Documentation/filesystems/caching/fscache.rst | 123 +-----------------
 arch/arm/configs/axm55xx_defconfig            |   3 -
 arch/arm/configs/cm_x300_defconfig            |   1 -
 arch/arm/configs/ezx_defconfig                |   1 -
 arch/arm/configs/imote2_defconfig             |   1 -
 arch/arm/configs/nhk8815_defconfig            |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/configs/spear13xx_defconfig          |   1 -
 arch/arm/configs/spear3xx_defconfig           |   1 -
 arch/arm/configs/spear6xx_defconfig           |   1 -
 arch/mips/configs/decstation_64_defconfig     |   1 -
 arch/mips/configs/decstation_defconfig        |   1 -
 arch/mips/configs/decstation_r4k_defconfig    |   1 -
 arch/mips/configs/fuloong2e_defconfig         |   1 -
 arch/mips/configs/ip27_defconfig              |   1 -
 arch/mips/configs/malta_defconfig             |   1 -
 arch/mips/configs/malta_kvm_defconfig         |   1 -
 arch/mips/configs/malta_qemu_32r6_defconfig   |   1 -
 arch/mips/configs/maltaaprp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_eva_defconfig     |   1 -
 arch/mips/configs/maltaup_defconfig           |   1 -
 arch/mips/configs/maltaup_xpa_defconfig       |   1 -
 arch/mips/configs/nlm_xlp_defconfig           |   2 -
 arch/mips/configs/nlm_xlr_defconfig           |   2 -
 arch/powerpc/configs/pmac32_defconfig         |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/configs/pseries_defconfig        |   1 -
 arch/sh/configs/titan_defconfig               |   1 -
 fs/fscache/object.c                           |   3 -
 fs/fscache/proc.c                             |  12 --
 include/linux/mfd/rohm-bd70528.h              |  24 ----
 35 files changed, 6 insertions(+), 237 deletions(-)

-- 
2.32.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

