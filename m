Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDA673D1017
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 15:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626875235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Chje5eF8VbDvffp3H977Fh6oiUpUfr3qB8LOoDOVfpI=;
	b=IWA4T01Iw2FvweVFnDEHp7yO6AWJRV6i0Vx8l9ImTFVp4ANzXTPCsPwf7dgGGaLp3sv9hH
	y7AatuupqoIAuUPntTKnQ7kaUXcoHLJ3GZNOGVMTNgJfib4qchA62Hl+3GE1GJ+CPegXzX
	i8ytjTbNRhKMHlX8eHKt88pQoCIyf+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-UBehMpDSMyetB3YY-dntXg-1; Wed, 21 Jul 2021 09:47:13 -0400
X-MC-Unique: UBehMpDSMyetB3YY-dntXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB2288018A7;
	Wed, 21 Jul 2021 13:47:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 944D610074E5;
	Wed, 21 Jul 2021 13:47:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F4111801028;
	Wed, 21 Jul 2021 13:47:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LDlAAX032188 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 09:47:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A34F62672; Wed, 21 Jul 2021 13:47:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-62.rdu2.redhat.com
	[10.10.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 675D85D6D1;
	Wed, 21 Jul 2021 13:47:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 14:47:01 +0100
Message-ID: <162687522190.276387.10953470388038836276.stgit@warthog.procyon.org.uk>
In-Reply-To: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Shyam Prasad N <nspmangalore@gmail.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: [Linux-cachefs] [RFC PATCH 11/12] netfs: Put a list of regions in
 /proc/fs/netfs/regions
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


---

 fs/netfs/Makefile       |    1 
 fs/netfs/internal.h     |   24 +++++++++++
 fs/netfs/main.c         |  104 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/netfs/objects.c      |    6 ++-
 fs/netfs/write_helper.c |    4 ++
 include/linux/netfs.h   |    1 
 6 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 fs/netfs/main.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index a7c3a9173ac0..62dad3d7bea0 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 netfs-y := \
+	main.o \
 	objects.o \
 	read_helper.o \
 	write_back.o \
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 381ca64062eb..a9ec6591f90a 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -22,6 +22,30 @@
 ssize_t netfs_file_direct_write(struct netfs_dirty_region *region,
 				struct kiocb *iocb, struct iov_iter *from);
 
+/*
+ * main.c
+ */
+extern struct list_head netfs_regions;
+extern spinlock_t netfs_regions_lock;
+
+#ifdef CONFIG_PROC_FS
+static inline void netfs_proc_add_region(struct netfs_dirty_region *region)
+{
+	spin_lock(&netfs_regions_lock);
+	list_add_tail_rcu(&region->proc_link, &netfs_regions);
+	spin_unlock(&netfs_regions_lock);
+}
+static inline void netfs_proc_del_region(struct netfs_dirty_region *region)
+{
+	spin_lock(&netfs_regions_lock);
+	list_del_rcu(&region->proc_link);
+	spin_unlock(&netfs_regions_lock);
+}
+#else
+static inline void netfs_proc_add_region(struct netfs_dirty_region *region) {}
+static inline void netfs_proc_del_region(struct netfs_dirty_region *region) {}
+#endif
+
 /*
  * objects.c
  */
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
new file mode 100644
index 000000000000..125b570efefd
--- /dev/null
+++ b/fs/netfs/main.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Network filesystem library.
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/module.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/proc_fs.h>
+#include "internal.h"
+
+#ifdef CONFIG_PROC_FS
+LIST_HEAD(netfs_regions);
+DEFINE_SPINLOCK(netfs_regions_lock);
+
+static const char netfs_proc_region_states[] = "PRADFC";
+static const char *netfs_proc_region_types[] = {
+	[NETFS_REGION_ORDINARY]		= "ORD ",
+	[NETFS_REGION_DIO]		= "DIOW",
+	[NETFS_REGION_DSYNC]		= "DSYN",
+};
+
+/*
+ * Generate a list of regions in /proc/fs/netfs/regions
+ */
+static int netfs_regions_seq_show(struct seq_file *m, void *v)
+{
+	struct netfs_dirty_region *region;
+
+	if (v == &netfs_regions) {
+		seq_puts(m,
+			 "REGION   REF TYPE S FL DEV   INODE    DIRTY, BOUNDS, RESV\n"
+			 "======== === ==== = == ===== ======== ==============================\n"
+			 );
+		return 0;
+	}
+
+	region = list_entry(v, struct netfs_dirty_region, proc_link);
+	seq_printf(m,
+		   "%08x %3d %s %c %2lx %02x:%02x %8x %04llx-%04llx %04llx-%04llx %04llx-%04llx\n",
+		   region->debug_id,
+		   refcount_read(&region->ref),
+		   netfs_proc_region_types[region->type],
+		   netfs_proc_region_states[region->state],
+		   region->flags,
+		   0, 0, 0,
+		   region->dirty.start, region->dirty.end,
+		   region->bounds.start, region->bounds.end,
+		   region->reserved.start, region->reserved.end);
+	return 0;
+}
+
+static void *netfs_regions_seq_start(struct seq_file *m, loff_t *_pos)
+	__acquires(rcu)
+{
+	rcu_read_lock();
+	return seq_list_start_head(&netfs_regions, *_pos);
+}
+
+static void *netfs_regions_seq_next(struct seq_file *m, void *v, loff_t *_pos)
+{
+	return seq_list_next(v, &netfs_regions, _pos);
+}
+
+static void netfs_regions_seq_stop(struct seq_file *m, void *v)
+	__releases(rcu)
+{
+	rcu_read_unlock();
+}
+
+const struct seq_operations netfs_regions_seq_ops = {
+	.start  = netfs_regions_seq_start,
+	.next   = netfs_regions_seq_next,
+	.stop   = netfs_regions_seq_stop,
+	.show   = netfs_regions_seq_show,
+};
+#endif /* CONFIG_PROC_FS */
+
+static int __init netfs_init(void)
+{
+	if (!proc_mkdir("fs/netfs", NULL))
+		goto error;
+
+	if (!proc_create_seq("fs/netfs/regions", S_IFREG | 0444, NULL,
+			     &netfs_regions_seq_ops))
+		goto error_proc;
+
+	return 0;
+
+error_proc:
+	remove_proc_entry("fs/netfs", NULL);
+error:
+	return -ENOMEM;
+}
+fs_initcall(netfs_init);
+
+static void __exit netfs_exit(void)
+{
+	remove_proc_entry("fs/netfs", NULL);
+}
+module_exit(netfs_exit);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 8926b4230d91..1149f12ca8c9 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -60,8 +60,10 @@ struct netfs_dirty_region *netfs_alloc_dirty_region(void)
 	struct netfs_dirty_region *region;
 
 	region = kzalloc(sizeof(struct netfs_dirty_region), GFP_KERNEL);
-	if (region)
+	if (region) {
+		INIT_LIST_HEAD(&region->proc_link);
 		netfs_stat(&netfs_n_wh_region);
+	}
 	return region;
 }
 
