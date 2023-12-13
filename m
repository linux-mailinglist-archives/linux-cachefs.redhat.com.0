Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEUZ46VQMGQEQXI2YPY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2881161E
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:03 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67ef19eec1csf18361566d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481042; cv=pass;
        d=google.com; s=arc-20160816;
        b=gB31ktHDNKcc9IldoWrDAa58ulqVTPdLrRX1vZdwgmHhdBUZ/IjA5C38jC8hhzk/pt
         dz7EwGEau1Fp8IFbfdyNbNPrg4OXgiw6NvtChl/fVIl0DKuu+zGFhjwHkcl1Z/wfj/1l
         4uhO6+w3xDnCJd3S6BlVLrM20oMsKwJpr+U76WJR06Ht/uceu6Va8UMXE1jTJfYxL2cr
         lZWzSNoAbtR6DajXROX8C4m9n+09QKxi5IsXu4gN1iY+w8wyTUzvtUVgNPKqTdooLUUO
         jaRTshQ2MQT1CPjNmQSFbMB+E+UHPqaCfMQz1JWs6TKSHMclWAGv6mhAuUqr6NzCEs4E
         piAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=a+xg1hBVTaB6h9o01HBcziMg98ToDC/7F94bYMKxtB0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Gd87vwrDB4PqanYaK1u9QBHiUpz2Wc5iC0YhBUpNL8Z8UCXgC7qzr+0utCMLlIDPJJ
         zhVMd+OqpQf/yjRo9u0EV2jC06Vkhx8LhIr/FGAG53mxa62dmxXVwZY58E2VolS7+J2U
         +CX8oWqEpQp/EgJlikd21ZnqzgUBxaRctEOCditmB6OcajvAhuasKKjZbTvrZyTFrWf4
         5UiAunSXJmq4u4fo1NHXB6sCtrlBxUmlFbaUW7KCMuG62AS1yLoXQI+3O0OsxeA5AMzu
         OfU+ONT6eQZPdV7ngLHD0mjC8/rAfFlqiR4XrdnIThCSG9keCeSQx33sad1KLcPtP9ZD
         HQmA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481042; x=1703085842;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+xg1hBVTaB6h9o01HBcziMg98ToDC/7F94bYMKxtB0=;
        b=oNhiv7/fc1j4Bouh/S8eBj7zbWoQNiuwYKEmNJ6/WRt3g1a2aoCysdjWzenoXZHHQu
         1/5y54wobBUit3RJJ3sjK1yvuE/hmhEk3hiZg9997zNPDTyqyNnzAUxcbSeztVA6he9J
         WxmrxDz+xm95LqU3LRZZ6/UpbjYVPz0VkbdtGcKXutAl8o3lYMBDeT2Z4O7eK4QnM35z
         4ceytoCYSk2bOUUQxMM/wbwUzy+Z95+ckXNKPn7Fq21RazUzXMfj+yC3v3+TifhBxh8r
         i5jxJ6xD3fgXNbLpQiKUGlWyNatO8t4GrCwit63NZMcWHMGm9fEqRds4zA/SwCpoL4Uq
         xNTw==
X-Gm-Message-State: AOJu0YwD2fazqxoOV0ipeOMd21C2CWw+NZx4oeZTOPS+/bnk/kR3AaaH
	cR/SKklgTVmUh4Dt3pUQdl1wEg==
X-Google-Smtp-Source: AGHT+IHJf1tqD7G9987FmHjESXTwl/m4aMA5tB4ABTuIJ9wGVRolxZBZoXIX0bVTLNXmTmvi/JmHUQ==
X-Received: by 2002:ac8:57ce:0:b0:425:4043:96c9 with SMTP id w14-20020ac857ce000000b00425404396c9mr11315530qta.86.1702481042283;
        Wed, 13 Dec 2023 07:24:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a20:b0:423:731a:7859 with SMTP id
 f32-20020a05622a1a2000b00423731a7859ls2321580qtb.0.-pod-prod-09-us; Wed, 13
 Dec 2023 07:24:01 -0800 (PST)
