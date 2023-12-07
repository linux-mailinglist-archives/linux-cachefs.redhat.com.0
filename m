Return-Path: <linux-cachefs+bncBDLIXLMFVAERBCPPZCVQMGQE4OIYP6I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A45809339
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:19 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58d95645871sf1416742eaf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984138; cv=pass;
        d=google.com; s=arc-20160816;
        b=iqOODsL7imAeKBaj1uRP4wGQM4rTI1M30c+Hnnf63ME1S65L6P1WuLfP5WUDcw5Xv4
         bX+Veaw/tcZwKLDDVQemgqsRqnKEjeWrxmb6Jbk1+5/88hh9sVR2LKlzjj4lateDmNqf
         7QNArEGAwA5irFPHGRWkm0SGkrnrpakoiW4iOktwCl/8OyA0zrOov14ExBpnHsy3KT1S
         lqYf7bAw0ATBmQEdcgCBarg3jr+qwwZfi8IlHMkuktxybE3O8AWko8ghQZRVglsbc+Ox
         vxAxNfchasOArwsUmtnYgh42vCmDSFRigxZ2N3NakUW8hTPf2LcoRuV/mJz3HIVPl8WW
         zxfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=QH8kTTKxzGHhBuCQsFo9q8UBa6hcRQeDV9N6wRV243M=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=wG373wrkwPOJBDdGFtHl7RhNzEIS7kiVO5kvlVDSkTH8jJpb9zfriiBGCQ5hBNNK/E
         8PZJnSunUtg1G/X+ojNMXiQSQ7wzTO2Jcyj4Tfc7Ueggk2eMGPdtThFQALBKRtWNyN1b
         2Na3PF9RPX6WxligIv6MxgL7Vg7Zo32Cwu6rL7vhg+HocGiRNcEjtydFOnTTYqGNst3s
         gZoWpFCqUdw13mjYrzCfwluR2THqPNMosUHaH7pMy284YC67+qWJYXmj2NLXggfjV34d
         /yS4MNZI9+rPYZV6RuA+Yj8znB70BuAQNhMhb1T1Q0E9sWUotZBFZuJACb8+mcSjZ7tD
         ulzw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984138; x=1702588938;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH8kTTKxzGHhBuCQsFo9q8UBa6hcRQeDV9N6wRV243M=;
        b=ZH+vbwDWBWaTMK6InuAYhKzObovfudO+CBBSH/4xJrpJweGXOZfwSeU/ca7pon2kIS
         fb8oaPGKT+p1S4Vz3lQEqkDOiDrdTA9DZD1XqthW+O8cRb3S5Ztf70QIEFmKhchNo9XD
         g3DJwfwus8h8DavIjOBBDguYXnIyYQDlUHPcitRazuptTEeEcpAXdpKLeB/PA5H/CLs5
         DUPQ1/ZV1tvh02dLGT70+6SIML1WuB9A0NmT+O6R0blkm3Q0briJ/r1yfKsI3zWAhk/n
         G5cyTPi+UTXjyMKgpdGJN/p84tjoNGsewkar4XK3fzKrBG7qqkVM8Da1gepyi047m2sm
         enrQ==
X-Gm-Message-State: AOJu0YwpQj0xA7Yb/gyDxmh3BZyn9lTNHB6OKJ3qME/dzcoY6bTQwwYL
	djPf+c+ARTxlA0TeX7ATC03eWg==
X-Google-Smtp-Source: AGHT+IHoOWOQSA3eTVb4gVT2iVF8R/GEkGupd2F1JRMOBcPSvcVOSVMVRBuxM4HROie/yVQnN4D48Q==
X-Received: by 2002:a05:6358:248b:b0:16d:bd2f:a832 with SMTP id m11-20020a056358248b00b0016dbd2fa832mr2472668rwc.17.1701984137685;
        Thu, 07 Dec 2023 13:22:17 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:d648:0:b0:67a:203f:dbc7 with SMTP id e8-20020a0cd648000000b0067a203fdbc7ls1250081qvj.1.-pod-prod-06-us;
 Thu, 07 Dec 2023 13:22:17 -0800 (PST)
X-Received: by 2002:a05:6214:5817:b0:67a:a721:d781 with SMTP id mk23-20020a056214581700b0067aa721d781mr3712579qvb.103.1701984137098;
        Thu, 07 Dec 2023 13:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984137; cv=none;
        d=google.com; s=arc-20160816;
        b=MskBeIjtgWVQCgnM5DTxZC2sWNH7fUZPSnF5UrwFhQnZw1GaRAiEjn7bT1MzwNAZdf
         O61gxiVASwvHDczchg3rA27k/+hqw7M+cIHO5tMlm8snq6FRPztRpby4VWmaTEVOOQ/D
         2FpD8X24CcY9be8hNr0997drLPkw4hTOqqZvQhjZQqhDIahRDIVWewvdgSlryZsDt8PM
         qwSof1xg1zKsHAhwxg1teAgiUsent10smVxTCouHBfVTCbdCa97HMGPZGTZs6Ad1cHGE
         CEXtm8t+Wj6Y6wd9VhfkhuPO8+Ud20NpHHnlsW50+BhANq8k5TqePnIDl9QxADbLpNu0
         itSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=IzuVkw4VZ3UrV6xGBCZQd4vHNMJ381OqDJgz5iHnyqI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ix99GfDc4r3mZU4U7aesALROb+XHhue0qQAIl2rLfLp3NcsflfUzqt0tjz7N+51YdC
         XcljOzC+/t/ZE5i2WBht33L49dKIO2jIZRsFPEnyXvftqMlU7rZO0YchZFXIUNNDXOB6
         6Il31WrlaO2j/2kFtbVmP/vpcOTSJWYuY2OTW9CQOkVNyM7z0WQYWe9Y3QHdFvO5RDqk
         8VJagjUtfYpOKU2N3VLWcKND00yMc853bUwyvfdGMuUYx8s1hiwL2htAqNw2CpxPmeW/
         QutPvLuQJPS11fHImBEfHrQP18GEpfre7aLel7htoLSt52Ihtj+6MxkjKkSWHwvIayuI
         BcvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id f11-20020a056214164b00b0067a1d3d8b52si627183qvw.568.2023.12.07.13.22.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-Xyik83X3MZmGfS30U9OYWw-1; Thu,
 07 Dec 2023 16:22:15 -0500
X-MC-Unique: Xyik83X3MZmGfS30U9OYWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD2C29AC00A
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 172B1111E400; Thu,  7 Dec 2023 21:22:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75263112131D;
	Thu,  7 Dec 2023 21:22:12 +0000 (UTC)
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
Subject: [PATCH v3 01/59] netfs, fscache: Move fs/fscache/* into fs/netfs/
Date: Thu,  7 Dec 2023 21:21:08 +0000
Message-ID: <20231207212206.1379128-2-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
 fs/netfs/main.c                               |  1 +
 17 files changed, 59 insertions(+), 60 deletions(-)
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
index a229ce6f4169..d6bb71b65032 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8601,7 +8601,7 @@ M:	David Howells <dhowells@redhat.com>
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
index 068568702957..1f3d5a9e0a12 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -15,6 +15,7 @@ MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+unsigned fscache_debug;
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

