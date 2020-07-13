Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B125B21DC6D
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594657989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a8DPKjn4zVA02LDSvyHghZjl1W+HzeYRgoyckN9ySv8=;
	b=cyJCMi8Q8uO0V59RXZUoEZOg1i/YC1Bf+n1p61zsyDFZmPZRQcYjcuI2J1MDjSEh4iIaDj
	rRsxS7UiK36wQe10CWsXpn50A1UVW3sj20+dbwd+/Eo2m6GekNnpo+c6OHvWyMdKZgIp+5
	si/aN4BwC3L/n5J3VrtIn5t9DnMmZS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-kaHVHd8ZPKuiL84m-CR5iA-1; Mon, 13 Jul 2020 12:33:07 -0400
X-MC-Unique: kaHVHd8ZPKuiL84m-CR5iA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869B180183C;
	Mon, 13 Jul 2020 16:33:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 768AF5BAD5;
	Mon, 13 Jul 2020 16:33:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62D3B180954D;
	Mon, 13 Jul 2020 16:33:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGX1Cn027355 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:33:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48F595D9DC; Mon, 13 Jul 2020 16:33:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B34915D9CC;
	Mon, 13 Jul 2020 16:32:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:32:54 +0100
Message-ID: <159465797497.1376674.14328755555295693847.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 12/32] fscache,
	cachefiles: Fix disabled histogram warnings
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix variable unused warnings due to disabled histogram stuff.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/internal.h |    7 +++++--
 fs/fscache/internal.h    |    6 ++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b89f76a03546..16d15291a629 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -143,11 +143,11 @@ extern int cachefiles_check_in_use(struct cachefiles_cache *cache,
 /*
  * proc.c
  */
-#ifdef CONFIG_CACHEFILES_HISTOGRAM
 extern atomic_t cachefiles_lookup_histogram[HZ];
 extern atomic_t cachefiles_mkdir_histogram[HZ];
 extern atomic_t cachefiles_create_histogram[HZ];
 
+#ifdef CONFIG_CACHEFILES_HISTOGRAM
 extern int __init cachefiles_proc_init(void);
 extern void cachefiles_proc_cleanup(void);
 static inline
@@ -162,7 +162,10 @@ void cachefiles_hist(atomic_t histogram[], unsigned long start_jif)
 #else
 #define cachefiles_proc_init()		(0)
 #define cachefiles_proc_cleanup()	do {} while (0)
-#define cachefiles_hist(hist, start_jif) do {} while (0)
+static inline
+void cachefiles_hist(atomic_t histogram[], unsigned long start_jif)
+{
+}
 #endif
 
 /*
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 443671310e31..a70c1a612309 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -95,13 +95,13 @@ extern struct fscache_cookie fscache_fsdef_index;
 /*
  * histogram.c
  */
-#ifdef CONFIG_FSCACHE_HISTOGRAM
 extern atomic_t fscache_obj_instantiate_histogram[HZ];
 extern atomic_t fscache_objs_histogram[HZ];
 extern atomic_t fscache_ops_histogram[HZ];
 extern atomic_t fscache_retrieval_delay_histogram[HZ];
 extern atomic_t fscache_retrieval_histogram[HZ];
 
+#ifdef CONFIG_FSCACHE_HISTOGRAM
 static inline void fscache_hist(atomic_t histogram[], unsigned long start_jif)
 {
 	unsigned long jif = jiffies - start_jif;
@@ -113,7 +113,9 @@ static inline void fscache_hist(atomic_t histogram[], unsigned long start_jif)
 extern const struct seq_operations fscache_histogram_ops;
 
 #else
-#define fscache_hist(hist, start_jif) do {} while (0)
+static inline void fscache_hist(atomic_t histogram[], unsigned long start_jif)
+{
+}
 #endif
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

