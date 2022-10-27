Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A954260F298
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N6+yTfqDeIpcyajpBFra0N1bhUM6A3vu9+oZmQR4tnE=;
	b=VVGs0S1tslx0DL/ILDUiFQ3dtHjrp+4QCDi4gMz4NUXbyEBZzj2nM7ba8kD2wfNV0wZgrS
	T7FXiBvbz6pJD9f37j/Et9BypRZruNhm448Q7UUTRvQBcCL3T7UQelogmtpv2iyoi5uvwN
	NFau5EobryCzcR0aJ9Tj2IjM9Y0xkFg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-sk5HV5eBOA-W6t_H1vzWIQ-1; Thu, 27 Oct 2022 04:37:11 -0400
X-MC-Unique: sk5HV5eBOA-W6t_H1vzWIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F2033C02B8D;
	Thu, 27 Oct 2022 08:36:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E01362166B48;
	Thu, 27 Oct 2022 08:36:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BEA31947061;
	Thu, 27 Oct 2022 08:36:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D2FFD1946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6F9D2166BD5; Thu, 27 Oct 2022 08:36:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E8202166BC0
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A6B81C0690D
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:35:59 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-518-QiStLJCSNf2uBfsj4YO0ww-1; Thu, 27 Oct 2022 04:35:54 -0400
X-MC-Unique: QiStLJCSNf2uBfsj4YO0ww-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAtIcr_1666859749
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAtIcr_1666859749) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:51 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:40 +0800
Message-Id: <20221027083547.46933-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH 2/9] fscache,
 netfs: rename netfs_io_source as fscache_io_source
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
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fscache is now also used for local fs (e.g. erofs) in on-demand read
scenarios, which tends to access backing files with raw fscache API such
as fscache_read() instead of libnetfs.  Thus we'd better make raw
fscache APIs more neutral independent on libnetfs to facilitate those
who are not using libnetfs yet.

Rename netfs_io_source as fscache_io_source.  This is a cleanup without
logic change.

It is worth noting that the structure declaration is temporarily placed
in netfs.h, and will be moved to fscache.h when all related structures
are transformed to "fscache_" prefix finally.  The reason is that, in
the intermediate state during the transition, the declarations of
related structures are scattered among fscache.h and netfs.h.  This will
cause a bidirectional reference of these two headers, and compilation
error then.  As a work around, keep the declaration in netfs.h
temporarily.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c                | 10 ++++----
 fs/erofs/fscache.c                |  6 ++---
 fs/netfs/io.c                     | 42 +++++++++++++++----------------
 include/linux/netfs.h             | 14 +++++------
 include/trace/events/cachefiles.h |  4 +--
 include/trace/events/netfs.h      | 14 +++++------
 6 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index d5b6a2a75161..9214060b4781 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -389,7 +389,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
  * Prepare a read operation, shortening it to a cached/uncached
  * boundary as appropriate.
  */
-static enum netfs_io_source cachefiles_prepare_read(struct netfs_cache_resources *cres,
+static enum fscache_io_source cachefiles_prepare_read(struct netfs_cache_resources *cres,
 					loff_t *_start, size_t *_len,
 					unsigned long *_flags, loff_t i_size)
 {
@@ -399,7 +399,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_cache_resources
 	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
 	const struct cred *saved_cred;
 	struct file *file = cachefiles_cres_file(cres);
-	enum netfs_io_source ret = NETFS_DOWNLOAD_FROM_SERVER;
+	enum fscache_io_source ret = FSCACHE_DOWNLOAD_FROM_SERVER;
 	loff_t start = *_start;
 	size_t len = *_len;
 	loff_t off, to;
@@ -409,7 +409,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_cache_resources
 	_enter("%zx @%llx/%llx", len, start, i_size);
 
 	if (start >= i_size) {
-		ret = NETFS_FILL_WITH_ZEROES;
+		ret = FSCACHE_FILL_WITH_ZEROES;
 		why = cachefiles_trace_read_after_eof;
 		goto out_no_object;
 	}
@@ -483,7 +483,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_cache_resources
 	}
 
 	why = cachefiles_trace_read_have_data;
-	ret = NETFS_READ_FROM_CACHE;
+	ret = FSCACHE_READ_FROM_CACHE;
 	goto out;
 
 download_and_store:
@@ -494,7 +494,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_cache_resources
 			__clear_bit(NETFS_SREQ_ONDEMAND, _flags);
 			goto retry;
 		}
