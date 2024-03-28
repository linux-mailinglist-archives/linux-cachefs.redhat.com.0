Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZFZS2YAMGQEESNJ3MA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3C890583
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:58 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6986eb55527sf8112086d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643877; cv=pass;
        d=google.com; s=arc-20160816;
        b=o2qobTLLPXpVAaoOyc7XHBR7P9IV7+5L+4XQ6cBDbXUjLH5dQMsZm9CNyYdaSAvPcd
         SAlKEON4NP4d0dMGJOP37RQoeRJNFXN9/xuyS/5g47ETcb10kYfND6p04S+nWBkww2FK
         OouIjdvo6sw7PdT8symO7uA1S+rmlSg3ne64DydLWHesCtHzN7Wr2Pms/b3kmJh+wgFP
         VCCBATzKiwNyE0rBFXbsQ9CrQCZkeCbZ9w4jxy8GtEwJV+ag2nH6LCxRaZVJZ0rJsV0l
         F+plYWy2Vk/RSZBcq/GcZY/oKcpMneSIde39m3HcZrsTvEpy3nYOiXD41AJkY7ZyNa9/
         tBew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=KslLtbfl/Gn1Fr/T5ClCQiGxRBJKe3/6fqN2vJ9WdIA=;
        fh=Lu2B0l99CjCKo/QcJdgg9zGHdN0wYXv3YfLI+bmd5kk=;
        b=JixgRBO4XI/nlIIEAnDR6RpBCZbPy2GIaeCKeNV0nz991V1l9KuIEdOna1Gr/3OWvZ
         ocfiuMFNLQFB1unrJzdM+Coo0tj2/b0m3Qz1bFOw3ERO4n3B0s4b7C8GGyLJQKxm8aBC
         EI1yH5hv7s38aBXrlgb75fGSjHKjhbBYMiOE7yclPIN+/tC3bCmcR0M5I7I15yERV51M
         68XrlgXYLK/1RNyXHaKY4IPjRYu+sea08TDNNrOZPUUws5Wj9RiIQJYOMJ4Yw7+5Gj3Y
         kBmSMvU3i922EJ97Xho7JnJBze2J2IVo/59HSY+7akBOZAeXSbdLn4VUOBCeBeRj61bZ
         yW3A==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643877; x=1712248677;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KslLtbfl/Gn1Fr/T5ClCQiGxRBJKe3/6fqN2vJ9WdIA=;
        b=uzwX0M4DjtUes8jg6jO5dvVnC3z4yyAN6czuLgUoaVW5F08dlTzQPvN+YUTiOhH+yG
         8Qwu6KG/SIa/cb1asDXfhhA93EW0oIXskUmGsIJwGIlzmdj/xtj6mg9EH0kjq7vsfFxJ
         veoFhFEZ2gqmltjjoEcse4DJBX2FLxegmx43VqlCXmWsWqtKUXLtP/4dLLZN9XeopMuT
         f5LxFVe7a3q4EQbfH2tl61Z7n4ltGDnpR/Y+tOmoS8TqEboUnTAPnOpQqT4WJd2VUxM+
         bItdELr73iFkLzDaBOb/5OkLrkhFM9lCVBNP0BOxiIGFOhzXjTkhkl01QwMP445ZhCei
         +Aww==
X-Forwarded-Encrypted: i=2; AJvYcCUUVFaRLGcLZNbg9RfWkGWed4cZ8CioLPY0j+aaY3/V/Dy3gA3SD3MdHZZx83XJqTR0AD2CiJC0K1GxO5qONvTc+EUJc05za81QSCw=
X-Gm-Message-State: AOJu0YwHpZtNTQwUCmtBDks5GP4TtygC0hODSTo952Tp6rrq4NJirTER
	T51arb64zmx7K5e/2a8d7k6jI1jqvulykc21/ztbPHfaPUsr1k2hlUZPJowsME0=