@@ -81,6 +83,8 @@ void netfs_free_dirty_region(struct netfs_i_context *ctx,
 {
 	if (region) {
 		trace_netfs_ref_region(region->debug_id, 0, netfs_region_trace_free);
+		if (!list_empty(&region->proc_link))
+			netfs_proc_del_region(region);
 		if (ctx->ops->free_dirty_region)
 			ctx->ops->free_dirty_region(region);
 		netfs_put_flush_group(region->group);
diff --git a/fs/netfs/write_helper.c b/fs/netfs/write_helper.c
index fa048e3882ea..b1fe2d4c0df6 100644
--- a/fs/netfs/write_helper.c
+++ b/fs/netfs/write_helper.c
@@ -86,10 +86,13 @@ static void netfs_init_dirty_region(struct netfs_dirty_region *region,
 		group = list_last_entry(&ctx->flush_groups,
 					struct netfs_flush_group, group_link);
 		region->group = netfs_get_flush_group(group);
+		spin_lock(&ctx->lock);
 		list_add_tail(&region->flush_link, &group->region_list);
+		spin_unlock(&ctx->lock);
 	}
 	trace_netfs_ref_region(region->debug_id, 1, netfs_region_trace_new);
 	trace_netfs_dirty(ctx, region, NULL, netfs_dirty_trace_new);
+	netfs_proc_add_region(region);
 }
 
 /*
@@ -198,6 +201,7 @@ static struct netfs_dirty_region *netfs_split_dirty_region(
 	list_add(&tail->dirty_link, &region->dirty_link);
 	list_add(&tail->flush_link, &region->flush_link);
 	trace_netfs_dirty(ctx, tail, region, netfs_dirty_trace_split);
+	netfs_proc_add_region(tail);
 	return tail;
 }
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 6acf3fb170c3..43d195badb0d 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -228,6 +228,7 @@ enum netfs_region_type {
  */
 struct netfs_dirty_region {
 	struct netfs_flush_group *group;
+	struct list_head	proc_link;	/* Link in /proc/fs/netfs/regions */
 	struct list_head	active_link;	/* Link in i_context->pending/active_writes */
 	struct list_head	dirty_link;	/* Link in i_context->dirty_regions */
 	struct list_head	flush_link;	/* Link in group->region_list or


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

