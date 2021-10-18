Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA3432088
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B2vyrzEyagKFrrMMqnTPss8LA5sBhVGow3dz83U+Fag=;
	b=EujMhQT8fG8fdH2iTsvbOWpB3rH1PWUWbk8/hbpcMAHDbTdSxKlNK30uyAmgH1ACAkFmqv
	S4xUSy7Oy1a5Dm4XV59RBBV875J8sYFWktIhwNokvkk0hxkVF74VvMA4moPnieXpFnamnk
	mCp6fLGcmwCbBLYVqnOcPFFm62nK/QQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-dC9UmtzjMiGAiMc7FpgD8Q-1; Mon, 18 Oct 2021 10:54:19 -0400
X-MC-Unique: dC9UmtzjMiGAiMc7FpgD8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402F650768;
	Mon, 18 Oct 2021 14:54:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B2517CD9;
	Mon, 18 Oct 2021 14:54:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E8C44E58F;
	Mon, 18 Oct 2021 14:54:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEsF4o027928 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:54:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36CDD62AEE; Mon, 18 Oct 2021 14:54:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52A135D6D7;
	Mon, 18 Oct 2021 14:54:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:54:08 +0100
Message-ID: <163456884845.2614702.5758884460753061615.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Subject: [Linux-cachefs] [PATCH 12/67] fscache: Remove obsolete stats
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove a bunch of now-unused fscache stats counters that were obsoleted by
the removal of the old I/O routines.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/internal.h |   15 ---------------
 fs/fscache/stats.c    |   27 +--------------------------
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index bff83b14398b..43d64f6bbf8b 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -149,9 +149,6 @@ extern void fscache_proc_cleanup(void);
  * stats.c
  */
 #ifdef CONFIG_FSCACHE_STATS
-extern atomic_t fscache_n_ops_processed[FSCACHE_MAX_THREADS];
-extern atomic_t fscache_n_objs_processed[FSCACHE_MAX_THREADS];
-
 extern atomic_t fscache_n_op_pend;
 extern atomic_t fscache_n_op_run;
 extern atomic_t fscache_n_op_enqueue;
@@ -162,12 +159,6 @@ extern atomic_t fscache_n_op_gc;
 extern atomic_t fscache_n_op_cancelled;
 extern atomic_t fscache_n_op_rejected;
 
-extern atomic_t fscache_n_attr_changed;
-extern atomic_t fscache_n_attr_changed_ok;
-extern atomic_t fscache_n_attr_changed_nobufs;
-extern atomic_t fscache_n_attr_changed_nomem;
-extern atomic_t fscache_n_attr_changed_calls;
-
 extern atomic_t fscache_n_retrievals;
 extern atomic_t fscache_n_retrievals_ok;
 extern atomic_t fscache_n_retrievals_wait;
@@ -205,7 +196,6 @@ extern atomic_t fscache_n_updates_run;
 
 extern atomic_t fscache_n_relinquishes;
 extern atomic_t fscache_n_relinquishes_null;
-extern atomic_t fscache_n_relinquishes_waitcrt;
 extern atomic_t fscache_n_relinquishes_retire;
 
 extern atomic_t fscache_n_cookie_index;
@@ -222,11 +212,6 @@ extern atomic_t fscache_n_object_created;
 extern atomic_t fscache_n_object_avail;
 extern atomic_t fscache_n_object_dead;
 
-extern atomic_t fscache_n_checkaux_none;
-extern atomic_t fscache_n_checkaux_okay;
-extern atomic_t fscache_n_checkaux_update;
-extern atomic_t fscache_n_checkaux_obsolete;
-
 extern atomic_t fscache_n_cop_alloc_object;
 extern atomic_t fscache_n_cop_lookup_object;
 extern atomic_t fscache_n_cop_lookup_complete;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 2449aa459140..cb9dd0a93e0d 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -24,12 +24,6 @@ atomic_t fscache_n_op_gc;
 atomic_t fscache_n_op_cancelled;
 atomic_t fscache_n_op_rejected;
 
-atomic_t fscache_n_attr_changed;
-atomic_t fscache_n_attr_changed_ok;
-atomic_t fscache_n_attr_changed_nobufs;
-atomic_t fscache_n_attr_changed_nomem;
-atomic_t fscache_n_attr_changed_calls;
-
 atomic_t fscache_n_retrievals;
 atomic_t fscache_n_retrievals_ok;
 atomic_t fscache_n_retrievals_wait;
@@ -67,7 +61,6 @@ atomic_t fscache_n_updates_run;
 
 atomic_t fscache_n_relinquishes;
 atomic_t fscache_n_relinquishes_null;
-atomic_t fscache_n_relinquishes_waitcrt;
 atomic_t fscache_n_relinquishes_retire;
 
 atomic_t fscache_n_cookie_index;
@@ -84,11 +77,6 @@ atomic_t fscache_n_object_created;
 atomic_t fscache_n_object_avail;
 atomic_t fscache_n_object_dead;
 
-atomic_t fscache_n_checkaux_none;
-atomic_t fscache_n_checkaux_okay;
-atomic_t fscache_n_checkaux_update;
-atomic_t fscache_n_checkaux_obsolete;
-
 atomic_t fscache_n_cop_alloc_object;
 atomic_t fscache_n_cop_lookup_object;
 atomic_t fscache_n_cop_lookup_complete;
@@ -122,11 +110,6 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_object_no_alloc),
 		   atomic_read(&fscache_n_object_avail),
 		   atomic_read(&fscache_n_object_dead));
-	seq_printf(m, "ChkAux : non=%u ok=%u upd=%u obs=%u\n",
-		   atomic_read(&fscache_n_checkaux_none),
-		   atomic_read(&fscache_n_checkaux_okay),
-		   atomic_read(&fscache_n_checkaux_update),
-		   atomic_read(&fscache_n_checkaux_obsolete));
 
 	seq_printf(m, "Acquire: n=%u nul=%u noc=%u ok=%u nbf=%u"
 		   " oom=%u\n",
@@ -153,19 +136,11 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_updates_null),
 		   atomic_read(&fscache_n_updates_run));
 
-	seq_printf(m, "Relinqs: n=%u nul=%u wcr=%u rtr=%u\n",
+	seq_printf(m, "Relinqs: n=%u nul=%u rtr=%u\n",
 		   atomic_read(&fscache_n_relinquishes),
 		   atomic_read(&fscache_n_relinquishes_null),
-		   atomic_read(&fscache_n_relinquishes_waitcrt),
 		   atomic_read(&fscache_n_relinquishes_retire));
 
-	seq_printf(m, "AttrChg: n=%u ok=%u nbf=%u oom=%u run=%u\n",
-		   atomic_read(&fscache_n_attr_changed),
-		   atomic_read(&fscache_n_attr_changed_ok),
-		   atomic_read(&fscache_n_attr_changed_nobufs),
-		   atomic_read(&fscache_n_attr_changed_nomem),
-		   atomic_read(&fscache_n_attr_changed_calls));
-
 	seq_printf(m, "Retrvls: n=%u ok=%u wt=%u nod=%u nbf=%u"
 		   " int=%u oom=%u\n",
 		   atomic_read(&fscache_n_retrievals),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

