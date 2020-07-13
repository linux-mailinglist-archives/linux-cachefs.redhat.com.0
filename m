Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 128E021DBD3
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594657724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F/RipEkjmgggEeeerfHTnFFL6R0zYNhskLHGpBxm96E=;
	b=EYVyShZmJN8SCW5MhNMICl6D/SDU17xc+++ECIKhv0F+MFm2mpeVjoG2boyL+CwZbtwRP2
	pnzQXbJw+UUFyq5lRNK3OXYpID6lMK0exH4W33NlMGF8HZtwihPBRByIPvN6MJOJ7OOSd3
	Torsunfx1461LdeEYxm0dG+isWxnkMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-4RpuuyLdN1KF9GowMUuCkQ-1; Mon, 13 Jul 2020 12:28:40 -0400
X-MC-Unique: 4RpuuyLdN1KF9GowMUuCkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6905E1088;
	Mon, 13 Jul 2020 16:28:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5788810013C0;
	Mon, 13 Jul 2020 16:28:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4209594EF2;
	Mon, 13 Jul 2020 16:28:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGSaS4026112 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:28:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EB1D5C6DD; Mon, 13 Jul 2020 16:28:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC1BA5C1D0;
	Mon, 13 Jul 2020 16:28:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:28:30 +0100
Message-ID: <159465771021.1376105.6933857529128238020.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk>
References: <159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 04/14] fscache: Procfile to display cookies
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add /proc/fs/fscache/cookies to display active cookies.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cookie.c     |  103 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/fscache/internal.h   |    1 
 fs/fscache/proc.c       |    7 +++
 include/linux/fscache.h |    1 
 4 files changed, 112 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index f2be98d2c64d..c7047544972b 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -19,6 +19,8 @@ static atomic_t fscache_object_debug_id = ATOMIC_INIT(0);
 
 #define fscache_cookie_hash_shift 15
 static struct hlist_bl_head fscache_cookie_hash[1 << fscache_cookie_hash_shift];
+static LIST_HEAD(fscache_cookies);
+static DEFINE_RWLOCK(fscache_cookies_lock);
 
 static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie,
 					    loff_t object_size);
