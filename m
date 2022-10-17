Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B0600CE9
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Oct 2022 12:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666003952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e2b8QcvHxvUvHQS34bkGWRj8vCElsXS1SU8z8PH6cXA=;
	b=QvJUOoBTR9kK+Gbv/IBWwXBpOjWlI+7TjFfSV9eickAlAkxscO5GUYsNUGnddg9mgTa+v0
	FC7ItA+Pv+XrjKZYj6aMYAKKf2hTqzM1pnsUoo+J0TQo6YrToqNrW+E4I57TiSRcBqRHfr
	14R2V67WLcRQasv0vU9o7U2q3Pk/u8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-ViU6WkMJNPySX_w-fp_ldQ-1; Mon, 17 Oct 2022 06:52:29 -0400
X-MC-Unique: ViU6WkMJNPySX_w-fp_ldQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF00118E0044;
	Mon, 17 Oct 2022 10:52:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A52D4E2A68;
	Mon, 17 Oct 2022 10:52:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 569D719465B8;
	Mon, 17 Oct 2022 10:52:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBFCA194658F for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 10:52:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFFDC11422BF; Mon, 17 Oct 2022 10:52:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 886A61121319;
 Mon, 17 Oct 2022 10:52:26 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Mon, 17 Oct 2022 06:52:11 -0400
Message-Id: <20221017105212.77588-5-dwysocha@redhat.com>
In-Reply-To: <20221017105212.77588-1-dwysocha@redhat.com>
References: <20221017105212.77588-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH v9 4/5] NFS: Remove all NFSIOS_FSCACHE
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
index ee66ffdb985e..302148258ff1 100644
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

