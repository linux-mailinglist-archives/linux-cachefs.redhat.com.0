Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814269CCC8
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Feb 2023 14:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676900607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qJpdD4C6Oe1GyDjVeGi8uLEFZskUTiqc9snGloB2Oek=;
	b=cOpQItY7DmOGQiJb1f9AgCLQ25ayIisR2b5RdkG7FZZPJVq393WcPVkZ1J6/jgW+rBukKS
	1ONRfd0yMTsfBYctfB9JM8mr8MgM5Vmf6yQeni4juLS7SNnnS3op4e5FCBX/VbXz0NY8oy
	itrf1UYv0/odav5EZHxOLAenwiTEM+g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-tXV-atjLP5ask6MOvMKv0Q-1; Mon, 20 Feb 2023 08:43:23 -0500
X-MC-Unique: tXV-atjLP5ask6MOvMKv0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B72D3815EE2;
	Mon, 20 Feb 2023 13:43:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F3612166B26;
	Mon, 20 Feb 2023 13:43:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55E8B19465B8;
	Mon, 20 Feb 2023 13:43:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F197194658D for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 13:43:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2936404CD85; Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFDCE404CD84;
 Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Daire Byrne <daire.byrne@gmail.com>
Date: Mon, 20 Feb 2023 08:43:07 -0500
Message-Id: <20230220134308.1193219-5-dwysocha@redhat.com>
In-Reply-To: <20230220134308.1193219-1-dwysocha@redhat.com>
References: <20230220134308.1193219-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v11 4/5] NFS: Remove all NFSIOS_FSCACHE
 counters due to conversion to netfs API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The old NFSIOS_FSCACHE counters are no longer accurate or useful with
the conversion to the new netfs API.  The new API does not have a page
based interface, and so the counters in nfs_stat_fscachecounters are
no longer obtainable.  The new netfs the API has extensive statistics
inside /proc/fs/fscache/stats so we no longer need NFS specific fscache
stats.

Note this also removes the 'fsc:' line from /proc/self/mountstats so
it will be a user-visible change.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/iostat.h            | 17 -----------------
 fs/nfs/super.c             | 11 -----------
 include/linux/nfs_iostat.h | 12 ------------
 3 files changed, 40 deletions(-)

diff --git a/fs/nfs/iostat.h b/fs/nfs/iostat.h
index 2ddaab1ac653..5aa776b5a3e7 100644
--- a/fs/nfs/iostat.h
+++ b/fs/nfs/iostat.h
@@ -17,9 +17,6 @@
 
 struct nfs_iostats {
 	unsigned long long	bytes[__NFSIOS_BYTESMAX];
-#ifdef CONFIG_NFS_FSCACHE
-	unsigned long long	fscache[__NFSIOS_FSCACHEMAX];
-#endif
 	unsigned long		events[__NFSIOS_COUNTSMAX];
 } ____cacheline_aligned;
 
@@ -49,20 +46,6 @@ static inline void nfs_add_stats(const struct inode *inode,
 	nfs_add_server_stats(NFS_SERVER(inode), stat, addend);
 }
 
-#ifdef CONFIG_NFS_FSCACHE
-static inline void nfs_add_fscache_stats(struct inode *inode,
-					 enum nfs_stat_fscachecounters stat,
-					 long addend)
-{
-	this_cpu_add(NFS_SERVER(inode)->io_stats->fscache[stat], addend);
-}
-static inline void nfs_inc_fscache_stats(struct inode *inode,
-					 enum nfs_stat_fscachecounters stat)
-{
-	this_cpu_inc(NFS_SERVER(inode)->io_stats->fscache[stat]);
-}
-#endif
-
 static inline struct nfs_iostats __percpu *nfs_alloc_iostats(void)
 {
 	return alloc_percpu(struct nfs_iostats);
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 05ae23657527..90796db8c205 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -692,10 +692,6 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)
 			totals.events[i] += stats->events[i];
 		for (i = 0; i < __NFSIOS_BYTESMAX; i++)
 			totals.bytes[i] += stats->bytes[i];
-#ifdef CONFIG_NFS_FSCACHE
-		for (i = 0; i < __NFSIOS_FSCACHEMAX; i++)
-			totals.fscache[i] += stats->fscache[i];
-#endif
 
 		preempt_enable();
 	}
@@ -706,13 +702,6 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)
 	seq_puts(m, "\n\tbytes:\t");
 	for (i = 0; i < __NFSIOS_BYTESMAX; i++)
 		seq_printf(m, "%Lu ", totals.bytes[i]);
-#ifdef CONFIG_NFS_FSCACHE
-	if (nfss->options & NFS_OPTION_FSCACHE) {
-		seq_puts(m, "\n\tfsc:\t");
-		for (i = 0; i < __NFSIOS_FSCACHEMAX; i++)
-			seq_printf(m, "%Lu ", totals.fscache[i]);
-	}
-#endif
 	seq_putc(m, '\n');
 
 	rpc_clnt_show_stats(m, nfss->client);
diff --git a/include/linux/nfs_iostat.h b/include/linux/nfs_iostat.h
index 027874c36c88..8d946089d151 100644
--- a/include/linux/nfs_iostat.h
+++ b/include/linux/nfs_iostat.h
@@ -119,16 +119,4 @@ enum nfs_stat_eventcounters {
 	__NFSIOS_COUNTSMAX,
 };
 
-/*
- * NFS local caching servicing counters
- */
-enum nfs_stat_fscachecounters {
-	NFSIOS_FSCACHE_PAGES_READ_OK,
-	NFSIOS_FSCACHE_PAGES_READ_FAIL,
-	NFSIOS_FSCACHE_PAGES_WRITTEN_OK,
-	NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL,
-	NFSIOS_FSCACHE_PAGES_UNCACHED,
-	__NFSIOS_FSCACHEMAX,
-};
-
 #endif	/* _LINUX_NFS_IOSTAT */
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

