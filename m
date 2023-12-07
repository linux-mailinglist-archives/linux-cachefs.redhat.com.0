Return-Path: <linux-cachefs+bncBDLIXLMFVAERBDPPZCVQMGQE76TFD4Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0280933A
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:22 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1faf4442fa5sf2449206fac.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984141; cv=pass;
        d=google.com; s=arc-20160816;
        b=RNRnE6enfRqkoiHUQwH4Mfev0sJlVhQuwCFGyC1Qkyb7HdPgUgwGWI9GDeQ/agaLh3
         3kHk12Cv8uVrYcyDapSgoH1IrfsH7yC0DLGgZP6OQUEwHa4WXguga0Th0ZreKuDNZ08t
         898z6MGDo7xDpM3vTdwCkHfENWihNQg09hRlESYHZAyWodWXYdSrZJIbB2m3il/cEq1z
         u3D0V9DEWd6LFmDttDtPxHTv85VjJrPl99aq9gH9MwXZuYgF4h3RX+C4b7v+UnKUoduw
         XxpN9IAbJfJYHjn9YcR5wqRFNSv7si0GP2eAJ+5Ln9BaFy+0zvgT9ub96X15ojbx9370
         8MwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OU2k5YlqnilviSN59LVx5NvmcH2raw5rV0IR6ct6lT8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=hSGWB5jqjAOT45rSddtwME5LRS/P59MmFfhmSVjhqTIXVdC4ra+miw3KXtxtJAfrMP
         kBkevk+kC2fy+TMnB/aeBvlYiXlSZ9D5VQUn1EoRoec/HcR5ep4z/cfuDiR1slxcLPXM
         Lj3TKoXmbbxvpDMAKAsCzyLqu7mtYaFoo76QTQuiLSPy1rt5Rn2nCx8sDY/nQ1L6x47j
         pv0W2KBLDWHvOA8OcR06rnNhpiEs41BaPuwbIOaEaRFy4sM31gclC/nhsLKOWuUOA+GL
         L+WGJ+dFG+8yRghz1gMgrKl+WZFBq7oZiJYoV+7yTU+KxKihenSz6X3noLx8SiuDe855
         Z2FA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984141; x=1702588941;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU2k5YlqnilviSN59LVx5NvmcH2raw5rV0IR6ct6lT8=;
        b=clC9/WP2sy0kXkJgl0ZbKjwjk3ZCfwDjCwo5+upDQnq7ZsWeLvww8HuUoHaECYORVE
         tYA3oGGFWVlescfMTFzrV5UrNmO0u6VmbzgosdhJqxrs+DdpazalZFdb6KKO85/L3+54
         yeB8oCyKWihPEgqb8vkU3DIFK7TiX5gcS8kH8KynOkz2LavTo9vnZba1SiV5ABakmyp+
         rZkXiuWFhr5gTQ4CyktIKCFTpCmi8hUAwkjbFg6NJ+uSVEOGgD52WXor9ukETlhwalgD
         JpQBFKgMxB80ZMXsEPiloRAY1vbmsyWGJEwEHZWwlIQiH7AO59bqQUu4Xvcvk3DmVu7q
         yOKQ==
X-Gm-Message-State: AOJu0Yzmg/oBgQxknlEpDKnyUZe4iPmwAbyf+udCH3L3BcpgpchDSKcN
	B33PjQDcHYh9GNO1Se5VT7L30g==
X-Google-Smtp-Source: AGHT+IE99ql5lkjrAV113vngtyVYzYvYTmEfjlKnbjnigIfS7kF8SojuMNci89atnyJiZ0uIwqP3eg==
X-Received: by 2002:a05:6870:82a2:b0:1fb:75a:6d38 with SMTP id q34-20020a05687082a200b001fb075a6d38mr3773586oae.95.1701984141500;
        Thu, 07 Dec 2023 13:22:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:421:c71a:9295 with SMTP id
 s36-20020a05622a1aa400b00421c71a9295ls1445694qtc.0.-pod-prod-01-us; Thu, 07
 Dec 2023 13:22:21 -0800 (PST)