X-Google-Smtp-Source: AGHT+IEs1sjp07WCwEJitjcBI06+fRSdJ55cZCsOA7xRSaxYvxRis4vKLWtRctSoSSrhdR1VdoAuNw==
X-Received: by 2002:a0c:fe62:0:b0:696:9344:a281 with SMTP id b2-20020a0cfe62000000b006969344a281mr3124806qvv.34.1711643876960;
        Thu, 28 Mar 2024 09:37:56 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c81:0:b0:698:6bec:5259 with SMTP id o1-20020ad45c81000000b006986bec5259ls1540187qvh.1.-pod-prod-03-us;
 Thu, 28 Mar 2024 09:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtvhws97RtfkzR7ogZ+lii0dp/K68BuS/d47ySR3kfUPbQSralQJaLEEblQ5FCnCtYaTapllWhh/ahYoUi/UyiQjg89FxUuAqbBqo8Jek=
X-Received: by 2002:ad4:55f0:0:b0:696:a332:ae05 with SMTP id bu16-20020ad455f0000000b00696a332ae05mr2929361qvb.44.1711643876292;
        Thu, 28 Mar 2024 09:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643876; cv=none;
        d=google.com; s=arc-20160816;
        b=zaOWbSaqbvgKbbI6g3f1ArPFKOgi72K7YUkKTK58c5a67A4sX5rkRGpk3ZBWWr55hd
         1kXirmgfeel1nYrJsXwg6xPXkcllzdX8lOwP0cxzxAPAeDT1Tjz1rL8kZou+3IgxW4Hk
         U9PAR6SBr9RZQHDsaeyCprFisPxPycX5cN7uJcO03RS9pQSjPS+l8xXtalrLqqwRJYuw
         ZACWV/BGMMWkJPokaXajwtMiAKOe2R1RFiFfZn6NASkOsMrbWo+Nds+pMhsX++ytJITi
         qSCU/K2J2yW4m/66WOF7uW29BquvnsL8bj0hAm3rcJd1l/Zr9EP9PzoZ7XB15DRJt7Th
         ETqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=K7667ccFdpRzMigl57YVlQb0kfAbqZCsj5Cjk/duSxs=;
        fh=eNkeuWBuJiiZHvhWmkIgM3Sq5hhFRf7/CRRt+PVbNDI=;
        b=ySJzuN5Cp9uQbyy83utQPc9L0V9pNtxO3uxt6OGde1Q2LR786/4c90PWiPE+MVlE3u
         PWkwrGvsvBWpIwa7tUjgt7uMJ4myLW1RGG718sIrTY/XorQ4P5BsqGi+2+xQ4yUDWyab
         Hg26XsX2laro7faNETUhWxLbTm1Y3L1sV1JsXicZQ6QZ00qFAPKzbw49ZdFGYhjgaoqq
         4FSWcT/Q/PE2wJr7oBv11ZnbUJdJaII76OdcsTLNVHVq7yWQOrwVuqS+Ah78dYBfs7ZJ
         2rkO5FQUPJn9FRn+5fCbqM4Thf7Va+8+wIO5MD5Z5lonApDobRD/tab37aYx3o6K2SkW
         7IdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id j18-20020a056214033200b006969f0a2f31si1753036qvu.360.2024.03.28.09.37.56
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-W4ck71GOPkmalLtjVhraYw-1; Thu, 28 Mar 2024 12:37:54 -0400
X-MC-Unique: W4ck71GOPkmalLtjVhraYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3FC5101A523
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:37:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id F0D221C060D4; Thu, 28 Mar 2024 16:37:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A33411C05E1C;
	Thu, 28 Mar 2024 16:37:50 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH 16/26] netfs: Switch to using unsigned long long rather than loff_t
