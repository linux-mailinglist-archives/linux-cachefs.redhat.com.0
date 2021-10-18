Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A95BD432140
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CUUZX7Zvu/ORfV/MpYy5sPEG65+OYQ84evq0Y6hnGoU=;
	b=CQwxknBn7UOMmHNjApP/Wa7ioed/ZUUcHEW4ql4DrOr/1Ymp2pSTqlvBtoPGf9RIZqefbC
	3o5xPHzfuoONeVppXlkDQ6Et7EPzWidP9ofJV9urj9DuzCBuoyhSmEk/1GvPEaIClTxJTu
	KB5RIzTXPMfPslYTSu+Pf7JpNKv+KlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-OWotEg8jPPasq452Cv3_Og-1; Mon, 18 Oct 2021 11:00:37 -0400
X-MC-Unique: OWotEg8jPPasq452Cv3_Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D1E1023F53;
	Mon, 18 Oct 2021 15:00:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 747525D6D7;
	Mon, 18 Oct 2021 15:00:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D0774EA2F;
	Mon, 18 Oct 2021 15:00:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF0WP2029141 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:00:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1353707B6; Mon, 18 Oct 2021 15:00:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A878A60D30;
	Mon, 18 Oct 2021 15:00:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:00:28 +0100
Message-ID: <163456922892.2614702.12945425715751699836.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 38/67] fscache: Remove more obsolete stats
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove some more stats that have become obsolete.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/internal.h |    3 ---
 fs/fscache/stats.c    |   13 +++----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 1cb1effa7cba..65fb4e88f655 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -101,14 +101,11 @@ extern atomic_t fscache_n_acquires;
 extern atomic_t fscache_n_acquires_null;
 extern atomic_t fscache_n_acquires_no_cache;
 extern atomic_t fscache_n_acquires_ok;
-extern atomic_t fscache_n_acquires_nobufs;
 extern atomic_t fscache_n_acquires_oom;
 
 extern atomic_t fscache_n_invalidates;
-extern atomic_t fscache_n_invalidates_run;
 
 extern atomic_t fscache_n_relinquishes;
-extern atomic_t fscache_n_relinquishes_null;
 extern atomic_t fscache_n_relinquishes_retire;
 extern atomic_t fscache_n_relinquishes_dropped;
 
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index a16473df8be0..44b3b901e191 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -6,7 +6,6 @@
  */
 
 #define FSCACHE_DEBUG_LEVEL CACHE
-#include <linux/module.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include "internal.h"
@@ -48,17 +47,14 @@ atomic_t fscache_n_acquires;
 atomic_t fscache_n_acquires_null;
 atomic_t fscache_n_acquires_no_cache;
 atomic_t fscache_n_acquires_ok;
-atomic_t fscache_n_acquires_nobufs;
 atomic_t fscache_n_acquires_oom;
 
 atomic_t fscache_n_invalidates;
-atomic_t fscache_n_invalidates_run;
 
 atomic_t fscache_n_updates;
 EXPORT_SYMBOL(fscache_n_updates);
 
 atomic_t fscache_n_relinquishes;
-atomic_t fscache_n_relinquishes_null;
 atomic_t fscache_n_relinquishes_retire;
 atomic_t fscache_n_relinquishes_dropped;
 
@@ -83,13 +79,11 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_volumes_nomem)
 		   );
 
-	seq_printf(m, "Acquire: n=%u nul=%u noc=%u ok=%u nbf=%u"
-		   " oom=%u\n",
+	seq_printf(m, "Acquire: n=%u nul=%u noc=%u ok=%u oom=%u\n",
 		   atomic_read(&fscache_n_acquires),
 		   atomic_read(&fscache_n_acquires_null),
 		   atomic_read(&fscache_n_acquires_no_cache),
 		   atomic_read(&fscache_n_acquires_ok),
-		   atomic_read(&fscache_n_acquires_nobufs),
 		   atomic_read(&fscache_n_acquires_oom));
 
 	seq_printf(m, "LRU    : n=%u exp=%u rmv=%u drp=%u at=%ld\n",
@@ -100,9 +94,8 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   timer_pending(&fscache_cookie_lru_timer) ?
 		   fscache_cookie_lru_timer.expires - jiffies : 0);
 
-	seq_printf(m, "Invals : n=%u run=%u\n",
-		   atomic_read(&fscache_n_invalidates),
-		   atomic_read(&fscache_n_invalidates_run));
+	seq_printf(m, "Invals : n=%u\n",
+		   atomic_read(&fscache_n_invalidates));
 
 	seq_printf(m, "Updates: n=%u\n",
 		   atomic_read(&fscache_n_updates));


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

