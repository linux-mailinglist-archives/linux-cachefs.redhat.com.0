Return-Path: <linux-cachefs+bncBDLIXLMFVAERBW7ZSCWAMGQEBPVEJMI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B381B771
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:48 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6da6608ac3csf896140a34.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165147; cv=pass;
        d=google.com; s=arc-20160816;
        b=KCBpZ0s5rVncRIL4RVPVxIdItMoji0/3HqyYWmD/ZnyN/d9p3mbsB7Zq7NEQ8ODWWD
         GBFYmnDZeNoFGmgo/ojh7eSkswOVloAl3x9H8fzBrNp2HjE73C7BcZHiEP738RRUo7mC
         wEOSnUiYg+WGAU+TTBE2+9R/eGO/UnBNk7ULRxhUk36XOj/DnA/jEUz6/U/Bj4WLAJtD
         V7H+i4UvNAAlb2js5mgjeD44Y+vHkdxvPz7o0N/GmBeyn4xOyl/t9NA/24ygVAg/QPBR
         fi03LPlmETffiJcRyYxMF9gQELcHrCmWILGA6P/Ab2Ve4dYnGUCd8Ot4yIAp50r+rQdu
         YHcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GVe2U7a849/vjNeXNVjsDGx5SpyuSOIY/s4HIMvhZE0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=vaDhrKK55yzY36VeWmzYCauFWqTXvKqDK13WYzibqAlyaoANuysPlS20YZd0AlkhJy
         S8dFshkoKA5zGdeOFZJm85yxlIZdCw2red035dzqFklsQvPVlgNmsys3BhKw5EuMR3D2
         8u5hRPZaZ4JLZbFhYiyu2CfbmRpmZ9BPQHJWxB7tGtFoGq9KYMXR33Lf12ECPYNMeCLl
         YzXtnXf9lmbqN6B0nxIWbkt3NhWOAARAz7aCsKrnt7uZO75VVcn8otYCzV+0dODJb8ly
         vZ6ev0ALLV2qRk78aydl05ja96r5VueTWC4EBR4fevV52NxL9GFDv91m3p1ZvtxL13v0
         +W3A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165147; x=1703769947;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVe2U7a849/vjNeXNVjsDGx5SpyuSOIY/s4HIMvhZE0=;
        b=vLseqOSLtud+uDni6Vja0UvhaYm24/P+5IdjDoYmqOr6z1LLhVEip0x0GZOSsjUvqP
         AL5qLVHhogpax89f1SqmYZ+iXUouCOwSbJ5am5577jKp0gAlMLVJlZ3DISvUoEW8dOF+
         6e4qOwErkkg372/gwwRhb55jMbki+y9eUTBrrScZqMLhJlT/dTDJTYF4IqUow4ybIhqw
         ocB8MrG9ZrYN2JpC7AAxrTk6bR3z7CkhxbWTBnYFFXR+X9UnZlPbUykuPkubEo+42xa9
         W6GDKIcNFjxYfsqOtQMyPYFVhuBECi370DszoAAAfNZ7NSWuQ9tjPXTCeYfQ7WBDXbdv
         uxUQ==
X-Gm-Message-State: AOJu0YwUZrtKfsuIhnLUy5btisDWEKGrNdPAhRImWQAs8nNk2eDB/qtu
	oyHRj2O08rPRBF7X+A/VVgDvrw==
X-Google-Smtp-Source: AGHT+IGiwPnz9o8c0c1KHTK7IsknCXQz+wZs8uQmZWLYtgt1KPOQKvW8X+Jd9uofYL4zcr28+IceiA==
X-Received: by 2002:a05:6830:1185:b0:6da:5218:46e8 with SMTP id u5-20020a056830118500b006da521846e8mr11553170otq.58.1703165147615;
        Thu, 21 Dec 2023 05:25:47 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1811:b0:427:9ac7:4744 with SMTP id
 t17-20020a05622a181100b004279ac74744ls1024539qtc.0.-pod-prod-09-us; Thu, 21
 Dec 2023 05:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:780:e026:bdce with SMTP id o6-20020a05620a2a0600b00780e026bdcemr10016641qkp.136.1703165146991;
        Thu, 21 Dec 2023 05:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165146; cv=none;
        d=google.com; s=arc-20160816;
        b=quLAPYWDqpSVYD3eHg44YiUSBO1ArT6CFbjUfQ3RNtIwnTDO+rKSBn90Bd4XIlyYUe
         GKImF7EQ4ao1If5oHgHFpBDIWPZh6DNHW8wfh8gq6oRsZG5yjLRz1aVDvh/p1SaGwabu
         Qv+mIgem+X+bBF/nNKfI3I9FFq231c1ZrmEbq6FLlub/7/lONWtVjBuCwR4v8lFnoU2c
         YtlcLUaFSh4PQheoUXajHKpvk/SyHpQc5TSIpf5krY9Kj0PbUjsvr5+/bYd0vsgE4J2P
         o9Mh6Blj/5xdyR7Z7RGSWhOOzpKwU3VAU2D2Vxwh1a3atyGtjT2cHNhWoZivxybIxZKj
         eDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=E8DHadUMrAmyrD2zJ9OBx3Yj4DJWS/EFe1NwcHoJl/4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=irA4RknUjXymrUgxODu459qhnP7ivP7YPZuZOLDPbMrFlQ2rzKU7KS2WiedKX+L31x
         WAd6xIWpiJZklPJIh5Ze7sVv+WYaS4eTqnf4hiitQ0eEgnOQfbZ1P7WdUzL6oWRU4mpG
         ZYFgd4fWnOtjZMAI7XJtsN5nb8bgtc/MwcoZ/AokrKNa6CVRw/bcpZTYYP6TtWZIwoaq
         RcQhuOB3zEtLVOubv2fO0cMngWyVd1mPlk2L3JKUVbz6m/qvvE4jXedxuoUEsWWs2cBI
         GtjfIx//q6Mnp8QQJc0j2mbvnnRQ+MfJXOEBQ+oJIixRkdFtE79rivzyqNnC4T/k7HKq
         v98g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id po5-20020a05620a384500b0077f113e7a7bsi1967246qkn.326.2023.12.21.05.25.46
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-fXq3JpVhNcSC60EDHCx3ew-1; Thu, 21 Dec 2023 08:25:45 -0500
X-MC-Unique: fXq3JpVhNcSC60EDHCx3ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A7F85CEA2
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 12E0F5190; Thu, 21 Dec 2023 13:25:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E56351D5;
	Thu, 21 Dec 2023 13:25:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 26/40] netfs: Make netfs_read_folio() handle streaming-write pages