-		ret = NETFS_INVALID_READ;
+		ret = FSCACHE_INVALID_READ;
 	}
 out:
 	cachefiles_end_secure(cache, saved_cred);
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index a4013f9bdb5c..bf216478afa2 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -141,7 +141,7 @@ static void erofc_fscache_subreq_complete(void *priv,
 static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 				struct netfs_io_request *rreq, loff_t pstart)
 {
-	enum netfs_io_source source;
+	enum fscache_io_source source;
 	struct super_block *sb = rreq->mapping->host->i_sb;
 	struct netfs_io_subrequest *subreq;
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
@@ -179,8 +179,8 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 		source = cres->ops->prepare_read(cres, &subreq->start,
 				&subreq->len, &subreq->flags, LLONG_MAX);
 		if (WARN_ON(subreq->len == 0))
-			source = NETFS_INVALID_READ;
-		if (source != NETFS_READ_FROM_CACHE) {
+			source = FSCACHE_INVALID_READ;
+		if (source != FSCACHE_READ_FROM_CACHE) {
 			erofs_err(sb, "failed to fscache prepare_read (source %d)",
 				  source);
 			ret = -EIO;
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 297423220fb1..992f3eebd2ee 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -250,7 +250,7 @@ static void netfs_rreq_short_read(struct netfs_io_request *rreq,
 
 	netfs_get_subrequest(subreq, netfs_sreq_trace_get_short_read);
 	atomic_inc(&rreq->nr_outstanding);
-	if (subreq->source == NETFS_READ_FROM_CACHE)
+	if (subreq->source == FSCACHE_READ_FROM_CACHE)
 		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_CLEAR);
 	else
 		netfs_read_from_server(rreq, subreq);
@@ -276,9 +276,9 @@ static bool netfs_rreq_perform_resubmissions(struct netfs_io_request *rreq)
 	__clear_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags);
 	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
 		if (subreq->error) {
-			if (subreq->source != NETFS_READ_FROM_CACHE)
+			if (subreq->source != FSCACHE_READ_FROM_CACHE)
 				break;
-			subreq->source = NETFS_DOWNLOAD_FROM_SERVER;
+			subreq->source = FSCACHE_DOWNLOAD_FROM_SERVER;
 			subreq->error = 0;
 			netfs_stat(&netfs_n_rh_download_instead);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_download_instead);
@@ -310,7 +310,7 @@ static void netfs_rreq_is_still_valid(struct netfs_io_request *rreq)
 		return;
 
 	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
-		if (subreq->source == NETFS_READ_FROM_CACHE) {
+		if (subreq->source == FSCACHE_READ_FROM_CACHE) {
 			subreq->error = -ESTALE;
 			__set_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags);
 		}
@@ -401,10 +401,10 @@ void netfs_subreq_terminated(struct netfs_io_subrequest *subreq,
 	       transferred_or_error);
 
 	switch (subreq->source) {
-	case NETFS_READ_FROM_CACHE:
+	case FSCACHE_READ_FROM_CACHE:
 		netfs_stat(&netfs_n_rh_read_done);
 		break;
-	case NETFS_DOWNLOAD_FROM_SERVER:
+	case FSCACHE_DOWNLOAD_FROM_SERVER:
 		netfs_stat(&netfs_n_rh_download_done);
 		break;
 	default:
@@ -468,7 +468,7 @@ void netfs_subreq_terminated(struct netfs_io_subrequest *subreq,
 	goto out;
 
 failed:
-	if (subreq->source == NETFS_READ_FROM_CACHE) {
+	if (subreq->source == FSCACHE_READ_FROM_CACHE) {
 		netfs_stat(&netfs_n_rh_read_failed);
 		set_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags);
 	} else {
@@ -480,7 +480,7 @@ void netfs_subreq_terminated(struct netfs_io_subrequest *subreq,
 }
 EXPORT_SYMBOL(netfs_subreq_terminated);
 
-static enum netfs_io_source netfs_cache_prepare_read(struct netfs_io_subrequest *subreq,
+static enum fscache_io_source netfs_cache_prepare_read(struct netfs_io_subrequest *subreq,
 						       loff_t i_size)
 {
 	struct netfs_io_request *rreq = subreq->rreq;
@@ -490,26 +490,26 @@ static enum netfs_io_source netfs_cache_prepare_read(struct netfs_io_subrequest
 		return cres->ops->prepare_read(cres, &subreq->start,
 				&subreq->len, &subreq->flags, i_size);
 	if (subreq->start >= rreq->i_size)
-		return NETFS_FILL_WITH_ZEROES;
-	return NETFS_DOWNLOAD_FROM_SERVER;
+		return FSCACHE_FILL_WITH_ZEROES;
+	return FSCACHE_DOWNLOAD_FROM_SERVER;
 }
 
 /*
  * Work out what sort of subrequest the next one will be.
  */
-static enum netfs_io_source
+static enum fscache_io_source
 netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct netfs_io_subrequest *subreq)
 {
-	enum netfs_io_source source;
+	enum fscache_io_source source;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
 
 	source = netfs_cache_prepare_read(subreq, rreq->i_size);
-	if (source == NETFS_INVALID_READ)
+	if (source == FSCACHE_INVALID_READ)
 		goto out;
 
-	if (source == NETFS_DOWNLOAD_FROM_SERVER) {
+	if (source == FSCACHE_DOWNLOAD_FROM_SERVER) {
 		/* Call out to the netfs to let it shrink the request to fit
 		 * its own I/O sizes and boundaries.  If it shinks it here, it
 		 * will be called again to make simultaneous calls; if it wants
@@ -521,13 +521,13 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 
 		if (rreq->netfs_ops->clamp_length &&
 		    !rreq->netfs_ops->clamp_length(subreq)) {
-			source = NETFS_INVALID_READ;
+			source = FSCACHE_INVALID_READ;
 			goto out;
 		}
 	}
 
 	if (WARN_ON(subreq->len == 0))
-		source = NETFS_INVALID_READ;
+		source = FSCACHE_INVALID_READ;
 
 out:
 	subreq->source = source;
@@ -542,7 +542,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 				    unsigned int *_debug_index)
 {
 	struct netfs_io_subrequest *subreq;
-	enum netfs_io_source source;
+	enum fscache_io_source source;
 
 	subreq = netfs_alloc_subrequest(rreq);
 	if (!subreq)
@@ -564,7 +564,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	 * again and ask it to download the next piece.
 	 */
 	source = netfs_rreq_prepare_read(rreq, subreq);
-	if (source == NETFS_INVALID_READ)
+	if (source == FSCACHE_INVALID_READ)
 		goto subreq_failed;
 
 	atomic_inc(&rreq->nr_outstanding);
@@ -573,13 +573,13 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
 	switch (source) {
-	case NETFS_FILL_WITH_ZEROES:
+	case FSCACHE_FILL_WITH_ZEROES:
 		netfs_fill_with_zeroes(rreq, subreq);
 		break;
-	case NETFS_DOWNLOAD_FROM_SERVER:
+	case FSCACHE_DOWNLOAD_FROM_SERVER:
 		netfs_read_from_server(rreq, subreq);
 		break;
-	case NETFS_READ_FROM_CACHE:
+	case FSCACHE_READ_FROM_CACHE:
 		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_IGNORE);
 		break;
 	default:
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b8171b3b9e2d..4cd7341c79b4 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -108,11 +108,11 @@ static inline int wait_on_page_fscache_killable(struct page *page)
 	return folio_wait_private_2_killable(page_folio(page));
 }
 
-enum netfs_io_source {
-	NETFS_FILL_WITH_ZEROES,
-	NETFS_DOWNLOAD_FROM_SERVER,
-	NETFS_READ_FROM_CACHE,
-	NETFS_INVALID_READ,
+enum fscache_io_source {
+	FSCACHE_FILL_WITH_ZEROES,
+	FSCACHE_DOWNLOAD_FROM_SERVER,
+	FSCACHE_READ_FROM_CACHE,
+	FSCACHE_INVALID_READ,
 } __mode(byte);
 
 typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
@@ -153,7 +153,7 @@ struct netfs_io_subrequest {
 	refcount_t		ref;
 	short			error;		/* 0 or error that occurred */
 	unsigned short		debug_index;	/* Index in list (for debugging output) */
-	enum netfs_io_source	source;		/* Where to read from/write to */
+	enum fscache_io_source	source;		/* Where to read from/write to */
 	unsigned long		flags;
 #define NETFS_SREQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
 #define NETFS_SREQ_CLEAR_TAIL		1	/* Set if the rest of the read should be cleared */
@@ -257,7 +257,7 @@ struct netfs_cache_ops {
 	/* Prepare a read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.
 	 */
-	enum netfs_io_source (*prepare_read)(struct netfs_cache_resources *cres,
+	enum fscache_io_source (*prepare_read)(struct netfs_cache_resources *cres,
 					     loff_t *_start, size_t *_len,
 					     unsigned long *_flags, loff_t i_size);
 
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 62da0596f65b..cb39fa750735 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -431,7 +431,7 @@ TRACE_EVENT(cachefiles_prep_read,
 	    TP_PROTO(loff_t start,
 		     size_t len,
 		     unsigned short flags,
-		     enum netfs_io_source source,
+		     enum fscache_io_source source,
 		     enum cachefiles_prepare_read_trace why,
 		     ino_t cache_inode),
 
@@ -439,7 +439,7 @@ TRACE_EVENT(cachefiles_prep_read,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned short,		flags		)
-		    __field(enum netfs_io_source,	source		)
+		    __field(enum fscache_io_source,	source		)
 		    __field(enum cachefiles_prepare_read_trace,	why	)
 		    __field(size_t,			len		)
 		    __field(loff_t,			start		)
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index beec534cbaab..abf506453125 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -36,10 +36,10 @@
 	E_(netfs_rreq_trace_unmark,		"UNMARK ")
 
 #define netfs_sreq_sources					\
-	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
-	EM(NETFS_DOWNLOAD_FROM_SERVER,		"DOWN")		\
-	EM(NETFS_READ_FROM_CACHE,		"READ")		\
-	E_(NETFS_INVALID_READ,			"INVL")		\
+	EM(FSCACHE_FILL_WITH_ZEROES,		"ZERO")		\
+	EM(FSCACHE_DOWNLOAD_FROM_SERVER,	"DOWN")		\
+	EM(FSCACHE_READ_FROM_CACHE,		"READ")		\
+	E_(FSCACHE_INVALID_READ,		"INVL")		\
 
 #define netfs_sreq_traces					\
 	EM(netfs_sreq_trace_download_instead,	"RDOWN")	\
@@ -195,7 +195,7 @@ TRACE_EVENT(netfs_sreq,
 		    __field(unsigned short,		index		)
 		    __field(short,			error		)
 		    __field(unsigned short,		flags		)
-		    __field(enum netfs_io_source,	source		)
+		    __field(enum fscache_io_source,	source		)
 		    __field(enum netfs_sreq_trace,	what		)
 		    __field(size_t,			len		)
 		    __field(size_t,			transferred	)
@@ -235,7 +235,7 @@ TRACE_EVENT(netfs_failure,
 		    __field(short,			index		)
 		    __field(short,			error		)
 		    __field(unsigned short,		flags		)
-		    __field(enum netfs_io_source,	source		)
+		    __field(enum fscache_io_source,	source		)
 		    __field(enum netfs_failure,		what		)
 		    __field(size_t,			len		)
 		    __field(size_t,			transferred	)
@@ -247,7 +247,7 @@ TRACE_EVENT(netfs_failure,
 		    __entry->index	= sreq ? sreq->debug_index : -1;
 		    __entry->error	= error;
 		    __entry->flags	= sreq ? sreq->flags : 0;
-		    __entry->source	= sreq ? sreq->source : NETFS_INVALID_READ;
+		    __entry->source	= sreq ? sreq->source : FSCACHE_INVALID_READ;
 		    __entry->what	= what;
 		    __entry->len	= sreq ? sreq->len : rreq->len;
 		    __entry->transferred = sreq ? sreq->transferred : 0;
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