X-Received: by 2002:a05:622a:44d:b0:425:8abd:f475 with SMTP id o13-20020a05622a044d00b004258abdf475mr2572851qtx.69.1701984140975;
        Thu, 07 Dec 2023 13:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984140; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrxxNr4vdI1Ab5bkxfwW3QkLzrOd48H9Bg/GlmworLrOWUGQsVq4Ch8yJ/oQ4MOeFS
         ZyPBT2thaBTiQT0Meh2Ae/zZdFEH/tSaLGHgfjKpC+5XacD/doL1mo3ZY2pFxgPAv/+1
         cbgHqR28Nc9bPs/NvjISe+q1GhqefB6WBAGp/M+fPVHhjWIUev4pIIpDSD9jQadHN7Uo
         hwlinx7ZXJmnTNfQ7p2bZhU2y1AUMcTCQnTfsHaTYoGBP8HspmYEKgQwx2HYz6W7YzY6
         +ZWmdJio69myqxgiY+oh3MjY8sPySlnIJKEZrOpgvW36rpBxbkn0bsFCna6PF6G4Gx/8
         luyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9Y9euyWEGfidgx/vKsfjsLN27GtF1QcJe/xeicFqYw8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=pgKpBewIDje6bSOLqv+KfTbRyVuxolYWKpJqI4qVjGwSV/FGOtRM+rC0DqwuI3gU5F
         tSDWZIqlKl+xiLmjmXW5l1bAvJPGSxvt7Pzj524ql0FhhfK+Q++4NXX00eCSYgKqsTpi
         /CY0TxitRhAUZqF5QztHuHmdqmc6muj4DbyfpkhbwxwuaziMpbtRnEmbthLZV7MJhYRT
         efk3Po+ciLZ2o11EJlHRMxcU+D5hw0tXeoAFlMYwPLa6Bq+HoFtSDw9fzcOYFo81c8dV
         XYdMAFfDCyB/ihrxRVb7hvTiIXZGOa6MewpSgLJOG6aJy4nbUOGVrjKPsdw87ZaDkhGk
         wopg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id ey10-20020a05622a4c0a00b0042582c44cdbsi795636qtb.188.2023.12.07.13.22.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-I3qKjOKqMxClcml2aw7PLw-1; Thu, 07 Dec 2023 16:22:18 -0500
X-MC-Unique: I3qKjOKqMxClcml2aw7PLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D954845DC1
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7A01840C6E30; Thu,  7 Dec 2023 21:22:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAD7B40C6EB9;
	Thu,  7 Dec 2023 21:22:15 +0000 (UTC)
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
Subject: [PATCH v3 02/59] netfs, fscache: Combine fscache with netfs
Date: Thu,  7 Dec 2023 21:21:09 +0000
Message-ID: <20231207212206.1379128-3-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Now that the fscache code is moved to be colocated with the netfslib code
so that they combined into one module, do the combining.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---
 fs/netfs/Kconfig            |   4 +-
 fs/netfs/Makefile           |  24 ++--
 fs/netfs/fscache_internal.h | 267 +-----------------------------------
 fs/netfs/fscache_main.c     |  17 +--
 fs/netfs/internal.h         | 194 +++++++++++++++++++++++++-
 fs/netfs/main.c             |   1 -
 fs/nfs/Kconfig              |   4 +-
 7 files changed, 213 insertions(+), 298 deletions(-)

diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index b4378688357c..bec805e0c44c 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -23,8 +23,8 @@ config NETFS_STATS
 	  debugging purposes.  Saying 'Y' here is recommended.
 
 config FSCACHE