X-Received: by 2002:a05:622a:506:b0:423:dfb0:475a with SMTP id l6-20020a05622a050600b00423dfb0475amr10902449qtx.52.1702481041720;
        Wed, 13 Dec 2023 07:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481041; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2K4UScz/3ElzvGqlsp6FBVTZIlEfb0SzjNu3rRb1wmYbiaOwCDhljFoIoJzG4B2h1
         x7xMce0Vx+owiWkq8DzY2PHS6JFWSd3RKzX70vZhdTlrVYKLaEZVk741ajIeNVr+lygt
         BrSTvFexa5xhphY5f7XXT0n+pwafwDEYvR2fuL6PtT1c+CbBuqqxXIU6+xJz7rSR35/j
         ybN8tC0KKxr5lhGZbTm1ntB+qBY1gcTJBGs+M1jtZaTISFBLAU+uzJUhqCSIT6wMTSDT
         7+jy8YsOI1i7WRJdEUJiUytduD6phDiHodKbz7zrg7g8/q64kYA/M9JSY19kqwIYP84H
         pwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5AXujXz3QZo64NpPid5/uzblwNcf/fEUZkXIJcV2mdU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=J/fl96IQQTFNP97aTLrD6mqDiH7yR9Up4Vno/DKAIlhW808aEcae9CyeZ874ClrQW+
         PxOutG6GcScMe5YRCT2T+az1f6L87WXjTJmZ4cThZUNU3BROCR3rU8rlYvTQb9u23E6S
         3wKGg1i+zWWT4P6G2d9X0aahHLPeThrXirHtDtvSor35gjMzFZRGbj7vL6GbxI2xFdzK
         SXUrPmz3AiIApe1RDs+jfsAUxt1tY+hzaNUta7ZrOPZSn3+92vF4Suh0BUmd87Ze7sor
         5H723+zPwq4UHKHqDxv2fMDF+FdkgDPZSbCJ6FJEnKlJJf35HDGL6F+6oy6HW1smJrv5
         fWcg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bv24-20020a05622a0a1800b00423a4244003si13769938qtb.392.2023.12.13.07.24.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-zyG70RHENWCz5jIEmR31sw-1; Wed, 13 Dec 2023 10:23:59 -0500
