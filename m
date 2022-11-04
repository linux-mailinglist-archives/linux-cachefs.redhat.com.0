Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E36191D6
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 08:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667546815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rR/psXANBwtk+FZdMT5CsNsko9jI6V8jC1Z26euuZSA=;
	b=An7GyXm5oJolaWeei9aLxoKo2ajpf4Xi4TBvKm8VGEPCjI17RPrE3X5gDU1iOtdjOZnhkz
	CY9VViQL22PHykEVXPMwF2thpI6ZzWg6muQmt6pftANTyakM4UMOt9FIYAmebzGVEfGiTR
	h+dZDDFc/cdvy+elabWQOoqPeAXcuKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-Q-wGZGWdPEG6gT9gCH4BZw-1; Fri, 04 Nov 2022 03:26:52 -0400
X-MC-Unique: Q-wGZGWdPEG6gT9gCH4BZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33B3686E921;
	Fri,  4 Nov 2022 07:26:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA1A40C6F73;
	Fri,  4 Nov 2022 07:26:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4FF519465B2;
	Fri,  4 Nov 2022 07:26:48 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F12B91946594 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 07:26:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC4F3C1908E; Fri,  4 Nov 2022 07:26:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4485C16932
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 07:26:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B23E3C025BF
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 07:26:46 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-319-dkGczvSJOZeY2Ywj7q1CNQ-1; Fri, 04 Nov 2022 03:26:44 -0400
X-MC-Unique: dkGczvSJOZeY2Ywj7q1CNQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VTvwsEP_1667546799
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTvwsEP_1667546799) by smtp.aliyun-inc.com;
 Fri, 04 Nov 2022 15:26:40 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, xiang@kernel.org, chao@kernel.org,
 linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org
Date: Fri,  4 Nov 2022 15:26:36 +0800
Message-Id: <20221104072637.72375-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
References: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add prepare_ondemand_read() callback dedicated for the on-demand read
scenario, so that callers from this scenario can be decoupled from
netfs_io_subrequest.

To reuse the hole detecting logic as mush as possible, both the
implementation of prepare_read() and prepare_ondemand_read() inside
Cachefiles call a common routine.

In the near future, prepare_read() will get enhanced and more
information will be needed and then returned to callers. Thus
netfs_io_subrequest is a reasonable candidate for holding places for all
these information needed in the internal implementation.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c                | 42 +++++++++++++++++++++++++------
 include/linux/netfs.h             |  7 ++++++
 include/trace/events/cachefiles.h |  4 +--
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 000a28f46e59..6427259fcba9 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -385,16 +385,11 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 				  term_func, term_func_priv);
 }
 
-/*
- * Prepare a read operation, shortening it to a cached/uncached
- * boundary as appropriate.
- */
-static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
-						      loff_t i_size)
+static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_io_subrequest *subreq,
+						       struct netfs_cache_resources *cres,
+						       loff_t i_size)
 {
 	enum cachefiles_prepare_read_trace why;
-	struct netfs_io_request *rreq = subreq->rreq;
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
 	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
 	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
@@ -501,6 +496,36 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 	return ret;
 }
 
+/*
+ * Prepare a read operation, shortening it to a cached/uncached
+ * boundary as appropriate.
+ */
+static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
+						      loff_t i_size)
+{
+	return cachefiles_do_prepare_read(subreq,
+			&subreq->rreq->cache_resources, i_size);
+}
+
+/*
+ * Prepare an on-demand read operation, shortening it to a cached/uncached
+ * boundary as appropriate.
+ */
+static enum netfs_io_source cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
+		loff_t start, size_t *_len, loff_t i_size)
+{
+	enum netfs_io_source source;
+	struct netfs_io_subrequest subreq = {
+		.start	= start,
+		.len	= *_len,
+		.flags	= 1 << NETFS_SREQ_ONDEMAND,
+	};
+
+	source = cachefiles_do_prepare_read(&subreq, cres, i_size);
+	*_len = subreq.len;
+	return source;
+}
+
 /*
  * Prepare for a write to occur.
  */
@@ -621,6 +646,7 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 	.write			= cachefiles_write,
 	.prepare_read		= cachefiles_prepare_read,
 	.prepare_write		= cachefiles_prepare_write,
+	.prepare_ondemand_read	= cachefiles_prepare_ondemand_read,
 	.query_occupancy	= cachefiles_query_occupancy,
 };
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index f2402ddeafbf..d82071c37133 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -267,6 +267,13 @@ struct netfs_cache_ops {
 			     loff_t *_start, size_t *_len, loff_t i_size,
 			     bool no_space_allocated_yet);
 
+	/* Prepare an on-demand read operation, shortening it to a cached/uncached
+	 * boundary as appropriate.
+	 */
+	enum netfs_io_source (*prepare_ondemand_read)(struct netfs_cache_resources *cres,
+						      loff_t start, size_t *_len,
+						      loff_t i_size);
+
 	/* Query the occupancy of the cache in a region, returning where the
 	 * next chunk of data starts and how long it is.
 	 */
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index d8d4d73fe7b6..655d5900b8ef 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -448,14 +448,14 @@ TRACE_EVENT(cachefiles_prep_read,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->rreq	= sreq->rreq->debug_id;
+		    __entry->rreq	= sreq->rreq ? sreq->rreq->debug_id : 0;
 		    __entry->index	= sreq->debug_index;
 		    __entry->flags	= sreq->flags;
 		    __entry->source	= source;
 		    __entry->why	= why;
 		    __entry->len	= sreq->len;
 		    __entry->start	= sreq->start;
-		    __entry->netfs_inode = sreq->rreq->inode->i_ino;
+		    __entry->netfs_inode = sreq->rreq ? sreq->rreq->inode->i_ino : 0;
 		    __entry->cache_inode = cache_inode;
 			   ),
 
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