-	tristate "General filesystem local caching manager"
-	select NETFS_SUPPORT
+	bool "General filesystem local caching manager"
+	depends on NETFS_SUPPORT
 	help
 	  This option enables a generic filesystem caching manager that can be
 	  used by various network and other filesystems to cache data locally.
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index bbb2b824bd5e..b57162ef9cfb 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,17 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-fscache-y := \
-	fscache_cache.o \
-	fscache_cookie.o \
-	fscache_io.o \
-	fscache_main.o \
-	fscache_volume.o
-
-fscache-$(CONFIG_PROC_FS) += fscache_proc.o
-fscache-$(CONFIG_FSCACHE_STATS) += fscache_stats.o
-
-obj-$(CONFIG_FSCACHE) := fscache.o
-
 netfs-y := \
 	buffered_read.o \
 	io.o \
@@ -21,4 +9,16 @@ netfs-y := \
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
 
+netfs-$(CONFIG_FSCACHE) += \
+	fscache_cache.o \
+	fscache_cookie.o \
+	fscache_io.o \
+	fscache_main.o \
+	fscache_volume.o
+
+ifeq ($(CONFIG_PROC_FS),y)
+netfs-$(CONFIG_FSCACHE) += fscache_proc.o
+endif
+netfs-$(CONFIG_FSCACHE_STATS) += fscache_stats.o
+
 obj-$(CONFIG_NETFS_SUPPORT) += netfs.o
diff --git a/fs/netfs/fscache_internal.h b/fs/netfs/fscache_internal.h
index 1336f517e9b1..a09b948fcef2 100644
--- a/fs/netfs/fscache_internal.h
+++ b/fs/netfs/fscache_internal.h
@@ -5,273 +5,10 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include "internal.h"
+
 #ifdef pr_fmt
 #undef pr_fmt
 #endif
 
 #define pr_fmt(fmt) "FS-Cache: " fmt