@@ -65,6 +67,9 @@ void fscache_free_cookie(struct fscache_cookie *cookie)
 {
 	if (cookie) {
 		BUG_ON(!hlist_empty(&cookie->backing_objects));
+		write_lock(&fscache_cookies_lock);
+		list_del(&cookie->proc_link);
+		write_unlock(&fscache_cookies_lock);
 		if (cookie->aux_len > sizeof(cookie->inline_aux))
 			kfree(cookie->aux);
 		if (cookie->key_len > sizeof(cookie->inline_key))
@@ -192,6 +197,10 @@ struct fscache_cookie *fscache_alloc_cookie(
 	/* radix tree insertion won't use the preallocation pool unless it's
 	 * told it may not wait */
 	INIT_RADIX_TREE(&cookie->stores, GFP_NOFS & ~__GFP_DIRECT_RECLAIM);
+
+	write_lock(&fscache_cookies_lock);
+	list_add_tail(&cookie->proc_link, &fscache_cookies);
+	write_unlock(&fscache_cookies_lock);
 	return cookie;
 
 nomem:
@@ -969,3 +978,97 @@ int __fscache_check_consistency(struct fscache_cookie *cookie,
 	return -ESTALE;
 }
 EXPORT_SYMBOL(__fscache_check_consistency);
+
+/*
+ * Generate a list of extant cookies in /proc/fs/fscache/cookies
+ */
+static int fscache_cookies_seq_show(struct seq_file *m, void *v)
+{
+	struct fscache_cookie *cookie;
+	unsigned int keylen = 0, auxlen = 0;
+	char _type[3], *type;
+	u8 *p;
+
+	if (v == &fscache_cookies) {
+		seq_puts(m,
+			 "COOKIE   PARENT   USAGE CHILD ACT TY FL  DEF              NETFS_DATA\n"
+			 "======== ======== ===== ===== === == === ================ ==========\n"
+			 );
+		return 0;
+	}
+
+	cookie = list_entry(v, struct fscache_cookie, proc_link);
+
+	switch (cookie->type) {
+	case 0:
+		type = "IX";
+		break;
+	case 1:
+		type = "DT";
+		break;
+	default:
+		snprintf(_type, sizeof(_type), "%02u",
+			 cookie->type);
+		type = _type;
+		break;
+	}
+
+	seq_printf(m,
+		   "%08x %08x %5u %5u %3u %s %03lx %-16s %px",
+		   cookie->debug_id,
+		   cookie->parent ? cookie->parent->debug_id : 0,
+		   atomic_read(&cookie->usage),
+		   atomic_read(&cookie->n_children),
+		   atomic_read(&cookie->n_active),
+		   type,
+		   cookie->flags,
+		   cookie->def->name,
+		   cookie->netfs_data);
+
+	keylen = cookie->key_len;
+	auxlen = cookie->aux_len;
+
+	if (keylen > 0 || auxlen > 0) {
+		seq_puts(m, " ");
+		p = keylen <= sizeof(cookie->inline_key) ?
+			cookie->inline_key : cookie->key;
+		for (; keylen > 0; keylen--)
+			seq_printf(m, "%02x", *p++);
+		if (auxlen > 0) {
+			seq_puts(m, ", ");
+			p = auxlen <= sizeof(cookie->inline_aux) ?
+				cookie->inline_aux : cookie->aux;
+			for (; auxlen > 0; auxlen--)
+				seq_printf(m, "%02x", *p++);
+		}
+	}
+
+	seq_puts(m, "\n");
+	return 0;
+}
+
+static void *fscache_cookies_seq_start(struct seq_file *m, loff_t *_pos)
+	__acquires(fscache_cookies_lock)
+{
+	read_lock(&fscache_cookies_lock);
+	return seq_list_start_head(&fscache_cookies, *_pos);
+}
+
+static void *fscache_cookies_seq_next(struct seq_file *m, void *v, loff_t *_pos)
+{
+	return seq_list_next(v, &fscache_cookies, _pos);
+}
+
+static void fscache_cookies_seq_stop(struct seq_file *m, void *v)
+	__releases(rcu)
+{
+	read_unlock(&fscache_cookies_lock);
+}
+
+
+const struct seq_operations fscache_cookies_seq_ops = {
+	.start  = fscache_cookies_seq_start,
+	.next   = fscache_cookies_seq_next,
+	.stop   = fscache_cookies_seq_stop,
+	.show   = fscache_cookies_seq_show,
+};
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 08e91efbce53..4b535c2dae4a 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -45,6 +45,7 @@ extern struct fscache_cache *fscache_select_cache_for_object(
  * cookie.c
  */
 extern struct kmem_cache *fscache_cookie_jar;
+extern const struct seq_operations fscache_cookies_seq_ops;
 
 extern void fscache_free_cookie(struct fscache_cookie *);
 extern struct fscache_cookie *fscache_alloc_cookie(struct fscache_cookie *,
diff --git a/fs/fscache/proc.c b/fs/fscache/proc.c
index 90a7bc22f7e1..da51fdfc8641 100644
--- a/fs/fscache/proc.c
+++ b/fs/fscache/proc.c
@@ -21,6 +21,10 @@ int __init fscache_proc_init(void)
 	if (!proc_mkdir("fs/fscache", NULL))
 		goto error_dir;
 
+	if (!proc_create_seq("fs/fscache/cookies", S_IFREG | 0444, NULL,
+			     &fscache_cookies_seq_ops))
+		goto error_cookies;
+
 #ifdef CONFIG_FSCACHE_STATS
 	if (!proc_create_single("fs/fscache/stats", S_IFREG | 0444, NULL,
 			fscache_stats_show))
@@ -53,6 +57,8 @@ int __init fscache_proc_init(void)
 	remove_proc_entry("fs/fscache/stats", NULL);
 error_stats:
 #endif
+	remove_proc_entry("fs/fscache/cookies", NULL);
+error_cookies:
 	remove_proc_entry("fs/fscache", NULL);
 error_dir:
 	_leave(" = -ENOMEM");
@@ -73,5 +79,6 @@ void fscache_proc_cleanup(void)
 #ifdef CONFIG_FSCACHE_STATS
 	remove_proc_entry("fs/fscache/stats", NULL);
 #endif
+	remove_proc_entry("fs/fscache/cookies", NULL);
 	remove_proc_entry("fs/fscache", NULL);
 }
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index f31df9a075f6..2606fe7edd29 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -141,6 +141,7 @@ struct fscache_cookie {
 	const struct fscache_cookie_def	*def;		/* definition */
 	struct fscache_cookie		*parent;	/* parent of this entry */
 	struct hlist_bl_node		hash_link;	/* Link in hash table */
+	struct list_head		proc_link;	/* Link in proc list */
 	void				*netfs_data;	/* back pointer to netfs */
 	struct radix_tree_root		stores;		/* pages to be stored on this cookie */
 #define FSCACHE_COOKIE_PENDING_TAG	0		/* pages tag: pending write to cache */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

