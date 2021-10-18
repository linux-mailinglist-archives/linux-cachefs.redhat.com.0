Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 708DF43213C
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569227;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1BAdh9x5GUdgtAXZFNdM0ymwDH5AIOCZnpH9iZgVt34=;
	b=fIlVz3htIlBpawJT0g/y0oNW8ZxBoF9aTAqTVUVfqRNX+puJjI9mIF28lbX9s6znfr3V+w
	U1XcafmBEplitO+lF5iqCne5tl46qJTltTDFQ8APeb1q7MDZLsgRBPUd6z3RpHau94PBYn
	go/K8wsCJAXYgQnvWV/uJENWLQGJA5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-6fAkZCkZMkSQe3bKK-Q58A-1; Mon, 18 Oct 2021 11:00:24 -0400
X-MC-Unique: 6fAkZCkZMkSQe3bKK-Q58A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD39719200CB;
	Mon, 18 Oct 2021 15:00:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87C4B100E809;
	Mon, 18 Oct 2021 15:00:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5478C4EA2A;
	Mon, 18 Oct 2021 15:00:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF0Era029065 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:00:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A84A5F4F5; Mon, 18 Oct 2021 15:00:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 511675D6D7;
	Mon, 18 Oct 2021 15:00:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:00:07 +0100
Message-ID: <163456920740.2614702.10833323576114946075.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 36/67] fscache: Add stats for the cookie
	commit LRU
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

Add some stats to indicate the state of the cookie commit LRU, including an
indication of how many are currently on it, how many have been expired,
removed (withdrawn/reused) or dropped (relinquished) from it and how long
till the next reap happens.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cookie.c   |   10 +++++++++-
 fs/fscache/internal.h |    5 +++++
 fs/fscache/stats.c    |   12 ++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index dfc61b2e105d..c6b553609f33 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -28,7 +28,7 @@ static LIST_HEAD(fscache_cookies);
 static DEFINE_RWLOCK(fscache_cookies_lock);
 static LIST_HEAD(fscache_cookie_lru);
 static DEFINE_SPINLOCK(fscache_cookie_lru_lock);
-static DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
+DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
 static DECLARE_WORK(fscache_cookie_lru_work, fscache_cookie_lru_worker);
 static const char fscache_cookie_stages[FSCACHE_COOKIE_STAGE__NR] = "-LCAIFMWRD";
 unsigned int fscache_lru_cookie_timeout = 10 * HZ;
@@ -60,6 +60,8 @@ static void fscache_free_cookie(struct fscache_cookie *cookie)
 		spin_lock(&fscache_cookie_lru_lock);
 		list_del_init(&cookie->commit_link);
 		spin_unlock(&fscache_cookie_lru_lock);
+		fscache_stat_d(&fscache_n_cookies_lru);
+		fscache_stat(&fscache_n_cookies_lru_removed);
 	}
 	write_lock(&fscache_cookies_lock);
 	list_del(&cookie->proc_link);
@@ -525,6 +527,7 @@ void __fscache_unuse_cookie(struct fscache_cookie *cookie,
 			if (list_empty(&cookie->commit_link)) {
 				fscache_get_cookie(cookie, fscache_cookie_get_lru);
 				list_move_tail(&cookie->commit_link, &fscache_cookie_lru);
+				fscache_stat(&fscache_n_cookies_lru);
 			}
 			spin_unlock(&fscache_cookie_lru_lock);
 			timer_reduce(&fscache_cookie_lru_timer,
@@ -624,10 +627,12 @@ static void fscache_cookie_lru_do_one(struct fscache_cookie *cookie)
 	    time_before(jiffies, cookie->unused_at + fscache_lru_cookie_timeout) ||
 	    atomic_read(&cookie->n_active) > 0) {
 		spin_unlock(&cookie->lock);
+		fscache_stat(&fscache_n_cookies_lru_removed);
 	} else {
 		__fscache_set_cookie_stage(cookie, FSCACHE_COOKIE_STAGE_COMMITTING);
 		set_bit(FSCACHE_COOKIE_DO_COMMIT, &cookie->flags);
 		spin_unlock(&cookie->lock);
+		fscache_stat(&fscache_n_cookies_lru_expired);
 		_debug("lru c=%x", cookie->debug_id);
 		__fscache_withdraw_cookie(cookie);
 	}
@@ -652,6 +657,7 @@ static void fscache_cookie_lru_worker(struct work_struct *work)
 		}
 
 		list_del_init(&cookie->commit_link);
+		fscache_stat_d(&fscache_n_cookies_lru);
 		spin_unlock(&fscache_cookie_lru_lock);
 		fscache_cookie_lru_do_one(cookie);
 		spin_lock(&fscache_cookie_lru_lock);
@@ -673,6 +679,8 @@ static void fscache_cookie_drop_from_lru(struct fscache_cookie *cookie)
 		spin_lock(&fscache_cookie_lru_lock);
 		if (!list_empty(&cookie->commit_link)) {
 			list_del_init(&cookie->commit_link);
+			fscache_stat_d(&fscache_n_cookies_lru);
+			fscache_stat(&fscache_n_cookies_lru_dropped);
 			need_put = true;
 		}
 		spin_unlock(&fscache_cookie_lru_lock);
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index f74f7bdea633..62e6a5bbef8e 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -32,6 +32,7 @@ struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache);
  */
 extern struct kmem_cache *fscache_cookie_jar;
 extern const struct seq_operations fscache_cookies_seq_ops;
+extern struct timer_list fscache_cookie_lru_timer;
 
 extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
 extern bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
@@ -70,6 +71,10 @@ extern atomic_t fscache_n_volumes;
 extern atomic_t fscache_n_volumes_collision;
 extern atomic_t fscache_n_volumes_nomem;
 extern atomic_t fscache_n_cookies;
+extern atomic_t fscache_n_cookies_lru;
+extern atomic_t fscache_n_cookies_lru_expired;
+extern atomic_t fscache_n_cookies_lru_removed;
+extern atomic_t fscache_n_cookies_lru_dropped;
 
 extern atomic_t fscache_n_retrievals;
 extern atomic_t fscache_n_retrievals_ok;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 13e90b940bd2..5700e5712018 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -18,6 +18,10 @@ atomic_t fscache_n_volumes;
 atomic_t fscache_n_volumes_collision;
 atomic_t fscache_n_volumes_nomem;
 atomic_t fscache_n_cookies;
+atomic_t fscache_n_cookies_lru;
+atomic_t fscache_n_cookies_lru_expired;
+atomic_t fscache_n_cookies_lru_removed;
+atomic_t fscache_n_cookies_lru_dropped;
 
 atomic_t fscache_n_retrievals;
 atomic_t fscache_n_retrievals_ok;
@@ -89,6 +93,14 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_acquires_nobufs),
 		   atomic_read(&fscache_n_acquires_oom));
 
+	seq_printf(m, "LRU    : n=%u exp=%u rmv=%u drp=%u at=%ld\n",
+		   atomic_read(&fscache_n_cookies_lru),
+		   atomic_read(&fscache_n_cookies_lru_expired),
+		   atomic_read(&fscache_n_cookies_lru_removed),
+		   atomic_read(&fscache_n_cookies_lru_dropped),
+		   timer_pending(&fscache_cookie_lru_timer) ?
+		   fscache_cookie_lru_timer.expires - jiffies : 0);
+
 	seq_printf(m, "Invals : n=%u run=%u\n",
 		   atomic_read(&fscache_n_invalidates),
 		   atomic_read(&fscache_n_invalidates_run));


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