-
-#include <linux/slab.h>
-#include <linux/fscache-cache.h>
-#include <trace/events/fscache.h>
-#include <linux/sched.h>
-#include <linux/seq_file.h>
-
-/*
- * cache.c
- */
-#ifdef CONFIG_PROC_FS
-extern const struct seq_operations fscache_caches_seq_ops;
-#endif
-bool fscache_begin_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
-void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
-struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache);
-void fscache_put_cache(struct fscache_cache *cache, enum fscache_cache_trace where);
-
-static inline enum fscache_cache_state fscache_cache_state(const struct fscache_cache *cache)
-{
-	return smp_load_acquire(&cache->state);
-}
-
-static inline bool fscache_cache_is_live(const struct fscache_cache *cache)
-{
-	return fscache_cache_state(cache) == FSCACHE_CACHE_IS_ACTIVE;
-}
-
-static inline void fscache_set_cache_state(struct fscache_cache *cache,
-					   enum fscache_cache_state new_state)
-{
-	smp_store_release(&cache->state, new_state);
-
-}
-
-static inline bool fscache_set_cache_state_maybe(struct fscache_cache *cache,
-						 enum fscache_cache_state old_state,
-						 enum fscache_cache_state new_state)
-{
-	return try_cmpxchg_release(&cache->state, &old_state, new_state);
-}
-
-/*
- * cookie.c
- */
-extern struct kmem_cache *fscache_cookie_jar;
-#ifdef CONFIG_PROC_FS
-extern const struct seq_operations fscache_cookies_seq_ops;
-#endif
-extern struct timer_list fscache_cookie_lru_timer;
-
-extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
-extern bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
-					enum fscache_access_trace why);
-
-static inline void fscache_see_cookie(struct fscache_cookie *cookie,
-				      enum fscache_cookie_trace where)
-{
-	trace_fscache_cookie(cookie->debug_id, refcount_read(&cookie->ref),
-			     where);
-}
-
-/*
- * main.c
- */
-extern unsigned fscache_debug;
-
-extern unsigned int fscache_hash(unsigned int salt, const void *data, size_t len);
-
-/*
- * proc.c
- */
-#ifdef CONFIG_PROC_FS
-extern int __init fscache_proc_init(void);
-extern void fscache_proc_cleanup(void);
-#else
-#define fscache_proc_init()	(0)
-#define fscache_proc_cleanup()	do {} while (0)
-#endif
-
-/*
- * stats.c
- */
-#ifdef CONFIG_FSCACHE_STATS
-extern atomic_t fscache_n_volumes;
-extern atomic_t fscache_n_volumes_collision;
-extern atomic_t fscache_n_volumes_nomem;
-extern atomic_t fscache_n_cookies;
-extern atomic_t fscache_n_cookies_lru;
-extern atomic_t fscache_n_cookies_lru_expired;
-extern atomic_t fscache_n_cookies_lru_removed;
-extern atomic_t fscache_n_cookies_lru_dropped;
-
-extern atomic_t fscache_n_acquires;
-extern atomic_t fscache_n_acquires_ok;
-extern atomic_t fscache_n_acquires_oom;
-
-extern atomic_t fscache_n_invalidates;
-
-extern atomic_t fscache_n_relinquishes;
-extern atomic_t fscache_n_relinquishes_retire;
-extern atomic_t fscache_n_relinquishes_dropped;
-
-extern atomic_t fscache_n_resizes;
-extern atomic_t fscache_n_resizes_null;
-
-static inline void fscache_stat(atomic_t *stat)
-{
-	atomic_inc(stat);
-}
-
-static inline void fscache_stat_d(atomic_t *stat)
-{
-	atomic_dec(stat);
-}
-
-#define __fscache_stat(stat) (stat)
-
-int fscache_stats_show(struct seq_file *m, void *v);
-#else
-
-#define __fscache_stat(stat) (NULL)
-#define fscache_stat(stat) do {} while (0)
-#define fscache_stat_d(stat) do {} while (0)
-#endif
-
-/*
- * volume.c
- */
-#ifdef CONFIG_PROC_FS
-extern const struct seq_operations fscache_volumes_seq_ops;
-#endif
-
-struct fscache_volume *fscache_get_volume(struct fscache_volume *volume,
-					  enum fscache_volume_trace where);
-void fscache_put_volume(struct fscache_volume *volume,
-			enum fscache_volume_trace where);
-bool fscache_begin_volume_access(struct fscache_volume *volume,
-				 struct fscache_cookie *cookie,
-				 enum fscache_access_trace why);
-void fscache_create_volume(struct fscache_volume *volume, bool wait);
-
-
-/*****************************************************************************/
-/*
- * debug tracing
- */
-#define dbgprintk(FMT, ...) \
-	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
-
-#define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
-#define kleave(FMT, ...) dbgprintk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
-#define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
-
-#define kjournal(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
-
-#ifdef __KDEBUG
-#define _enter(FMT, ...) kenter(FMT, ##__VA_ARGS__)
-#define _leave(FMT, ...) kleave(FMT, ##__VA_ARGS__)
-#define _debug(FMT, ...) kdebug(FMT, ##__VA_ARGS__)
-
-#elif defined(CONFIG_FSCACHE_DEBUG)
-#define _enter(FMT, ...)			\
-do {						\
-	if (__do_kdebug(ENTER))			\
-		kenter(FMT, ##__VA_ARGS__);	\
-} while (0)
-
-#define _leave(FMT, ...)			\
-do {						\
-	if (__do_kdebug(LEAVE))			\
-		kleave(FMT, ##__VA_ARGS__);	\
-} while (0)
-
-#define _debug(FMT, ...)			\
-do {						\
-	if (__do_kdebug(DEBUG))			\
-		kdebug(FMT, ##__VA_ARGS__);	\
-} while (0)
-
-#else
-#define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
-#define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
-#define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
-#endif
-
-/*
- * determine whether a particular optional debugging point should be logged
- * - we need to go through three steps to persuade cpp to correctly join the
- *   shorthand in FSCACHE_DEBUG_LEVEL with its prefix
- */
-#define ____do_kdebug(LEVEL, POINT) \
-	unlikely((fscache_debug & \
-		  (FSCACHE_POINT_##POINT << (FSCACHE_DEBUG_ ## LEVEL * 3))))
-#define ___do_kdebug(LEVEL, POINT) \
-	____do_kdebug(LEVEL, POINT)
-#define __do_kdebug(POINT) \
-	___do_kdebug(FSCACHE_DEBUG_LEVEL, POINT)
-
-#define FSCACHE_DEBUG_CACHE	0
-#define FSCACHE_DEBUG_COOKIE	1
-#define FSCACHE_DEBUG_OBJECT	2
-#define FSCACHE_DEBUG_OPERATION	3
-
-#define FSCACHE_POINT_ENTER	1
-#define FSCACHE_POINT_LEAVE	2
-#define FSCACHE_POINT_DEBUG	4
-
-#ifndef FSCACHE_DEBUG_LEVEL
-#define FSCACHE_DEBUG_LEVEL CACHE
-#endif
-
-/*
- * assertions
- */
-#if 1 /* defined(__KDEBUGALL) */
-
-#define ASSERT(X)							\
-do {									\
-	if (unlikely(!(X))) {						\
-		pr_err("\n");					\
-		pr_err("Assertion failed\n");	\
-		BUG();							\
-	}								\
-} while (0)
-
-#define ASSERTCMP(X, OP, Y)						\
-do {									\
-	if (unlikely(!((X) OP (Y)))) {					\
-		pr_err("\n");					\
-		pr_err("Assertion failed\n");	\
-		pr_err("%lx " #OP " %lx is false\n",		\
-		       (unsigned long)(X), (unsigned long)(Y));		\
-		BUG();							\
-	}								\
-} while (0)
-
-#define ASSERTIF(C, X)							\
-do {									\
-	if (unlikely((C) && !(X))) {					\
-		pr_err("\n");					\
-		pr_err("Assertion failed\n");	\
-		BUG();							\
-	}								\
-} while (0)
-
-#define ASSERTIFCMP(C, X, OP, Y)					\
-do {									\
-	if (unlikely((C) && !((X) OP (Y)))) {				\
-		pr_err("\n");					\
-		pr_err("Assertion failed\n");	\
-		pr_err("%lx " #OP " %lx is false\n",		\
-		       (unsigned long)(X), (unsigned long)(Y));		\
-		BUG();							\
-	}								\
-} while (0)
-
-#else
-
-#define ASSERT(X)			do {} while (0)
-#define ASSERTCMP(X, OP, Y)		do {} while (0)
-#define ASSERTIF(C, X)			do {} while (0)
-#define ASSERTIFCMP(C, X, OP, Y)	do {} while (0)
-
-#endif /* assert or not */
diff --git a/fs/netfs/fscache_main.c b/fs/netfs/fscache_main.c
index dad85fd84f6f..00600a4d9ce5 100644
--- a/fs/netfs/fscache_main.c
+++ b/fs/netfs/fscache_main.c
@@ -8,18 +8,9 @@
 #define FSCACHE_DEBUG_LEVEL CACHE
 #include <linux/module.h>
 #include <linux/init.h>
-#define CREATE_TRACE_POINTS
 #include "internal.h"
-
-MODULE_DESCRIPTION("FS Cache Manager");
-MODULE_AUTHOR("Red Hat, Inc.");
-MODULE_LICENSE("GPL");
-
-unsigned fscache_debug;
-module_param_named(debug, fscache_debug, uint,
-		   S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(fscache_debug,
-		 "FS-Cache debugging mask");
+#define CREATE_TRACE_POINTS
+#include <trace/events/fscache.h>
 
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_cache);
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_volume);
@@ -92,7 +83,7 @@ static int __init fscache_init(void)
 		goto error_cookie_jar;
 	}
 
-	pr_notice("Loaded\n");
+	pr_notice("FS-Cache loaded\n");
 	return 0;
 
 error_cookie_jar:
@@ -115,7 +106,7 @@ static void __exit fscache_exit(void)
 	kmem_cache_destroy(fscache_cookie_jar);
 	fscache_proc_cleanup();
 	destroy_workqueue(fscache_wq);
-	pr_notice("Unloaded\n");
+	pr_notice("FS-Cache unloaded\n");
 }
 
 module_exit(fscache_exit);
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index e96432499eb2..dc764b98c7f0 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -9,8 +9,9 @@
 #include <linux/seq_file.h>
 #include <linux/netfs.h>
 #include <linux/fscache.h>
+#include <linux/fscache-cache.h>
 #include <trace/events/netfs.h>
-#include "fscache_internal.h"
+#include <trace/events/fscache.h>
 
 #ifdef pr_fmt
 #undef pr_fmt
@@ -106,11 +107,145 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
 #endif
 }
 
+/*
+ * fscache-cache.c
+ */
+#ifdef CONFIG_PROC_FS
+extern const struct seq_operations fscache_caches_seq_ops;
+#endif
+bool fscache_begin_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
+void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
+struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache);
+void fscache_put_cache(struct fscache_cache *cache, enum fscache_cache_trace where);
+
+static inline enum fscache_cache_state fscache_cache_state(const struct fscache_cache *cache)
+{
+	return smp_load_acquire(&cache->state);
+}
+
+static inline bool fscache_cache_is_live(const struct fscache_cache *cache)
+{
+	return fscache_cache_state(cache) == FSCACHE_CACHE_IS_ACTIVE;
+}
+
+static inline void fscache_set_cache_state(struct fscache_cache *cache,
+					   enum fscache_cache_state new_state)
+{
+	smp_store_release(&cache->state, new_state);
+
+}
+
+static inline bool fscache_set_cache_state_maybe(struct fscache_cache *cache,
+						 enum fscache_cache_state old_state,
+						 enum fscache_cache_state new_state)
+{
+	return try_cmpxchg_release(&cache->state, &old_state, new_state);
+}
+
+/*
+ * fscache-cookie.c
+ */
+extern struct kmem_cache *fscache_cookie_jar;
+#ifdef CONFIG_PROC_FS
+extern const struct seq_operations fscache_cookies_seq_ops;
+#endif
+extern struct timer_list fscache_cookie_lru_timer;
+
+extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
+extern bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
+					enum fscache_access_trace why);
+
+static inline void fscache_see_cookie(struct fscache_cookie *cookie,
+				      enum fscache_cookie_trace where)
+{
+	trace_fscache_cookie(cookie->debug_id, refcount_read(&cookie->ref),
+			     where);
+}
+
+/*
+ * fscache-main.c
+ */
+extern unsigned fscache_debug;
+
+extern unsigned int fscache_hash(unsigned int salt, const void *data, size_t len);
+
+/*
+ * fscache-proc.c
+ */
+#ifdef CONFIG_PROC_FS
+extern int __init fscache_proc_init(void);
+extern void fscache_proc_cleanup(void);
+#else
+#define fscache_proc_init()	(0)
+#define fscache_proc_cleanup()	do {} while (0)
+#endif
+
+/*
+ * fscache-stats.c
+ */
+#ifdef CONFIG_FSCACHE_STATS
+extern atomic_t fscache_n_volumes;
+extern atomic_t fscache_n_volumes_collision;
+extern atomic_t fscache_n_volumes_nomem;
+extern atomic_t fscache_n_cookies;
+extern atomic_t fscache_n_cookies_lru;
+extern atomic_t fscache_n_cookies_lru_expired;
+extern atomic_t fscache_n_cookies_lru_removed;
+extern atomic_t fscache_n_cookies_lru_dropped;
+
+extern atomic_t fscache_n_acquires;
+extern atomic_t fscache_n_acquires_ok;
+extern atomic_t fscache_n_acquires_oom;
+
+extern atomic_t fscache_n_invalidates;
+
+extern atomic_t fscache_n_relinquishes;
+extern atomic_t fscache_n_relinquishes_retire;
+extern atomic_t fscache_n_relinquishes_dropped;
+
+extern atomic_t fscache_n_resizes;
+extern atomic_t fscache_n_resizes_null;
+
+static inline void fscache_stat(atomic_t *stat)
+{
+	atomic_inc(stat);
+}
+
+static inline void fscache_stat_d(atomic_t *stat)
+{
+	atomic_dec(stat);
+}
+
+#define __fscache_stat(stat) (stat)
+
+int fscache_stats_show(struct seq_file *m, void *v);
+#else
+
+#define __fscache_stat(stat) (NULL)
+#define fscache_stat(stat) do {} while (0)
+#define fscache_stat_d(stat) do {} while (0)
+#endif
+
+/*
+ * fscache-volume.c
+ */
+#ifdef CONFIG_PROC_FS
+extern const struct seq_operations fscache_volumes_seq_ops;
+#endif
+
+struct fscache_volume *fscache_get_volume(struct fscache_volume *volume,
+					  enum fscache_volume_trace where);
+void fscache_put_volume(struct fscache_volume *volume,
+			enum fscache_volume_trace where);
+bool fscache_begin_volume_access(struct fscache_volume *volume,
+				 struct fscache_cookie *cookie,
+				 enum fscache_access_trace why);
+void fscache_create_volume(struct fscache_volume *volume, bool wait);
+
 /*****************************************************************************/
 /*
  * debug tracing
  */
