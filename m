Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYHPZCVQMGQE4CWJXLI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 6959580936F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:45 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1faf4442fa5sf2450601fac.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984224; cv=pass;
        d=google.com; s=arc-20160816;
        b=k34xt8kmKbAgfc7qkUBO2koFCaP/3STGnk46JJ5DeqvLzHIdVfzH/OwX0BujoCvGHj
         AeaQo3CWToJJzmIASZX2c/aXXKKhlje6bGJ6R4v36/yD5rCdZWGff6OXyTHn5ixKdGdv
         9SeojyOiDUEi2j+x757DeuzYrE+lOx3M/EOeGdVowi94EjB5l8WuYbU7HQ8VtzLO5E1Q
         22qSy50rAH7CQqzmHqKIr2ydoI4Te6DDgszEJTMF9EPk1LL73xfGEJPL+A58nMKtF46t
         z3XC1Xicua24pwLKtyNAKSLH/aaBlVM67DYp2I6FGKdlhRnv6G6yP3SJpyF/QwR4CD3T
         6g+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VtPmJNG6iC2M+KMuTeCA4f3Gu0u7SITmnR9d0CD4u4g=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=TYvPfAh2YxKIO2nL+pE+3Alb1mFTYUTK0gVxRxMwPO1YxP/N1ByKSKN4rQOmzB/HIW
         fTSdz1FiRgqWXPw9ODRFmOB27/UV1cIM+59kn20nOzizKzh5zDDkcpSk+VSTfP84sYns
         PKpM7qCt6IqG5OJXwJtPNsKVjNs/PRjYDOfzfAhEei6i+7mMMeSiuwdHbK/LZi4xsLfA
         R5i8dsQ84twOLUV39EIiRx5Rbejo1rZeW7tuKYKvsZ9QeCnsgsaQY3hoXnFIC0EY74tN
         hWD2Qb7kMoqKSw66FaVNQZ6/wRSyfE2kLe3P5Q86q0deiiAU95HPMYq6ZxIEWM2hHoeN
         yFXA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984224; x=1702589024;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtPmJNG6iC2M+KMuTeCA4f3Gu0u7SITmnR9d0CD4u4g=;
        b=QF6C3YxzI0QI2/g67C7z5wChuZ4RzM1uhWComh4h4VjQqbAJ0qbAk1nFHIg1aJoPvW
         B5TcXREWFttQbuCDksZSA71PuG15OxA2cN9wUndNNRaV6X4oVUcuC4O/7OH90QFGLjEz
         1ZSKA9ZgQcwzry0AS6rsBfqXqtJI0LMamb23cfU1zDLPca/imdmkqebglIou1Sb8NR0F
         /AvOHstcnRvdprRfDhenutbyYs5TnraAwEOAMPVlsLLyBTT1Rem/OcbRHe5gg8f/VL8s
         7bz1r72r12/n9o35AFZKHLLFuwe8B4gAdswTkf9DxE9JUSjG3gtvGNbfpln+6JN8xaM3
         DCKg==
X-Gm-Message-State: AOJu0YyRDrYd5IjMIamQZvjNOe6oFYNkVMGCjyL0uxy347NcQhpQFZVy
	ipniBkURHytxNJI0F5WOZvxKDg==
X-Google-Smtp-Source: AGHT+IFAWQx0RQ3JvHuzjm+iF67Q71N0cV/5Z61cmZndz5HjRj2oPjgQq31Z0/gmu+ecaqyY6fSdHg==
X-Received: by 2002:a05:6870:d151:b0:1fa:26e7:c428 with SMTP id f17-20020a056870d15100b001fa26e7c428mr3840047oac.19.1701984224328;
        Thu, 07 Dec 2023 13:23:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:4c89:b0:1fb:2a88:39cb with SMTP id
 pi9-20020a0568704c8900b001fb2a8839cbls1282760oab.0.-pod-prod-01-us; Thu, 07
 Dec 2023 13:23:43 -0800 (PST)
X-Received: by 2002:a05:6870:a248:b0:1fa:db26:789b with SMTP id g8-20020a056870a24800b001fadb26789bmr3457773oai.31.1701984223776;
        Thu, 07 Dec 2023 13:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984223; cv=none;
        d=google.com; s=arc-20160816;
        b=wLr6efbC2KvLJP06+Pxuh4bNElKVo9ZnVSIebZ8SqcouSgXFKmDd/xfp59wrRdeDv1
         Eq0iZKwm7eRcNgeBT7GKykU0qaFgUovKLYzgMWXa47aZT9GDbO8F1mbV8/1gEiEeR4xt
         eC5MiMmSuTJNojsUxIj7bBBwZzNKCf0d2Pt5JogqpYtBHtrgqAmnnMOAi3hDC69PDme8
         bpc4CEH4IbY/XjR3YFUTd6V7aK516+8TyGu9ff/guYwK2TDX97r5pLxm8F9C6gLUZ4j+
         /uC9iX3QXsVpK69N10+pXI9dx2v42YYUxfXH0OdLn1OjzM50iMnj5w3JuwCgma+c7Me9
         wplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=n7vsxkTeFDyw/Xz/jQpnFttohdwf2WdzS8Vx6FHSJ3Y=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=QV9s8ueQmCaXITk1hKe0lojxrhPQbsGeBsXqRlg6Q1cxTPMKc0PZuRLC+GWpzjNIKB
         iSHiH6UyKEaYiqtgTuXG5GerDJFtln23XRnGyi0GgUorhtKJ//VnWJ3IiUvf6nLzoVX+
         a8vIFt0ItfFArGDLTdDpJ8Kbv31xbHyVihiMjPPRSxRDOm5KAa1AuAWQrDEsL/kSTHhD
         rIFM4XCIMc3Sq0xvb42K4oDFG5+jaOejVd31UoVJFLm1Q/tgdeS5QcMqWEJkhS235Y7F
         InCt0cbXUCT/T4xYV1gEFhFV7iWOR28PSH5y49RULweJYjWP29DXHkfsxTOg/wP84QOV
         sukg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id f36-20020a05622a1a2400b004254341a858si734974qtb.643.2023.12.07.13.23.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-dIGpX-ysMV-XFOCZR8g0rw-1; Thu,
 07 Dec 2023 16:23:42 -0500
X-MC-Unique: dIGpX-ysMV-XFOCZR8g0rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E44F129AC011
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E12221C060BC; Thu,  7 Dec 2023 21:23:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 469821C060AF;
	Thu,  7 Dec 2023 21:23:39 +0000 (UTC)
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
Subject: [PATCH v3 26/59] netfs: Make netfs_read_folio() handle streaming-write pages
Date: Thu,  7 Dec 2023 21:21:33 +0000
Message-ID: <20231207212206.1379128-27-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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
cc: Jeff Layton <jlayton@kernel.org>
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

