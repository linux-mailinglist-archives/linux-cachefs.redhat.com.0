Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D194476E46
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 10:51:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593--J8ZQ4ZdMqSLFf5AydyWOA-1; Thu, 16 Dec 2021 04:51:23 -0500
X-MC-Unique: -J8ZQ4ZdMqSLFf5AydyWOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A983C100CCC3;
	Thu, 16 Dec 2021 09:51:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99B7B10A48AA;
	Thu, 16 Dec 2021 09:51:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67C831809CB8;
	Thu, 16 Dec 2021 09:51:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BG9pI5X004317 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 04:51:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CF63C202C8; Thu, 16 Dec 2021 09:51:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5811DC23DD5
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:51:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F71839D30A8
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:51:18 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
	(smtp-relay-internal-1.canonical.com [185.125.188.123]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-298-tQwZ-U_9OVWRBBrM5Ro59w-1; Thu, 16 Dec 2021 04:51:16 -0500
X-MC-Unique: tQwZ-U_9OVWRBBrM5Ro59w-1
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id
	A1F833F1F3
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 09:51:13 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id
	i15-20020a05600c354f00b0034566ac865bso1843762wmq.6
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 01:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
	b=HNVrFxu60NFEL0u7gNFWN9rdTtRrZjyqWT6UnUBHITS/z1aXprAL0m94CMJ33v/pTW
	/PcrpPYK6ssQhkfgZf8lw7PeTWfkhPEMfDt+XIKojPUCqTMk4W8vo1wtmaXMPuIr0fnM
	RIDBKdtv1bal683jQUeYi9bCouWKxJFRX8p2MaMUoVQvu+lI+w82NtTr6HzDDWisQACW
	tqv/9OtQmywBosOkaachFNXKew9+tOeJUUm+8EUaRxbTK0Y1CHLHAOVq+AKLv1m1yuXm
	H7LioQsqKK5HXth52WzldmDQmAvzM2gsIipKIijVh27OfdMULVkZQGy40EqSg/FYWe5q
	aptQ==
X-Gm-Message-State: AOAM53173/9+cTczH0oX6pBDCnJu4QbWj1zn+p8e2zBnl/Ne1g9nC2Ta
	CuILRK3/IVRC/SfgEcv7A2rggDNDW8cqS+5dXfCxw+M9wT2wProAhh5nw5LqeNDUVGPMiWs9k5K
	J0P6v+CtY83nYSZXHcedGun4fKgSyCWolhs3X
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr8388287wri.530.1639648261838; 
	Thu, 16 Dec 2021 01:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbJdsw74e1MWIrtUpFfSGPgTM99V/z0uqkAiMvhK7tPz89ydRhYflRK8+9nZRMh9H4fPR73w==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr8388260wri.530.1639648261695; 
	Thu, 16 Dec 2021 01:51:01 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
	[90.112.158.1])
	by smtp.gmail.com with ESMTPSA id a1sm5552974wri.89.2021.12.16.01.51.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Dec 2021 01:51:01 -0800 (PST)
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
Date: Thu, 16 Dec 2021 10:44:26 +0100
Message-Id: <20211216094426.2083802-7-alexandre.ghiti@canonical.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BG9pI5X004317
X-loop: linux-cachefs@redhat.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [Linux-cachefs] [PATCH v2 6/6] arch: Remove leftovers from prism54
	wireless driver
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

This driver was removed so remove all references to it.

Fixes: d249ff28b1d8 ("intersil: remove obsolete prism54 wireless driver")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/mips/configs/ip27_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/powerpc/configs/pmac32_defconfig   | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 638d7cf5ef01..821630ac1be7 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -223,7 +223,6 @@ CONFIG_TMD_HERMES=m
 CONFIG_NORTEL_HERMES=m
 CONFIG_P54_COMMON=m
 CONFIG_P54_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWL8K=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 9cb2cf2595e0..3321bb576944 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -302,7 +302,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 5924e48fd3ec..009b30372226 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -310,7 +310,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index c0d3156ef640..e214e136101c 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -309,7 +309,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 7aefac5afab0..13885ec563d1 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -169,7 +169,6 @@ CONFIG_USB_USBNET=m
 CONFIG_B43=m
 CONFIG_B43LEGACY=m
 CONFIG_P54_COMMON=m
-CONFIG_PRISM54=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
-- 
2.32.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