-#if 0
 #define dbgprintk(FMT, ...) \
 	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
 
@@ -147,4 +282,57 @@ do {						\
 #define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
 #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
 #endif
-#endif
+
+/*
+ * assertions
+ */
+#if 1 /* defined(__KDEBUGALL) */
+
+#define ASSERT(X)							\
+do {									\
+	if (unlikely(!(X))) {						\
+		pr_err("\n");					\
+		pr_err("Assertion failed\n");	\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTCMP(X, OP, Y)						\
+do {									\
+	if (unlikely(!((X) OP (Y)))) {					\
+		pr_err("\n");					\
+		pr_err("Assertion failed\n");	\
+		pr_err("%lx " #OP " %lx is false\n",		\
+		       (unsigned long)(X), (unsigned long)(Y));		\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTIF(C, X)							\
+do {									\
+	if (unlikely((C) && !(X))) {					\
+		pr_err("\n");					\
+		pr_err("Assertion failed\n");	\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTIFCMP(C, X, OP, Y)					\
+do {									\
+	if (unlikely((C) && !((X) OP (Y)))) {				\
+		pr_err("\n");					\
+		pr_err("Assertion failed\n");	\
+		pr_err("%lx " #OP " %lx is false\n",		\
+		       (unsigned long)(X), (unsigned long)(Y));		\
+		BUG();							\
+	}								\
+} while (0)
+
+#else
+
+#define ASSERT(X)			do {} while (0)
+#define ASSERTCMP(X, OP, Y)		do {} while (0)
+#define ASSERTIF(C, X)			do {} while (0)
+#define ASSERTIFCMP(C, X, OP, Y)	do {} while (0)
+
+#endif /* assert or not */
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 1f3d5a9e0a12..068568702957 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -15,7 +15,6 @@ MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
-unsigned fscache_debug;
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
index 01ac733a6320..f7e32d76e34d 100644
--- a/fs/nfs/Kconfig
+++ b/fs/nfs/Kconfig
@@ -169,8 +169,8 @@ config ROOT_NFS
 
 config NFS_FSCACHE
 	bool "Provide NFS client caching support"
-	depends on NFS_FS=m && FSCACHE || NFS_FS=y && FSCACHE=y
-	select NETFS_SUPPORT
+	depends on NFS_FS=m && NETFS_SUPPORT || NFS_FS=y && NETFS_SUPPORT=y
+	select FSCACHE
 	help
 	  Say Y here if you want NFS data to be cached locally on disc through
 	  the general filesystem cache manager

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