X-MC-Unique: zyG70RHENWCz5jIEmR31sw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C734101CC70
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:23:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 68DD1492BC6; Wed, 13 Dec 2023 15:23:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C2ED492BC8;
	Wed, 13 Dec 2023 15:23:56 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/39] netfs, fscache: Move fs/fscache/* into fs/netfs/
Date: Wed, 13 Dec 2023 15:23:11 +0000
Message-ID: <20231213152350.431591-2-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

There's a problem with dependencies between netfslib and fscache as each
wants to access some functions of the other.  Deal with this by moving
fs/fscache/* into fs/netfs/ and renaming those files to begin with
"fscache-".

For the moment, the moved files are changed as little as possible and an
fscache module is still built.  A subsequent patch will integrate them.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---
 MAINTAINERS                                   |  2 +-
 fs/Kconfig                                    |  1 -
 fs/Makefile                                   |  1 -
 fs/fscache/Kconfig                            | 40 -------------------
 fs/fscache/Makefile                           | 16 --------
 fs/netfs/Kconfig                              | 39 ++++++++++++++++++
 fs/netfs/Makefile                             | 14 ++++++-
 fs/{fscache/cache.c => netfs/fscache_cache.c} |  0
 .../cookie.c => netfs/fscache_cookie.c}       |  0
 .../internal.h => netfs/fscache_internal.h}   |  0
 fs/{fscache/io.c => netfs/fscache_io.c}       |  0
 fs/{fscache/main.c => netfs/fscache_main.c}   |  0
 fs/{fscache/proc.c => netfs/fscache_proc.c}   |  0
 fs/{fscache/stats.c => netfs/fscache_stats.c} |  0
 .../volume.c => netfs/fscache_volume.c}       |  0
 fs/netfs/internal.h                           |  5 +++
 fs/netfs/main.c                               |  5 ++-
 17 files changed, 61 insertions(+), 62 deletions(-)
 delete mode 100644 fs/fscache/Kconfig
 delete mode 100644 fs/fscache/Makefile
 rename fs/{fscache/cache.c => netfs/fscache_cache.c} (100%)
 rename fs/{fscache/cookie.c => netfs/fscache_cookie.c} (100%)
 rename fs/{fscache/internal.h => netfs/fscache_internal.h} (100%)
 rename fs/{fscache/io.c => netfs/fscache_io.c} (100%)
 rename fs/{fscache/main.c => netfs/fscache_main.c} (100%)
 rename fs/{fscache/proc.c => netfs/fscache_proc.c} (100%)
 rename fs/{fscache/stats.c => netfs/fscache_stats.c} (100%)
 rename fs/{fscache/volume.c => netfs/fscache_volume.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 902708b4530d..10eff1e83ec1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8617,7 +8617,7 @@ M:	David Howells <dhowells@redhat.com>
 L:	linux-cachefs@redhat.com (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/filesystems/caching/
-F:	fs/fscache/
+F:	fs/netfs/fscache-*
 F:	include/linux/fscache*.h
 
 FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT
diff --git a/fs/Kconfig b/fs/Kconfig
index cf62d86b514f..26c3821bf1fb 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -140,7 +140,6 @@ source "fs/overlayfs/Kconfig"
 menu "Caches"
 
 source "fs/netfs/Kconfig"
-source "fs/fscache/Kconfig"
 source "fs/cachefiles/Kconfig"
 
 endmenu
diff --git a/fs/Makefile b/fs/Makefile
index 75522f88e763..af7632368e98 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -60,7 +60,6 @@ obj-$(CONFIG_DLM)		+= dlm/
  
 # Do not add any filesystems before this line
 obj-$(CONFIG_NETFS_SUPPORT)	+= netfs/
-obj-$(CONFIG_FSCACHE)		+= fscache/
 obj-$(CONFIG_REISERFS_FS)	+= reiserfs/
 obj-$(CONFIG_EXT4_FS)		+= ext4/
 # We place ext4 before ext2 so that clean ext3 root fs's do NOT mount using the
diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
deleted file mode 100644
index b313a978ae0a..000000000000
--- a/fs/fscache/Kconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-config FSCACHE
-	tristate "General filesystem local caching manager"
-	select NETFS_SUPPORT
-	help
-	  This option enables a generic filesystem caching manager that can be
-	  used by various network and other filesystems to cache data locally.
-	  Different sorts of caches can be plugged in, depending on the
-	  resources available.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
-
-config FSCACHE_STATS
-	bool "Gather statistical information on local caching"
-	depends on FSCACHE && PROC_FS
-	select NETFS_STATS
-	help
-	  This option causes statistical information to be gathered on local
-	  caching and exported through file:
-
-		/proc/fs/fscache/stats
-
-	  The gathering of statistics adds a certain amount of overhead to
-	  execution as there are a quite a few stats gathered, and on a
-	  multi-CPU system these may be on cachelines that keep bouncing
-	  between CPUs.  On the other hand, the stats are very useful for
-	  debugging purposes.  Saying 'Y' here is recommended.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
-
-config FSCACHE_DEBUG
-	bool "Debug FS-Cache"
-	depends on FSCACHE
-	help
-	  This permits debugging to be dynamically enabled in the local caching
-	  management module.  If this is set, the debugging output may be
-	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
diff --git a/fs/fscache/Makefile b/fs/fscache/Makefile
deleted file mode 100644
index afb090ea16c4..000000000000
--- a/fs/fscache/Makefile
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for general filesystem caching code
-#
-
-fscache-y := \
-	cache.o \
-	cookie.o \
-	io.o \
-	main.o \
-	volume.o
-
-fscache-$(CONFIG_PROC_FS) += proc.o
-fscache-$(CONFIG_FSCACHE_STATS) += stats.o
-
-obj-$(CONFIG_FSCACHE) := fscache.o
diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index b4db21022cb4..b4378688357c 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -21,3 +21,42 @@ config NETFS_STATS
 	  multi-CPU system these may be on cachelines that keep bouncing
 	  between CPUs.  On the other hand, the stats are very useful for
 	  debugging purposes.  Saying 'Y' here is recommended.
+
+config FSCACHE
+	tristate "General filesystem local caching manager"
+	select NETFS_SUPPORT
+	help
+	  This option enables a generic filesystem caching manager that can be
+	  used by various network and other filesystems to cache data locally.
+	  Different sorts of caches can be plugged in, depending on the
+	  resources available.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
+
+config FSCACHE_STATS
+	bool "Gather statistical information on local caching"
+	depends on FSCACHE && PROC_FS
+	select NETFS_STATS
+	help
+	  This option causes statistical information to be gathered on local
+	  caching and exported through file:
+
+		/proc/fs/fscache/stats
+
+	  The gathering of statistics adds a certain amount of overhead to
+	  execution as there are a quite a few stats gathered, and on a
+	  multi-CPU system these may be on cachelines that keep bouncing
+	  between CPUs.  On the other hand, the stats are very useful for
+	  debugging purposes.  Saying 'Y' here is recommended.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
+
+config FSCACHE_DEBUG
+	bool "Debug FS-Cache"
+	depends on FSCACHE
+	help
+	  This permits debugging to be dynamically enabled in the local caching
+	  management module.  If this is set, the debugging output may be
+	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 386d6fb92793..bbb2b824bd5e 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 
+fscache-y := \
+	fscache_cache.o \
+	fscache_cookie.o \
+	fscache_io.o \
+	fscache_main.o \
+	fscache_volume.o
+
+fscache-$(CONFIG_PROC_FS) += fscache_proc.o
+fscache-$(CONFIG_FSCACHE_STATS) += fscache_stats.o
+
+obj-$(CONFIG_FSCACHE) := fscache.o
+
 netfs-y := \
 	buffered_read.o \
 	io.o \
@@ -9,4 +21,4 @@ netfs-y := \
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
 
-obj-$(CONFIG_NETFS_SUPPORT) := netfs.o
+obj-$(CONFIG_NETFS_SUPPORT) += netfs.o
diff --git a/fs/fscache/cache.c b/fs/netfs/fscache_cache.c
similarity index 100%
rename from fs/fscache/cache.c
rename to fs/netfs/fscache_cache.c
diff --git a/fs/fscache/cookie.c b/fs/netfs/fscache_cookie.c
similarity index 100%
rename from fs/fscache/cookie.c
rename to fs/netfs/fscache_cookie.c
diff --git a/fs/fscache/internal.h b/fs/netfs/fscache_internal.h
similarity index 100%
rename from fs/fscache/internal.h
rename to fs/netfs/fscache_internal.h
diff --git a/fs/fscache/io.c b/fs/netfs/fscache_io.c
similarity index 100%
rename from fs/fscache/io.c
rename to fs/netfs/fscache_io.c
diff --git a/fs/fscache/main.c b/fs/netfs/fscache_main.c
similarity index 100%
rename from fs/fscache/main.c
rename to fs/netfs/fscache_main.c
diff --git a/fs/fscache/proc.c b/fs/netfs/fscache_proc.c
similarity index 100%
rename from fs/fscache/proc.c
rename to fs/netfs/fscache_proc.c
diff --git a/fs/fscache/stats.c b/fs/netfs/fscache_stats.c
similarity index 100%
rename from fs/fscache/stats.c
rename to fs/netfs/fscache_stats.c
diff --git a/fs/fscache/volume.c b/fs/netfs/fscache_volume.c
similarity index 100%
rename from fs/fscache/volume.c
rename to fs/netfs/fscache_volume.c
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 43fac1b14e40..e96432499eb2 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -5,9 +5,12 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <linux/slab.h>
+#include <linux/seq_file.h>
 #include <linux/netfs.h>
 #include <linux/fscache.h>
 #include <trace/events/netfs.h>
+#include "fscache_internal.h"
 
 #ifdef pr_fmt
 #undef pr_fmt
@@ -107,6 +110,7 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
 /*
  * debug tracing
  */
+#if 0
 #define dbgprintk(FMT, ...) \
 	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
 
@@ -143,3 +147,4 @@ do {						\
 #define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
 #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
 #endif
+#endif
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 068568702957..237c54a01d97 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -8,8 +8,8 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include "internal.h"
-#define CREATE_TRACE_POINTS
-#include <trace/events/netfs.h>
+//#define CREATE_TRACE_POINTS
+//#include <trace/events/netfs.h>
 
 MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
@@ -18,3 +18,4 @@ MODULE_LICENSE("GPL");
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
+

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