Date: Thu, 28 Mar 2024 16:34:08 +0000
Message-ID: <20240328163424.2781320-17-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Switch to using unsigned long long rather than loff_t in netfslib to avoid
problems with the sign flipping in the maths when we're dealing with the
byte at position 0x7fffffffffffffff.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: Xiubo Li <xiubli@redhat.com>
cc: netfs@lists.linux.dev
cc: ceph-devel@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/cachefiles/io.c           |  2 +-
 fs/ceph/addr.c               |  2 +-
 fs/netfs/buffered_read.c     |  4 +++-
 fs/netfs/buffered_write.c    |  2 +-
 fs/netfs/io.c                |  6 +++---
 fs/netfs/main.c              |  2 +-
 fs/netfs/output.c            |  4 ++--
 include/linux/netfs.h        | 16 +++++++++-------
 include/trace/events/netfs.h |  6 +++---
 9 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 1d685357e67f..5ba5c7814fe4 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -493,7 +493,7 @@ cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
  * boundary as appropriate.
  */
 static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
-						    loff_t i_size)
+						    unsigned long long i_size)
 {
 	return cachefiles_do_prepare_read(&subreq->rreq->cache_resources,
 					  subreq->start, &subreq->len, i_size,
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 2d0f13537c85..3bd58eaea231 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -193,7 +193,7 @@ static void ceph_netfs_expand_readahead(struct netfs_io_request *rreq)
 	 * block, but do not exceed the file size, unless the original
 	 * request already exceeds it.
 	 */
-	new_end = min(round_up(end, lo->stripe_unit), rreq->i_size);
+	new_end = umin(round_up(end, lo->stripe_unit), rreq->i_size);
 	if (new_end > end && new_end <= rreq->start + max_len)
 		rreq->len = new_end - rreq->start;
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 1622cce535a3..47603f08680e 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -130,7 +130,9 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 }
 
 static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
-					 loff_t *_start, size_t *_len, loff_t i_size)
+					 unsigned long long *_start,
+					 unsigned long long *_len,
+					 unsigned long long i_size)
 {
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
 
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 624d8859c2fa..8e4a3fb287e3 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -663,7 +663,7 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 	last = (wreq->start + wreq->len - 1) / PAGE_SIZE;
 	xas_for_each(&xas, folio, last) {
 		WARN(!folio_test_writeback(folio),
-		     "bad %zx @%llx page %lx %lx\n",
+		     "bad %llx @%llx page %lx %lx\n",
 		     wreq->len, wreq->start, folio->index, last);
 
 		if ((finfo = netfs_folio_info(folio))) {
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 8de581ac0cfb..6cfecfcd02e1 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -476,7 +476,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 
 set:
 	if (subreq->len > rreq->len)
-		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %zx\n",
+		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %llx\n",
 			rreq->debug_id, subreq->debug_index,
 			subreq->len, rreq->len);
 
@@ -513,7 +513,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	subreq->start		= rreq->start + rreq->submitted;
 	subreq->len		= io_iter->count;
 
-	_debug("slice %llx,%zx,%zx", subreq->start, subreq->len, rreq->submitted);
+	_debug("slice %llx,%zx,%llx", subreq->start, subreq->len, rreq->submitted);
 	list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 
 	/* Call out to the cache to find out what it can do with the remaining
@@ -588,7 +588,7 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
-		_debug("submit %llx + %zx >= %llx",
+		_debug("submit %llx + %llx >= %llx",
 		       rreq->start, rreq->submitted, rreq->i_size);
 		if (rreq->origin == NETFS_DIO_READ &&
 		    rreq->start + rreq->submitted >= rreq->i_size)
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 4805b9377364..5f0f438e5d21 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -62,7 +62,7 @@ static int netfs_requests_seq_show(struct seq_file *m, void *v)
 
 	rreq = list_entry(v, struct netfs_io_request, proc_link);
 	seq_printf(m,
-		   "%08x %s %3d %2lx %4d %3d @%04llx %zx/%zx",
+		   "%08x %s %3d %2lx %4d %3d @%04llx %llx/%llx",
 		   rreq->debug_id,
 		   netfs_origins[rreq->origin],
 		   refcount_read(&rreq->ref),
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index e586396d6b72..85374322f10f 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -439,7 +439,7 @@ static void netfs_submit_writethrough(struct netfs_io_request *wreq, bool final)
  */
 int netfs_advance_writethrough(struct netfs_io_request *wreq, size_t copied, bool to_page_end)
 {
-	_enter("ic=%zu sb=%zu ws=%u cp=%zu tp=%u",
+	_enter("ic=%zu sb=%llu ws=%u cp=%zu tp=%u",
 	       wreq->iter.count, wreq->submitted, wreq->wsize, copied, to_page_end);
 
 	wreq->iter.count += copied;
@@ -457,7 +457,7 @@ int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb)
 {
 	int ret = -EIOCBQUEUED;
 
-	_enter("ic=%zu sb=%zu ws=%u",
+	_enter("ic=%zu sb=%llu ws=%u",
 	       wreq->iter.count, wreq->submitted, wreq->wsize);
 
 	if (wreq->submitted < wreq->io_iter.count)
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 0b6c2c2d3c23..88269681d4fc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -149,7 +149,7 @@ struct netfs_io_subrequest {
 	struct work_struct	work;
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
-	loff_t			start;		/* Where to start the I/O */
+	unsigned long long	start;		/* Where to start the I/O */
 	size_t			len;		/* Size of the I/O */
 	size_t			transferred;	/* Amount of data transferred */
 	refcount_t		ref;
@@ -205,15 +205,15 @@ struct netfs_io_request {
 	atomic_t		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
-	size_t			submitted;	/* Amount submitted for I/O so far */
-	size_t			len;		/* Length of the request */
 	size_t			upper_len;	/* Length can be extended to here */
+	unsigned long long	submitted;	/* Amount submitted for I/O so far */
+	unsigned long long	len;		/* Length of the request */
 	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
 	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
-	loff_t			i_size;		/* Size of the file */
-	loff_t			start;		/* Start position */
+	unsigned long long	i_size;		/* Size of the file */
+	unsigned long long	start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
 	refcount_t		ref;
 	unsigned long		flags;
@@ -294,13 +294,15 @@ struct netfs_cache_ops {
 
 	/* Expand readahead request */
 	void (*expand_readahead)(struct netfs_cache_resources *cres,
-				 loff_t *_start, size_t *_len, loff_t i_size);
+				 unsigned long long *_start,
+				 unsigned long long *_len,
+				 unsigned long long i_size);
 
 	/* Prepare a read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.
 	 */
 	enum netfs_io_source (*prepare_read)(struct netfs_io_subrequest *subreq,
-					     loff_t i_size);
+					     unsigned long long i_size);
 
 	/* Prepare a write operation, working out what part of the write we can
 	 * actually do.
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 30769103638f..7126d2ea459c 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -280,7 +280,7 @@ TRACE_EVENT(netfs_sreq,
 		    __entry->start	= sreq->start;
 			   ),
 
-	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
+	    TP_printk("R=%08x[%x] %s %s f=%02x s=%llx %zx/%zx e=%d",
 		      __entry->rreq, __entry->index,
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
 		      __print_symbolic(__entry->what, netfs_sreq_traces),
@@ -320,7 +320,7 @@ TRACE_EVENT(netfs_failure,
 		    __entry->start	= sreq ? sreq->start : 0;
 			   ),
 
-	    TP_printk("R=%08x[%d] %s f=%02x s=%llx %zx/%zx %s e=%d",
+	    TP_printk("R=%08x[%x] %s f=%02x s=%llx %zx/%zx %s e=%d",
 		      __entry->rreq, __entry->index,
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
 		      __entry->flags,
@@ -436,7 +436,7 @@ TRACE_EVENT(netfs_write,
 		    __field(unsigned int,		cookie		)
 		    __field(enum netfs_write_trace,	what		)
 		    __field(unsigned long long,		start		)
-		    __field(size_t,			len		)
+		    __field(unsigned long long,		len		)
 			     ),
 
 	    TP_fast_assign(

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