Date: Thu, 21 Dec 2023 13:23:21 +0000
Message-ID: <20231221132400.1601991-27-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

netfs_read_folio() needs to handle partially-valid pages that are marked
dirty, but not uptodate in the event that someone tries to read a page was
used to cache data by a streaming write.

In such a case, make netfs_read_folio() set up a bvec iterator that points
to the parts of the folio that need filling and to a sink page for the data
that should be discarded and use that instead of i_pages as the iterator to
be written to.

This requires netfs_rreq_unlock_folios() to convert the page into a normal
dirty uptodate page, getting rid of the partial write record and bumping
the group pointer over to folio->private.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c     | 61 ++++++++++++++++++++++++++++++++++--
 include/trace/events/netfs.h |  2 ++
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 73a6e4d61f9d..950f63fc156a 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -16,6 +16,7 @@
 void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 {
 	struct netfs_io_subrequest *subreq;
+	struct netfs_folio *finfo;
 	struct folio *folio;
 	pgoff_t start_page = rreq->start / PAGE_SIZE;
 	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
@@ -87,6 +88,15 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 
 		if (!pg_failed) {
 			flush_dcache_folio(folio);
+			finfo = netfs_folio_info(folio);
+			if (finfo) {
+				trace_netfs_folio(folio, netfs_folio_trace_filled_gaps);
+				if (finfo->netfs_group)
+					folio_change_private(folio, finfo->netfs_group);
+				else
+					folio_detach_private(folio);
+				kfree(finfo);
+			}
 			folio_mark_uptodate(folio);
 		}
 
@@ -239,6 +249,7 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	struct address_space *mapping = folio_file_mapping(folio);
 	struct netfs_io_request *rreq;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
+	struct folio *sink = NULL;
 	int ret;
 
 	_enter("%lx", folio_index(folio));
@@ -259,12 +270,56 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
 
 	/* Set up the output buffer */
-	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
-			rreq->start, rreq->len);
+	if (folio_test_dirty(folio)) {
+		/* Handle someone trying to read from an unflushed streaming
+		 * write.  We fiddle the buffer so that a gap at the beginning
+		 * and/or a gap at the end get copied to, but the middle is
+		 * discarded.
+		 */
+		struct netfs_folio *finfo = netfs_folio_info(folio);
+		struct bio_vec *bvec;
+		unsigned int from = finfo->dirty_offset;
+		unsigned int to = from + finfo->dirty_len;
+		unsigned int off = 0, i = 0;
+		size_t flen = folio_size(folio);
+		size_t nr_bvec = flen / PAGE_SIZE + 2;
+		size_t part;
+
+		ret = -ENOMEM;
+		bvec = kmalloc_array(nr_bvec, sizeof(*bvec), GFP_KERNEL);
+		if (!bvec)
+			goto discard;
+
+		sink = folio_alloc(GFP_KERNEL, 0);
+		if (!sink)
+			goto discard;
+
+		trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
+
+		rreq->direct_bv = bvec;
+		rreq->direct_bv_count = nr_bvec;
+		if (from > 0) {
+			bvec_set_folio(&bvec[i++], folio, from, 0);
+			off = from;
+		}
+		while (off < to) {
+			part = min_t(size_t, to - off, PAGE_SIZE);
+			bvec_set_folio(&bvec[i++], sink, part, 0);
+			off += part;
+		}
+		if (to < flen)
+			bvec_set_folio(&bvec[i++], folio, flen - to, to);
+		iov_iter_bvec(&rreq->iter, ITER_DEST, bvec, i, rreq->len);
+	} else {
+		iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+				rreq->start, rreq->len);
+	}
 
 	ret = netfs_begin_read(rreq, true);
+	if (sink)
+		folio_put(sink);
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
-	return ret;
+	return ret < 0 ? ret : 0;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 8308b81f36be..082a5e717b58 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -118,9 +118,11 @@
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
 	EM(netfs_folio_trace_copy_to_cache,	"copy")		\
 	EM(netfs_folio_trace_end_copy,		"end-copy")	\
+	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
+	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\
 	EM(netfs_folio_trace_redirty,		"redirty")	\
 	EM(netfs_folio_trace_redirtied,		"redirtied")	\
 	EM(netfs_folio_trace_store,		"store")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

